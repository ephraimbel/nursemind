import Foundation

// Publication requires independent clinical review; the opt-in flag is for local review only.
enum RecentEvidenceDrafts {
    static let entries: [LibraryEntry] = {
#if DEBUG && RECENT_EVIDENCE_REVIEW
        return [
            .drug(entry0),
            .drug(entry1),
            .drug(entry2),
            .drug(entry3),
            .drug(entry4),
            .drug(entry5),
            .lab(entry6),
            .lab(entry7),
            .reference(entry8),
            .reference(entry9),
            .reference(entry10),
            .reference(entry11),
            .reference(entry12),
            .reference(entry13)
        ]
#else
        return []
#endif
    }()

    static func entryIDs(for topic: String) -> [String] {
#if DEBUG && RECENT_EVIDENCE_REVIEW
        switch topic {
        case "behavioral-health": return ["drug:zuranolone"]
        case "cardiovascular": return ["reference:oral-semaglutide-cardiovascular-evidence", "reference:blood-pressure-diabetes-evidence"]
        case "community-home-care": return ["lab:self-collected-vaginal-hpv-testing", "reference:lenacapavir-hiv-prevention-evidence", "reference:rsv-adult-vaccination-evidence", "reference:obesity-medication-comparison-evidence", "reference:blood-pressure-diabetes-evidence"]
        case "endocrine-metabolic": return ["reference:obesity-medication-comparison-evidence", "reference:diabetic-kidney-combination-evidence", "reference:oral-semaglutide-cardiovascular-evidence", "reference:blood-pressure-diabetes-evidence"]
        case "infection-prevention": return ["drug:gepotidacin", "reference:lenacapavir-hiv-prevention-evidence", "reference:rsv-adult-vaccination-evidence"]
        case "labs-specimens": return ["lab:plasma-p-tau217-amyloid-ratio", "lab:self-collected-vaginal-hpv-testing"]
        case "maternity-newborn": return ["drug:zuranolone", "lab:self-collected-vaginal-hpv-testing"]
        case "medication-transfusion-safety": return ["drug:suzetrigine", "drug:gepotidacin", "drug:brensocatib", "drug:nerandomilast", "drug:donanemab", "drug:zuranolone"]
        case "neurological": return ["drug:donanemab", "lab:plasma-p-tau217-amyloid-ratio"]
        case "older-adult-care": return ["drug:donanemab", "lab:plasma-p-tau217-amyloid-ratio", "reference:rsv-adult-vaccination-evidence"]
        case "perioperative-nursing": return ["drug:suzetrigine"]
        case "renal-urinary": return ["drug:gepotidacin", "reference:diabetic-kidney-combination-evidence"]
        case "respiratory": return ["drug:brensocatib", "drug:nerandomilast", "reference:rsv-adult-vaccination-evidence"]
        default: return []
        }
#else
        return []
#endif
    }

#if DEBUG && RECENT_EVIDENCE_REVIEW
    private static let entry0 = DrugEntry(
        id: "suzetrigine",
        title: "Suzetrigine",
        subtitle: "Journavx · acute pain evidence",
        category: "NaV1.8 sodium-channel blocker",
        isHighAlert: false,
        isHighRisk: false,
        quickReference: [],
        indications: .init("FDA approved suzetrigine for moderate-to-severe acute pain in adults, including postoperative pain. The 2025 phase 3 report describes randomized trials after abdominoplasty and bunionectomy, enrolling 1,118 and 1,073 adults respectively. Participants received suzetrigine, hydrocodone–acetaminophen or placebo during a 48-hour comparison. Suzetrigine improved the primary pain-intensity endpoint versus placebo in both trials. The active-comparator results should not be described as proof that suzetrigine outperforms opioid analgesia. These short postoperative studies do not establish long-term efficacy for chronic pain, and their defined surgical populations limit generalization to every acute-pain presentation. The FDA approval and the published trial answer different questions: labeled eligibility versus the strength and scope of the supporting evidence.", citationIDs: ["recent_evidence_suzetrigine_fda", "recent_evidence_suzetrigine_trial"]),
        mechanism: .init("Suzetrigine blocks NaV1.8 channels in peripheral sensory neurons, reducing pain-signal transmission; its active metabolite also inhibits this channel.", citationIDs: ["recent_evidence_suzetrigine_label"]),
        dosing: [],
        contraindications: .init("Strong CYP3A inhibitors are contraindicated with Journavx.", citationIDs: ["recent_evidence_suzetrigine_label"]),
        warnings: [
            .init("Moderate hepatic impairment requires a modified regimen; the label advises avoiding use in severe hepatic impairment. Treatment beyond 14 days has not been studied.", citationIDs: ["recent_evidence_suzetrigine_label"]),
            .init("Hormonal contraceptives containing progestins other than levonorgestrel or norethindrone require additional nonhormonal or alternative contraception during treatment and for 28 days afterward.", citationIDs: ["recent_evidence_suzetrigine_label"])
        ],
        adverseReactions: .init("Reported adverse reactions include itching, muscle spasms, increased creatine phosphokinase and rash.", citationIDs: ["recent_evidence_suzetrigine_label"]),
        drugInteractions: [
            .init("Moderate CYP3A inhibitors increase exposure and require dose modification. Strong or moderate CYP3A inducers can reduce efficacy; the label advises avoiding these combinations and grapefruit.", citationIDs: ["recent_evidence_suzetrigine_label"]),
            .init("Suzetrigine induces CYP3A and can reduce concentrations of sensitive substrates. Starting or stopping it can change the exposure of other medicines.", citationIDs: ["recent_evidence_suzetrigine_label"])
        ],
        citations: [RecentEvidenceSources.suzetrigine_fda, RecentEvidenceSources.suzetrigine_trial, RecentEvidenceSources.suzetrigine_label],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry1 = DrugEntry(
        id: "gepotidacin",
        title: "Gepotidacin",
        subtitle: "Blujepa · urinary and urogenital indications",
        category: "Bacterial type II topoisomerase inhibitor",
        isHighAlert: false,
        isHighRisk: true,
        quickReference: [],
        indications: .init("Gepotidacin has US indications for uncomplicated urinary tract infection and, following the December 2025 expansion, uncomplicated urogenital gonorrhea in eligible patients with limited or no alternatives. The gonorrhea approval rests on limited clinical safety data. EAGLE-1 compared oral gepotidacin with ceftriaxone plus azithromycin in an open-label, randomized non-inferiority trial. In the microbiological intention-to-treat population, urogenital microbiological success was 92.6% with gepotidacin and 91.2% with the comparator. Non-inferiority concerns the prespecified margin and endpoint; it does not establish superiority, unrestricted first-line use, or efficacy at pharyngeal and rectal sites. The expanded indication therefore must not be interpreted as a universal oral replacement for existing gonorrhea regimens.", citationIDs: ["recent_evidence_gepotidacin_fda", "recent_evidence_gepotidacin_trial"]),
        mechanism: .init("Gepotidacin inhibits bacterial DNA gyrase and topoisomerase IV, disrupting DNA replication.", citationIDs: ["recent_evidence_gepotidacin_label"]),
        dosing: [],
        contraindications: .init("A history of severe hypersensitivity to gepotidacin is a contraindication.", citationIDs: ["recent_evidence_gepotidacin_label"]),
        warnings: [
            .init("UTI eligibility is female patients aged at least 12 years and weighing at least 40 kg; gonorrhea eligibility requires age at least 12 years and weight at least 45 kg.", citationIDs: ["recent_evidence_gepotidacin_label"]),
            .init("QTc prolongation, cholinergic effects, anaphylaxis and C. difficile infection are important risks. Renal or hepatic impairment can increase exposure; severe impairment has label restrictions.", citationIDs: ["recent_evidence_gepotidacin_label"])
        ],
        adverseReactions: .init("Diarrhea, nausea, abdominal symptoms and vomiting are reported; tolerability differs between the UTI and gonorrhea regimens.", citationIDs: ["recent_evidence_gepotidacin_label"]),
        drugInteractions: [
            .init("CYP3A4 inhibitor and inducer restrictions differ by indication. Strong inhibitors are avoided for both; moderate inhibitors are additionally avoided with the gonorrhea regimen.", citationIDs: ["recent_evidence_gepotidacin_label"]),
            .init("QT-prolonging medicines, digoxin, cholinergic drugs and neuromuscular blockers require interaction review. The full label specifies the relevant monitoring and avoidance rules.", citationIDs: ["recent_evidence_gepotidacin_label"])
        ],
        citations: [RecentEvidenceSources.gepotidacin_fda, RecentEvidenceSources.gepotidacin_trial, RecentEvidenceSources.gepotidacin_label],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry2 = DrugEntry(
        id: "brensocatib",
        title: "Brensocatib",
        subtitle: "Brinsupri · bronchiectasis evidence",
        category: "Dipeptidyl peptidase 1 inhibitor",
        isHighAlert: false,
        isHighRisk: false,
        quickReference: [],
        indications: .init("Brensocatib is approved for non-cystic fibrosis bronchiectasis in adults and patients aged 12 years or older. ASPEN randomized 1,721 participants, including 41 adolescents, to two brensocatib regimens or placebo over 52 weeks. Annualized exacerbation rates were 1.02 and 1.04 with brensocatib versus 1.29 with placebo; corresponding rate ratios were 0.79 and 0.81. About 48.5% in each active group remained exacerbation-free, compared with 40.3% receiving placebo. The trial, funded by Insmed, supports fewer pulmonary exacerbations in the studied population. It does not establish treatment of cystic fibrosis, immediate relief during an acute exacerbation, or reversal of established airway damage. The small adolescent subgroup also limits the precision of age-specific efficacy estimates.", citationIDs: ["recent_evidence_brensocatib_fda", "recent_evidence_aspen"]),
        mechanism: .init("DPP1 inhibition reduces activation of inflammatory neutrophil serine proteases during neutrophil maturation. These enzymes contribute to neutrophil-mediated airway inflammation.", citationIDs: ["recent_evidence_brensocatib_label"]),
        dosing: [],
        contraindications: .init("The prescribing information lists no contraindications; this does not remove its precautions.", citationIDs: ["recent_evidence_brensocatib_label"]),
        warnings: [
            .init("New rash, dry skin or hyperkeratosis warrants assessment; the label recommends dermatology evaluation for new dermatologic findings.", citationIDs: ["recent_evidence_brensocatib_label"]),
            .init("Gingival and periodontal adverse reactions support regular dental checkups and routine dental hygiene during treatment.", citationIDs: ["recent_evidence_brensocatib_label"])
        ],
        adverseReactions: .init("Common reported reactions include upper respiratory infection, headache, rash, dry skin, hyperkeratosis and hypertension. Safety follow-up includes oral and skin symptoms as well as respiratory status.", citationIDs: ["recent_evidence_brensocatib_label"]),
        drugInteractions: [
            .init("Concurrent live attenuated vaccines have not been evaluated; the label recommends avoiding them because effects on vaccine safety and effectiveness are unknown.", citationIDs: ["recent_evidence_brensocatib_label"])
        ],
        citations: [RecentEvidenceSources.brensocatib_fda, RecentEvidenceSources.aspen, RecentEvidenceSources.brensocatib_label],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry3 = DrugEntry(
        id: "nerandomilast",
        title: "Nerandomilast",
        subtitle: "Jascayd · pulmonary fibrosis evidence",
        category: "Preferential PDE4B inhibitor",
        isHighAlert: false,
        isHighRisk: false,
        quickReference: [],
        indications: .init("Nerandomilast has adult indications for idiopathic pulmonary fibrosis and progressive pulmonary fibrosis. In FIBRONEER-IPF, 1,177 adults were randomized to two active regimens or placebo; 77.7% were already receiving nintedanib or pirfenidone. At 52 weeks, the adjusted difference in forced vital capacity decline versus placebo was 68.8 mL for the higher regimen and 44.9 mL for the lower regimen. Mean lung function still declined in all groups. These findings describe slower loss of FVC, not restored lung function or a demonstrated survival benefit. Diarrhea was more frequent with nerandomilast. Boehringer Ingelheim funded the trial. The FDA subsequently approved the separate progressive pulmonary fibrosis indication on its own evidence program.", citationIDs: ["recent_evidence_nerandomilast_fda", "recent_evidence_fibroneer"]),
        mechanism: .init("Nerandomilast preferentially inhibits PDE4B, increasing intracellular cyclic AMP and affecting fibrotic and inflammatory signaling.", citationIDs: ["recent_evidence_nerandomilast_label"]),
        dosing: [],
        contraindications: .init("The label lists no contraindications; treatment still requires review of tolerability and interacting medicines.", citationIDs: ["recent_evidence_nerandomilast_label"]),
        warnings: [
            .init("The August 2026 label allows swallowing tablets whole or dispersing them in water using its specific preparation instructions. This is not blanket permission to crush tablets or use other liquids.", citationIDs: ["recent_evidence_nerandomilast_label"]),
            .init("The lower regimen did not show efficacy when combined with pirfenidone in FIBRONEER-IPF. Dose reduction rules depend on concomitant therapy.", citationIDs: ["recent_evidence_nerandomilast_label"])
        ],
        adverseReactions: .init("Diarrhea, nausea, reduced appetite and decreased weight are among reported adverse reactions. Tolerability can affect continuation and requires reassessment.", citationIDs: ["recent_evidence_nerandomilast_label"]),
        drugInteractions: [
            .init("Strong CYP3A inhibitors increase exposure and require regimen modification. Strong inducers are avoided. Moderate inducers and pirfenidone reduce exposure and have distinct label instructions.", citationIDs: ["recent_evidence_nerandomilast_label"])
        ],
        citations: [RecentEvidenceSources.nerandomilast_fda, RecentEvidenceSources.fibroneer, RecentEvidenceSources.nerandomilast_label],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry4 = DrugEntry(
        id: "donanemab",
        title: "Donanemab",
        subtitle: "Kisunla · early Alzheimer disease",
        category: "Amyloid-directed monoclonal antibody",
        isHighAlert: false,
        isHighRisk: true,
        quickReference: [],
        indications: .init("Donanemab is an Alzheimer disease therapy initiated in the mild cognitive impairment or mild dementia stage represented in its trials. Treatment eligibility depends on confirming amyloid pathology. The completed 2025 TRAILBLAZER-ALZ 6 analysis compared modified and standard titration. By 76 weeks, ARIA with edema occurred in 15.6% versus 24.2%; amyloid reduction was similar. Symptomatic ARIA with edema occurred in 2.8% versus 4.8%, a difference that was not statistically significant. These findings support a safety advantage for the studied modified titration, but do not establish absence of hemorrhage risk or additional cognitive benefit. The study involved manufacturer investigators. Amyloid clearance and lower ARIA frequency should not be interpreted as a cure for dementia.", citationIDs: ["recent_evidence_donanemab_fda", "recent_evidence_alz6"]),
        mechanism: .init("Donanemab targets a modified form of amyloid beta in brain plaques and reduces plaque burden.", citationIDs: ["recent_evidence_donanemab_label"]),
        dosing: [],
        contraindications: .init("Serious hypersensitivity to donanemab or its excipients, including prior anaphylaxis, is a contraindication.", citationIDs: ["recent_evidence_donanemab_label"]),
        warnings: [
            .init("BOXED WARNING: Amyloid-related imaging abnormalities can involve edema or hemorrhage and may be serious or fatal. APOE ε4 homozygotes have greater risk; pretreatment testing and discussion of genetic implications inform counseling.", citationIDs: ["recent_evidence_donanemab_label"]),
            .init("The label requires baseline MRI and MRI before infusions 2, 3, 4 and 7, with additional evaluation for possible ARIA symptoms. Management depends on symptoms and imaging severity.", citationIDs: ["recent_evidence_donanemab_label"])
        ],
        adverseReactions: .init("ARIA, headache, infusion reactions and hypersensitivity are important reported adverse reactions. ARIA can be asymptomatic or cause focal neurologic symptoms resembling ischemic stroke.", citationIDs: ["recent_evidence_donanemab_label"]),
        drugInteractions: [
            .init("Anticoagulants and thrombolytics require particular caution because intracerebral hemorrhage can occur. Focal deficits require evaluation for ARIA as well as stroke before treatment decisions.", citationIDs: ["recent_evidence_donanemab_label"])
        ],
        citations: [RecentEvidenceSources.donanemab_fda, RecentEvidenceSources.alz6, RecentEvidenceSources.donanemab_label],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry5 = DrugEntry(
        id: "zuranolone",
        title: "Zuranolone",
        subtitle: "Zurzuvae · postpartum depression",
        category: "Neuroactive steroid · GABA-A modulator",
        isHighAlert: false,
        isHighRisk: true,
        quickReference: [],
        indications: .init("Zuranolone is approved for postpartum depression in adults. The pivotal 2023 placebo-controlled trial randomized 196 women with severe postpartum depression to a 14-day course. At day 15, mean improvement on the Hamilton Depression Rating Scale was 15.6 points with zuranolone versus 11.6 with placebo; the adjusted between-group difference was −4.0 points (95% CI −6.3 to −1.7). Symptom differences were also reported through day 45. This is short-term symptom evidence, not proof of indefinite remission after one course or an indication for every depressive disorder. The trial included manufacturer-affiliated investigators. A later correction changed a supplemental MADRS assessment date; the primary HAM-D result and study conclusions were unchanged.", citationIDs: ["recent_evidence_zuranolone_fda", "recent_evidence_zuranolone_trial", "recent_evidence_zuranolone_correction"]),
        mechanism: .init("Its postpartum depression mechanism is incompletely understood; positive allosteric modulation of GABA-A receptors is thought to contribute.", citationIDs: ["recent_evidence_zuranolone_label"]),
        dosing: [],
        contraindications: .init("No contraindications are listed in the prescribing information; the boxed warning remains essential.", citationIDs: ["recent_evidence_zuranolone_label"]),
        warnings: [
            .init("BOXED WARNING: Driving ability can be impaired. The label prohibits driving or hazardous activities requiring full alertness until at least 12 hours after each dose throughout treatment; patients cannot reliably judge their own impairment.", citationIDs: ["recent_evidence_zuranolone_label"]),
            .init("Sedation, confusion and falls can occur. Worsening depression or emerging suicidal thoughts require clinical reassessment. Animal findings support potential fetal harm; effective contraception is advised during treatment and for one week afterward.", citationIDs: ["recent_evidence_zuranolone_label"])
        ],
        adverseReactions: .init("Somnolence, dizziness, fatigue and diarrhea are reported. Additive CNS effects can increase respiratory depression risk.", citationIDs: ["recent_evidence_zuranolone_label"]),
        drugInteractions: [
            .init("Alcohol, opioids and other CNS depressants can increase impairment. Strong CYP3A4 inhibitors require dose modification; CYP3A4 inducers can reduce exposure and should be avoided under the label.", citationIDs: ["recent_evidence_zuranolone_label"])
        ],
        citations: [RecentEvidenceSources.zuranolone_fda, RecentEvidenceSources.zuranolone_trial, RecentEvidenceSources.zuranolone_correction, RecentEvidenceSources.zuranolone_label],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry6 = LabEntry(
        id: "plasma-p-tau217-amyloid-ratio",
        title: "Plasma p-tau217 / amyloid ratio",
        subtitle: "Alzheimer biomarkers · assay-specific interpretation",
        specimen: "Plasma",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cognition),
        referenceRanges: [],
        interpretationTiers: [],
        commonCauses: [
            .init(title: "What the cleared test measures", causes: ["The FDA-cleared Lumipulse G pTau217/β-Amyloid 1-42 Plasma Ratio measures two plasma biomarkers to help identify amyloid pathology. Its intended population is adults aged 55 years or older with signs or symptoms of cognitive decline evaluated in a specialized care setting. Clearance of this particular ratio does not establish interchangeability with every commercial p-tau217 assay."], citationIDs: ["recent_evidence_ptau_fda"]),
            .init(title: "What the FDA comparison found", causes: ["Among 499 cognitively impaired adults, 91.7% with positive results had amyloid confirmed by PET or cerebrospinal fluid testing; 97.3% with negative results had negative comparator testing. Fewer than 20% had indeterminate results. These are agreement or predictive findings in this selected population, not universal sensitivity and specificity estimates for asymptomatic screening."], citationIDs: ["recent_evidence_ptau_fda"]),
            .init(title: "2025 guideline context", causes: ["The Alzheimer’s Association guideline addresses objectively impaired patients assessed in specialized care. It distinguishes a triage test, which can identify who needs confirmation, from a test accurate enough to substitute for amyloid PET or cerebrospinal fluid testing. Its performance requirements apply to the specific test and intended role. Many available commercial tests do not meet those requirements."], citationIDs: ["recent_evidence_blood_biomarker_guideline"])
        ],
        nursingActions: [
            .init("The guideline retains a comprehensive clinical evaluation and attention to pretest probability. Interpretation depends on the exact assay, clinical setting and role of the result in the diagnostic workup; a biomarker should not replace that assessment.", citationIDs: ["recent_evidence_blood_biomarker_guideline"])
        ],
        watchFor: [
            .init("The FDA does not authorize this device as population screening or a stand-alone Alzheimer diagnosis. False-positive, false-negative and indeterminate results can lead to additional testing or inappropriate treatment if detached from clinical context.", citationIDs: ["recent_evidence_ptau_fda"]),
            .init("A threshold from a different platform is not validated merely because both tests measure phosphorylated tau. The guideline’s accuracy criteria are test-specific, and its recommendations are not an asymptomatic screening program.", citationIDs: ["recent_evidence_blood_biomarker_guideline"])
        ],
        citations: [RecentEvidenceSources.ptau_fda, RecentEvidenceSources.blood_biomarker_guideline],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry7 = LabEntry(
        id: "self-collected-vaginal-hpv-testing",
        title: "Self-collected vaginal HPV testing",
        subtitle: "Home collection · device and assay validation",
        specimen: "Self-collected vaginal specimen",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        referenceRanges: [],
        interpretationTiers: [],
        commonCauses: [
            .init(title: "What authorization covers", causes: ["The FDA’s 2025 Teal Wand authorization covers a prescription device for collecting a vaginal specimen for HPV molecular testing at home or in another private setting. The specimen must be tested using an FDA-approved molecular assay specifically validated with that device. Authorization therefore attaches to a collection-and-testing combination, rather than to any swab or any HPV laboratory test."], citationIDs: ["recent_evidence_hpv_fda"]),
            .init(title: "What SELF-CERV studied", causes: ["SELF-CERV compared self-collected and clinician-collected specimens in a nonrandomized, paired validation study at 16 US sites. Participants were aged 25–65 years; 599 had paired specimens and 582 entered the valid-sample analysis. Positive agreement for high-risk HPV was 95.2% (278/292; 95% CI 92.1–97.1). Sensitivity for high-grade dysplasia was 95.8% (46/48), with a wider confidence interval of 86.0–98.8%."], citationIDs: ["recent_evidence_self_cerv"]),
            .init(title: "What those results cannot establish", causes: ["The study evaluated test performance against paired clinical sampling, not a randomized reduction in cervical cancer mortality. The small number with high-grade dysplasia limits precision. Agreement within this device-and-assay study cannot be transferred to unvalidated collection kits, age groups outside the study, or every clinical screening and surveillance setting."], citationIDs: ["recent_evidence_self_cerv"])
        ],
        nursingActions: [
            .init("The collection device supplies a laboratory specimen; it does not itself read or diagnose HPV infection. Its prescription instructions and the laboratory’s validated collection, transport and testing pathway determine whether a sample is acceptable. The FDA authorization should be checked for the specific product used.", citationIDs: ["recent_evidence_hpv_fda"]),
            .init("The 2026 Enduring Guidelines update extends management recommendations to validated home-collected specimens. Follow-up differs for HPV 16/18 and other high-risk types; some positive results need a clinician-collected cervical specimen for cytology or dual-stain testing. Prior abnormal-result surveillance favors clinician collection. Home collection does not remove the need for that follow-up.", citationIDs: ["recent_evidence_hpv_enduring"])
        ],
        watchFor: [
            .init("Self-collection for HPV molecular testing is not cervical cytology. An HPV result alone is not a cancer diagnosis; further clinical management depends on the result and the applicable screening pathway. A device authorization does not set a universal rescreening interval.", citationIDs: ["recent_evidence_hpv_enduring"])
        ],
        citations: [RecentEvidenceSources.hpv_fda, RecentEvidenceSources.self_cerv, RecentEvidenceSources.hpv_enduring],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry8 = ReferenceEntry(
        id: "lenacapavir-hiv-prevention-evidence",
        title: "Lenacapavir for HIV prevention",
        subtitle: "PURPOSE trials · testing and continuity of care",
        eyebrow: "REFERENCE · STUDY EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        sections: [
            .bullets(title: "Current recommendation", [
            .init("CDC’s 2025 recommendation adds injectable lenacapavir every six months as a PrEP option for people weighing at least 35 kg who would benefit from HIV prevention. This prevention use has its own product and regimen; the existing lenacapavir HIV-treatment indication is not interchangeable with PrEP.", citationIDs: ["recent_evidence_lenacapavir_cdc"])
        ]),
            .bullets(title: "What the trials found", [
            .init("PURPOSE 2 evaluated men and gender-diverse people at risk for HIV. The modified intention-to-treat population included 2,179 receiving lenacapavir and 1,086 receiving daily tenofovir disoproxil fumarate–emtricitabine. Two infections occurred in the lenacapavir group. Its HIV incidence was substantially below estimated background incidence; comparison with a modeled background is distinct from comparison with the randomized active-control group. Capsid resistance detected in breakthrough infections is clinically important. The Gilead-funded trial does not establish that infection is impossible after an injection.", citationIDs: ["recent_evidence_purpose2"]),
            .init("PURPOSE 1 studied adolescent girls and young women in South Africa and Uganda. No HIV infections occurred among 2,134 lenacapavir recipients in the primary analysis. The study compared incidence with estimated background incidence and with oral prevention regimens. Its impressive trial result is bounded by follow-up, eligibility, testing and adherence support; it does not establish lifelong protection or cover all exposure contexts.", citationIDs: ["recent_evidence_purpose1"])
        ]),
            .bullets(title: "Testing and follow-up are part of the intervention", [
            .init("HIV testing before initiation and follow-up injections is essential: unrecognized infection under long-acting single-drug exposure can select resistance. CDC addresses laboratory antigen/antibody testing and HIV RNA testing, including suspected acute infection. Oral antibody-only tests are insufficiently sensitive for the recommended pathway. Exact testing and delayed-dose management should follow current product and CDC instructions.", citationIDs: ["recent_evidence_lenacapavir_cdc"]),
            .init("Injection-site pain and nodules are common, and nodules may persist. Switching from tenofovir-containing PrEP requires attention to hepatitis B, because stopping HBV-active medicines may need a separate treatment plan. Drug interactions, late injections and discontinuation require planned follow-up during the prolonged drug tail.", citationIDs: ["recent_evidence_lenacapavir_cdc"])
        ])
        ],
        citations: [RecentEvidenceSources.lenacapavir_cdc, RecentEvidenceSources.purpose2, RecentEvidenceSources.purpose1],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry9 = ReferenceEntry(
        id: "rsv-adult-vaccination-evidence",
        title: "Adult RSV vaccination evidence",
        subtitle: "2026 eligibility · duration of protection",
        eyebrow: "REFERENCE · STUDY EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        sections: [
            .bullets(title: "Eligibility and timing", [
            .init("CDC recommends a single RSV vaccine dose for all adults aged 75 years or older and adults aged 50–74 years at increased risk of severe RSV illness. The February 2026 guidance includes Arexvy, Abrysvo and mResvia, with no product preference for eligible adults. Prior vaccination matters: RSV vaccination is not currently an annual series, and previously vaccinated adults should not receive another dose at this time.", citationIDs: ["recent_evidence_rsv_cdc"]),
            .init("Relevant risk factors include specified chronic cardiac or pulmonary disease, immune compromise and other conditions listed by CDC. Vaccination can occur year-round; late summer or early fall usually best precedes the season. The adult recommendation is separate from maternal vaccination and infant antibody guidance.", citationIDs: ["recent_evidence_rsv_cdc"])
        ]),
            .bullets(title: "August 2026 durability study", [
            .init("DAN-RSV randomized adults aged at least 60 years to RSVpreF vaccine or no vaccine and followed two winter seasons. Of 131,379 randomized participants, 130,991 entered the second-season intention-to-treat analysis. The primary endpoint was RSV-related respiratory tract disease hospitalization. This was an open-label, pragmatic trial funded by Pfizer.", citationIDs: ["recent_evidence_dan_rsv"]),
            .init("Estimated effectiveness was 70.6% across both seasons (95% CI 39.1–87.0). The second-season estimate alone was 56.2%, with a confidence interval from −12.4% to 84.8%. That interval includes no benefit, so second-season precision is limited. Second-season hospitalization rates were low: 0.11 versus 0.25 events per 1,000 person-years.", citationIDs: ["recent_evidence_dan_rsv"])
        ]),
            .bullets(title: "Interpretation at the bedside", [
            .init("A positive combined-season result does not make the uncertain second-season estimate definitive. The study did not randomize booster timing, and results for RSVpreF should not automatically be assigned to every RSV vaccine platform. There was no apparent second-season difference in all-cause respiratory or cardiorespiratory hospitalization.", citationIDs: ["recent_evidence_dan_rsv"]),
            .init("CDC permits coadministration with other indicated vaccines, while noting limited evidence and potentially greater reactogenicity. Eligibility assessment, prior-dose history and current guidance remain the basis of the vaccination conversation.", citationIDs: ["recent_evidence_rsv_cdc"])
        ])
        ],
        citations: [RecentEvidenceSources.rsv_cdc, RecentEvidenceSources.dan_rsv],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry10 = ReferenceEntry(
        id: "obesity-medication-comparison-evidence",
        title: "Obesity medication comparison evidence",
        subtitle: "Tirzepatide and semaglutide · trial versus cohort",
        eyebrow: "REFERENCE · STUDY EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Randomized weight-loss evidence", [
            .init("SURMOUNT-5 randomized 751 adults with obesity but without type 2 diabetes to maximum-tolerated tirzepatide or semaglutide regimens in an open-label trial. Mean weight change at 72 weeks was −20.2% versus −13.7%. Gastrointestinal adverse effects were common, usually mild or moderate, and often occurred during dose escalation. Eli Lilly funded the trial.", citationIDs: ["recent_evidence_surmount5"]),
            .init("This comparison supports greater average weight loss under the trial’s regimens. It does not compare every dose or formulation, establish identical effects in people with diabetes, or demonstrate superiority for cardiovascular mortality. A mean response is not a promised individual outcome.", citationIDs: ["recent_evidence_surmount5"])
        ]),
            .bullets(title: "What a 2026 observational study adds", [
            .init("A TriNetX study matched 35,336 pairs of adults without diabetes who initiated tirzepatide or semaglutide for obesity. At 12 months, a composite of death, acute coronary syndrome, stroke or new heart failure occurred in 1.90% versus 2.18% (hazard ratio 0.86; 95% CI 0.77–0.97). The association was driven by new heart failure; individual death, coronary syndrome and stroke comparisons were not significant.", citationIDs: ["recent_evidence_obesity_cohort"]),
            .init("This retrospective study excluded people with prior heart failure and certain recent cardiovascular events. Matching reduces measured differences but cannot remove unmeasured confounding, prescribing selection or electronic-record limitations. It supplies an association, not randomized proof that one drug prevents more cardiovascular events. Its composite also differs from conventional three-point MACE.", citationIDs: ["recent_evidence_obesity_cohort"])
        ]),
            .bullets(title: "Patient-centered treatment context", [
            .init("NIDDK describes medication as part of a broader weight-management plan that includes eating, activity and behavioral support. Choice depends on health conditions, other medicines, likely benefit, adverse effects and cost. Weight regain after stopping is common, so follow-up includes the feasibility of continuing treatment rather than focusing only on an early scale change.", citationIDs: ["recent_evidence_obesity_niddk"]),
            .init("Medication review includes supplements and pregnancy plans. NIDDK advises against weight-management medicines during pregnancy or while planning pregnancy. Drug-specific warnings, tolerability and access belong in the treatment discussion alongside comparative weight-loss figures.", citationIDs: ["recent_evidence_obesity_niddk"])
        ])
        ],
        citations: [RecentEvidenceSources.surmount5, RecentEvidenceSources.obesity_cohort, RecentEvidenceSources.obesity_niddk],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry11 = ReferenceEntry(
        id: "diabetic-kidney-combination-evidence",
        title: "Combination therapy in diabetic kidney disease",
        subtitle: "CONFIDENCE · albuminuria and outcome limits",
        eyebrow: "REFERENCE · STUDY EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Who was studied", [
            .init("CONFIDENCE randomized adults with type 2 diabetes, chronic kidney disease and albuminuria to finerenone, empagliflozin or both. Eligibility included eGFR 30–90 mL/min/1.73 m² and urine albumin-to-creatinine ratio 100–5,000 mg/g. Participants were already taking a renin–angiotensin system inhibitor. The primary endpoint was UACR change at 180 days.", citationIDs: ["recent_evidence_confidence"])
        ]),
            .bullets(title: "What changed", [
            .init("Combination treatment produced a UACR reduction 29% greater than finerenone alone and 32% greater than empagliflozin alone. These are relative comparisons of albuminuria change, not percentage-point reductions in kidney failure. Symptomatic hypotension, acute kidney injury and hyperkalemia leading to discontinuation were uncommon during the trial. Bayer funded the study.", citationIDs: ["recent_evidence_confidence"])
        ]),
            .bullets(title: "What remains uncertain", [
            .init("An albuminuria endpoint over six months cannot by itself establish additional prevention of dialysis, cardiovascular death or long-term kidney failure. The eligibility restrictions also limit extrapolation to lower eGFR, absent albuminuria or people without diabetes. Uncommon short-term adverse events do not eliminate the need for individual safety monitoring.", citationIDs: ["recent_evidence_confidence"])
        ]),
            .bullets(title: "Understanding the laboratory follow-up", [
            .init("NIDDK describes UACR as a urine measure of albumin excretion corrected for urine concentration, while eGFR estimates filtration from blood-based markers. They represent related but different aspects of kidney disease. An improved urine result does not mean that the filtration estimate has become normal.", citationIDs: ["recent_evidence_uacr_niddk"]),
            .init("Spot UACR avoids the need for routine timed urine collection and is less affected by urine dilution than an albumin dipstick alone. Follow-up trends should preserve the reported units and distinction between albumin concentration and an albumin-to-creatinine ratio.", citationIDs: ["recent_evidence_uacr_niddk"]),
            .init("NIDDK uses both urine albumin and eGFR to identify and monitor kidney disease. A care discussion can therefore identify which marker changed and why it was measured, instead of treating any lower laboratory number as proof of fewer clinical events.", citationIDs: ["recent_evidence_uacr_niddk"])
        ])
        ],
        citations: [RecentEvidenceSources.confidence, RecentEvidenceSources.uacr_niddk],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry12 = ReferenceEntry(
        id: "oral-semaglutide-cardiovascular-evidence",
        title: "Oral semaglutide cardiovascular evidence",
        subtitle: "SOUL · primary outcomes and 2026 secondary analysis",
        eyebrow: "REFERENCE · STUDY EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "The randomized primary result", [
            .init("SOUL enrolled 9,650 adults aged at least 50 years with type 2 diabetes and established atherosclerotic cardiovascular disease, chronic kidney disease or both. Participants received oral semaglutide or placebo in addition to usual care. Over mean follow-up of 47.5 months, cardiovascular death, nonfatal myocardial infarction or nonfatal stroke occurred in 12.0% versus 13.8% (hazard ratio 0.86; 95% CI 0.77–0.96).", citationIDs: ["recent_evidence_soul"]),
            .init("The difference supports lower three-point MACE in this high-risk population. Confirmatory secondary outcomes, including major kidney disease events, were not significantly different. The trial was funded by Novo Nordisk. Its findings should not be generalized to all oral formulations, people without diabetes, or every lower-risk population.", citationIDs: ["recent_evidence_soul"])
        ]),
            .bullets(title: "What the 2026 heart-failure analysis found", [
            .init("The secondary analysis examined a composite of heart-failure hospitalization or urgent visits and cardiovascular death. The overall hazard ratio was 0.90 (95% CI 0.79–1.03), which did not establish a statistically significant reduction. The heart-failure-only outcome was likewise inconclusive, with hazard ratio 0.86 (95% CI 0.69–1.08).", citationIDs: ["recent_evidence_soul_hf"]),
            .init("Participants with baseline heart failure had a composite hazard ratio of 0.78 (95% CI 0.63–0.96); those without it had a hazard ratio of 1.01 (95% CI 0.84–1.20). However, the interaction P value was 0.06, and the study’s hierarchical testing limits matter. A significant result within one subgroup does not prove that effects differ between subgroups.", citationIDs: ["recent_evidence_soul_hf"])
        ]),
            .bullets(title: "How to describe the evidence accurately", [
            .init("The prespecified MACE benefit and the exploratory heart-failure findings answer different questions. Neither a subgroup result nor a favorable point estimate with a confidence interval crossing 1 should be described as definitive prevention of heart failure. The secondary analysis does not independently establish a new treatment indication.", citationIDs: ["recent_evidence_soul_hf"]),
            .init("The primary report concerns longer-term cardiovascular outcomes under a randomized regimen; it is not a dosing comparison or a patient-specific prescribing rule. Individual treatment decisions still depend on the relevant product indication and clinical assessment.", citationIDs: ["recent_evidence_soul"])
        ])
        ],
        citations: [RecentEvidenceSources.soul, RecentEvidenceSources.soul_hf],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry13 = ReferenceEntry(
        id: "blood-pressure-diabetes-evidence",
        title: "Blood-pressure targets in diabetes",
        subtitle: "BPROAD · 2026 synthesis and applicability",
        eyebrow: "REFERENCE · STUDY EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "BPROAD: the randomized comparison", [
            .init("BPROAD randomized 12,821 adults aged at least 50 years with type 2 diabetes and increased cardiovascular risk at 145 sites in China. The trial compared systolic targets below 120 and below 140 mm Hg. At one year, mean achieved systolic pressures were 121.6 and 133.2 mm Hg; assigned targets and achieved measurements are different quantities.", citationIDs: ["recent_evidence_bproad"]),
            .init("Over a median 4.2 years, the composite of nonfatal stroke, nonfatal myocardial infarction, heart-failure treatment or hospitalization, or cardiovascular death occurred at 1.65 versus 2.09 events per 100 person-years. The hazard ratio was 0.79 (95% CI 0.69–0.90). Symptomatic hypotension and hyperkalemia were more frequent with intensive treatment, although serious adverse events overall were similar.", citationIDs: ["recent_evidence_bproad"])
        ]),
            .bullets(title: "June 2026 evidence synthesis", [
            .init("A systematic review of nine trials involving 34,260 participants with type 2 diabetes found fewer major cardiovascular events with more intensive control: 7.9% versus 9.7%, pooled risk ratio 0.80 (95% CI 0.73–0.89). Stroke was reduced, while individual myocardial infarction, heart-failure and cardiovascular-death estimates were not significant.", citationIDs: ["recent_evidence_bp_meta"]),
            .init("Trials used different targets, some contributed diabetes subgroups, and several included other risk-factor interventions. Hypotension estimates were imprecise. The pooled result supports benefit in selected populations but cannot identify a universally optimal systolic number or remove the need to consider treatment harms. The review’s literature search ended in December 2025.", citationIDs: ["recent_evidence_bp_meta"])
        ]),
            .bullets(title: "Applying a target in context", [
            .init("The 2025 AHA/ACC guideline emphasizes reliable measurement, home monitoring and individualized care. Its overall treatment goal is below 130/80 mm Hg for most adults, with additional considerations for particular populations. A trial target should not be converted directly into an unsupervised medication change.", citationIDs: ["recent_evidence_bp_aha"]),
            .init("For a patient discussion, the relevant distinctions are the studied risk profile, assigned versus achieved pressure, and the adverse effects that accompanied intensification. BPROAD does not establish that every patient with diabetes benefits equally from its intensive strategy.", citationIDs: ["recent_evidence_bproad"])
        ])
        ],
        citations: [RecentEvidenceSources.bproad, RecentEvidenceSources.bp_meta, RecentEvidenceSources.bp_aha],
        lastSourceFidelityReview: "2026-09-19"
    )

#endif
}
