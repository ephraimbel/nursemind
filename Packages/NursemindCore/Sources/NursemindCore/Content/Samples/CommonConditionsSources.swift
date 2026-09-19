import Foundation

#if DEBUG && COMMON_CONDITIONS_REVIEW
enum CommonConditionsSources {
    static let t2dm = CitationSource(
        id: "common_conditions_t2dm",
        shortName: "NIDDK · Type 2 diabetes",
        detail: "Type 2 Diabetes. Foundation: definition, mechanism, symptoms and management; source last reviewed May 2017. Current criteria and treatment context are separately cited to ADA 2026.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/diabetes/overview/what-is-diabetes/type-2-diabetes",
        lastRetrieved: "2026-09-19"
    )

    static let ada_diagnosis = CitationSource(
        id: "common_conditions_ada_diagnosis",
        shortName: "ADA 2026 · Diagnosis and classification",
        detail: "Standards of Care in Diabetes—2026, section 2. DOI: 10.2337/dc26-S002. Diagnostic criteria and confirmation; original factual summary, not licensed full-text republication.",
        publisher: "American Diabetes Association",
        license: .factCitationOnly,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC12690183/",
        lastRetrieved: "2026-09-19"
    )

    static let ada_evaluation = CitationSource(
        id: "common_conditions_ada_evaluation",
        shortName: "ADA 2026 · Comprehensive evaluation",
        detail: "Standards of Care in Diabetes—2026, section 4. DOI: 10.2337/dc26-S004. Comprehensive evaluation and comorbidities.",
        publisher: "American Diabetes Association",
        license: .factCitationOnly,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC12690184/",
        lastRetrieved: "2026-09-19"
    )

    static let ada_pharmacology = CitationSource(
        id: "common_conditions_ada_pharmacology",
        shortName: "ADA 2026 · Glucose-lowering treatment",
        detail: "Standards of Care in Diabetes—2026, section 9. DOI: 10.2337/dc26-S009. Person-specific selection and cardiovascular/kidney benefits.",
        publisher: "American Diabetes Association",
        license: .factCitationOnly,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC12690185/",
        lastRetrieved: "2026-09-19"
    )

    static let ada_goals = CitationSource(
        id: "common_conditions_ada_goals",
        shortName: "ADA 2026 · Glycemia and intercurrent illness",
        detail: "Standards of Care in Diabetes—2026, section 6. DOI: 10.2337/dc26-S006. Individualized goals, hypoglycemia and intercurrent illness.",
        publisher: "American Diabetes Association",
        license: .factCitationOnly,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC12690178/",
        lastRetrieved: "2026-09-19"
    )

    static let ada_social = CitationSource(
        id: "common_conditions_ada_social",
        shortName: "ADA 2026 · Social context of care",
        detail: "Standards of Care in Diabetes—2026, section 1. DOI: 10.2337/dc26-S001. Recommendations 1.7–1.9 and interprofessional support.",
        publisher: "American Diabetes Association",
        license: .factCitationOnly,
        url: "https://diabetesjournals.org/care/article/49/Supplement_1/S13/163920/1-Improving-Care-and-Promoting-Health-in",
        lastRetrieved: "2026-09-19"
    )

    static let soul = CitationSource(
        id: "common_conditions_soul",
        shortName: "SOUL · Cardiovascular outcomes, 2025",
        detail: "McGuire DK et al. Oral Semaglutide and Cardiovascular Outcomes in High-Risk Type 2 Diabetes. 2025;392:2001–2012. DOI: 10.1056/NEJMoa2501006. PMID: 40162642. Randomized trial; Novo Nordisk funded.",
        publisher: "New England Journal of Medicine / Massachusetts Medical Society",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/40162642/",
        lastRetrieved: "2026-09-19"
    )

    static let hypoglycemia = CitationSource(
        id: "common_conditions_hypoglycemia",
        shortName: "NIDDK · Low blood glucose",
        detail: "NIDDK · Low blood glucose",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/diabetes/overview/preventing-problems/low-blood-glucose-hypoglycemia",
        lastRetrieved: "2026-09-19"
    )

    static let crises = CitationSource(
        id: "common_conditions_crises",
        shortName: "ADA/EASD and partner societies · Hyperglycemic crises, 2024",
        detail: "Umpierrez GE et al. Hyperglycemic Crises in Adults With Diabetes: A Consensus Report. Diabetes Care. 2024;47:1257–1275. DOI: 10.2337/dci24-0032. Recognition, SGLT2-associated euglycemic DKA and prevention.",
        publisher: "American Diabetes Association and partner societies",
        license: .factCitationOnly,
        url: "https://diabetesjournals.org/care/article/47/8/1257/156808/Hyperglycemic-Crises-in-Adults-With-Diabetes-A",
        lastRetrieved: "2026-09-19"
    )

    static let sick_days = CitationSource(
        id: "common_conditions_sick_days",
        shortName: "CDC · Managing sick days",
        detail: "Managing Sick Days. May 2024. Illness, monitoring, hydration and emergency signs; blanket continuation of diabetes pills is not reproduced because ADA 2026 provides drug-specific illness exceptions.",
        publisher: "Centers for Disease Control and Prevention",
        license: .publicDomain,
        url: "https://www.cdc.gov/diabetes/living-with/managing-sick-days.html",
        lastRetrieved: "2026-09-19"
    )

    static let ada_hospital = CitationSource(
        id: "common_conditions_ada_hospital",
        shortName: "ADA 2026 · Diabetes in hospital",
        detail: "Standards of Care in Diabetes—2026, section 16. DOI: 10.2337/dc26-S016. Type 1 basal-insulin continuity and SGLT2 precautions during acute illness.",
        publisher: "American Diabetes Association",
        license: .factCitationOnly,
        url: "https://diabetesjournals.org/care/article/49/Supplement_1/S339/163925/16-Diabetes-Care-in-the-Hospital-Standards-of-Care",
        lastRetrieved: "2026-09-19"
    )

    static let bp_overview = CitationSource(
        id: "common_conditions_bp_overview",
        shortName: "NHLBI · High blood pressure overview",
        detail: "NHLBI · High blood pressure overview",
        publisher: "NHLBI, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/high-blood-pressure",
        lastRetrieved: "2026-09-19"
    )

    static let bp_diagnosis = CitationSource(
        id: "common_conditions_bp_diagnosis",
        shortName: "NHLBI · Blood-pressure diagnosis",
        detail: "High Blood Pressure: Diagnosis. Updated June 26, 2025. Standardized measurements, adult categories and out-of-office readings.",
        publisher: "NHLBI, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/high-blood-pressure/diagnosis",
        lastRetrieved: "2026-09-19"
    )

    static let bp_causes = CitationSource(
        id: "common_conditions_bp_causes",
        shortName: "NHLBI · Blood-pressure causes and risk factors",
        detail: "NHLBI · Blood-pressure causes and risk factors",
        publisher: "NHLBI, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/high-blood-pressure/causes",
        lastRetrieved: "2026-09-19"
    )

    static let bp_symptoms = CitationSource(
        id: "common_conditions_bp_symptoms",
        shortName: "NHLBI · Blood-pressure symptoms and complications",
        detail: "NHLBI · Blood-pressure symptoms and complications",
        publisher: "NHLBI, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/high-blood-pressure/symptoms",
        lastRetrieved: "2026-09-19"
    )

    static let bp_treatment = CitationSource(
        id: "common_conditions_bp_treatment",
        shortName: "NHLBI · Blood-pressure treatment",
        detail: "High Blood Pressure: Treatment. Updated April 30, 2024. NIH-authored lifestyle and medication-class prose only; Nucleus Medical Media animation excluded. Target/threshold updates use AHA/ACC 2025 separately.",
        publisher: "NHLBI, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/high-blood-pressure/treatment",
        lastRetrieved: "2026-09-19"
    )

    static let bp_followup = CitationSource(
        id: "common_conditions_bp_followup",
        shortName: "NHLBI · Living with high blood pressure",
        detail: "NHLBI · Living with high blood pressure",
        publisher: "NHLBI, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/high-blood-pressure/living-with",
        lastRetrieved: "2026-09-19"
    )

    static let aha_bp = CitationSource(
        id: "common_conditions_aha_bp",
        shortName: "AHA/ACC 2025 · Adult hypertension guideline",
        detail: "Official guideline summary, August 14, 2025. Guideline DOI: 10.1161/CIR.0000000000001356. Adult thresholds, PREVENT risk, goals and severe hypertension context.",
        publisher: "American Heart Association / American College of Cardiology",
        license: .factCitationOnly,
        url: "https://professional.heart.org/en/science-news/2025-high-blood-pressure-guideline/top-things-to-know",
        lastRetrieved: "2026-09-19"
    )

    static let bproad = CitationSource(
        id: "common_conditions_bproad",
        shortName: "BPROAD · Intensive blood-pressure control, 2025",
        detail: "Bi Y et al. Intensive Blood-Pressure Control in Patients with Type 2 Diabetes. 2025;392:1155–1167. DOI: 10.1056/NEJMoa2412006. PMID: 39555827. Online 2024; print 2025. Randomized trial at 145 sites in China.",
        publisher: "New England Journal of Medicine / Massachusetts Medical Society",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/39555827/",
        lastRetrieved: "2026-09-19"
    )

    static let low_bp = CitationSource(
        id: "common_conditions_low_bp",
        shortName: "NHLBI · Low blood pressure",
        detail: "NHLBI · Low blood pressure",
        publisher: "NHLBI, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/low-blood-pressure",
        lastRetrieved: "2026-09-19"
    )

    static let kdigo = CitationSource(
        id: "common_conditions_kdigo",
        shortName: "KDIGO 2024 · CKD and RAS-inhibitor monitoring",
        detail: "KDIGO 2024 Clinical Practice Guideline for the Evaluation and Management of Chronic Kidney Disease. Kidney International. 105(Suppl 4S):S117–S314. Practice points 3.6.2–3.6.5, printed S159 / PDF page 44. CKD-specific monitoring.",
        publisher: "Kidney Disease: Improving Global Outcomes",
        license: .factCitationOnly,
        url: "https://kdigo.org/wp-content/uploads/2024/03/KDIGO-2024-CKD-Guideline.pdf",
        lastRetrieved: "2026-09-19"
    )

    static let obesity_definition = CitationSource(
        id: "common_conditions_obesity_definition",
        shortName: "NIDDK · Adult obesity definition",
        detail: "NIDDK · Adult obesity definition",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/weight-management/adult-overweight-obesity/definition-facts",
        lastRetrieved: "2026-09-19"
    )

    static let obesity_causes = CitationSource(
        id: "common_conditions_obesity_causes",
        shortName: "NIDDK · Factors affecting weight and health",
        detail: "NIDDK · Factors affecting weight and health",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/weight-management/adult-overweight-obesity/factors-affecting-weight-health",
        lastRetrieved: "2026-09-19"
    )

    static let obesity_risks = CitationSource(
        id: "common_conditions_obesity_risks",
        shortName: "NIDDK · Health risks of overweight and obesity",
        detail: "NIDDK · Health risks of overweight and obesity",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/weight-management/adult-overweight-obesity/health-risks",
        lastRetrieved: "2026-09-19"
    )

    static let obesity_conversation = CitationSource(
        id: "common_conditions_obesity_conversation",
        shortName: "NIDDK · Talking with patients about weight",
        detail: "NIDDK · Talking with patients about weight",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/professionals/clinical-tools-patient-management/weight-management/talking-with-your-patients-about-weight",
        lastRetrieved: "2026-09-19"
    )

    static let obesity_medications = CitationSource(
        id: "common_conditions_obesity_medications",
        shortName: "NIDDK · Prescription weight-management medicines",
        detail: "NIDDK · Prescription weight-management medicines",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/weight-management/prescription-medications-treat-overweight-obesity",
        lastRetrieved: "2026-09-19"
    )

    static let obesity_program = CitationSource(
        id: "common_conditions_obesity_program",
        shortName: "NIDDK · Choosing a weight-loss program",
        detail: "NIDDK · Choosing a weight-loss program",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/weight-management/choosing-a-safe-successful-weight-loss-program",
        lastRetrieved: "2026-09-19"
    )

    static let ada_obesity = CitationSource(
        id: "common_conditions_ada_obesity",
        shortName: "ADA 2026 · Obesity and weight management",
        detail: "Standards of Care in Diabetes—2026, section 8. DOI: 10.2337/dc26-S008. Assessment, shared decisions and sustained treatment in people with or at risk of diabetes.",
        publisher: "American Diabetes Association",
        license: .factCitationOnly,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC12690172/",
        lastRetrieved: "2026-09-19"
    )

    static let surmount5 = CitationSource(
        id: "common_conditions_surmount5",
        shortName: "SURMOUNT-5 · Tirzepatide versus semaglutide, 2025",
        detail: "Aronne LJ et al. Tirzepatide as Compared with Semaglutide for the Treatment of Obesity. 2025;393:26–36. DOI: 10.1056/NEJMoa2416394. PMID: 40353578. Open-label randomized trial; Eli Lilly funded.",
        publisher: "New England Journal of Medicine / Massachusetts Medical Society",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/40353578/",
        lastRetrieved: "2026-09-19"
    )

    static let surmount4 = CitationSource(
        id: "common_conditions_surmount4",
        shortName: "SURMOUNT-4 · Weight maintenance, 2024",
        detail: "Aronne LJ et al. Continued Treatment With Tirzepatide for Maintenance of Weight Reduction in Adults With Obesity. JAMA. 2024;331:38–48. DOI: 10.1001/jama.2023.24945. Randomized withdrawal trial; Eli Lilly funded.",
        publisher: "JAMA / American Medical Association",
        license: .factCitationOnly,
        url: "https://jamanetwork.com/journals/jama/fullarticle/2812936",
        lastRetrieved: "2026-09-19"
    )

    static let lipids_2026 = CitationSource(
        id: "common_conditions_lipids_2026",
        shortName: "ACC/AHA · Dyslipidemia, 2026",
        detail: "ACC/AHA Issue Updated Guideline for Managing Lipids, Cholesterol. March 13, 2026. Issuer summary of the 2026 guideline; recommendations attributed to the issuing societies, not represented as a new randomized trial.",
        publisher: "American College of Cardiology",
        license: .factCitationOnly,
        url: "https://www.acc.org/About-ACC/Press-Releases/2026/03/13/18/01/ACCAHA-Issue-Updated-Guideline-for-Managing-Lipids-Cholesterol",
        lastRetrieved: "2026-09-19"
    )

    static let lipids_diagnosis = CitationSource(
        id: "common_conditions_lipids_diagnosis",
        shortName: "NHLBI · Cholesterol diagnosis",
        detail: "Blood Cholesterol: Diagnosis. Updated April 18, 2024. Lipid components, history and testing; old general thresholds and screening schedules not used.",
        publisher: "NHLBI, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/blood-cholesterol/diagnosis",
        lastRetrieved: "2026-09-19"
    )

    static let lipids_symptoms = CitationSource(
        id: "common_conditions_lipids_symptoms",
        shortName: "NHLBI · Cholesterol symptoms",
        detail: "Blood Cholesterol: Symptoms. Updated April 18, 2024. Asymptomatic presentation and inherited lipid signs.",
        publisher: "NHLBI, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/blood-cholesterol/symptoms",
        lastRetrieved: "2026-09-19"
    )

    static let lipids_treatment = CitationSource(
        id: "common_conditions_lipids_treatment",
        shortName: "NHLBI · Cholesterol treatment",
        detail: "Blood Cholesterol: Treatment. Updated April 19, 2024. Statin mechanism and combined lifestyle/medical care; drug-specific selection uses 2026 guidance.",
        publisher: "NHLBI, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/blood-cholesterol/treatment",
        lastRetrieved: "2026-09-19"
    )

    static let lipids_living = CitationSource(
        id: "common_conditions_lipids_living",
        shortName: "NHLBI · Cholesterol living with high cholesterol",
        detail: "Blood Cholesterol: Living with high cholesterol. Updated April 19, 2024. Follow-up, atherosclerosis and medication safety; older calculator and blanket pregnancy stop intervals not reproduced.",
        publisher: "NHLBI, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/blood-cholesterol/living-with",
        lastRetrieved: "2026-09-19"
    )

    static let clear_outcomes = CitationSource(
        id: "common_conditions_clear_outcomes",
        shortName: "CLEAR Outcomes · Cardiovascular events, 2023",
        detail: "Nissen SE et al. Bempedoic Acid and Cardiovascular Outcomes in Statin-Intolerant Patients. NEJM 2023;388:1353–1364. DOI: 10.1056/NEJMoa2215024. PMID: 36876740. Randomized trial; Esperion Therapeutics funded.",
        publisher: "New England Journal of Medicine / Massachusetts Medical Society",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/36876740/",
        lastRetrieved: "2026-09-19"
    )

    static let constipation_symptoms = CitationSource(
        id: "common_conditions_constipation_symptoms",
        shortName: "NIDDK · Constipation symptoms and causes",
        detail: "Symptoms and causes of Constipation. Foundation reviewed May 2018. Bowel pattern, causes and warning symptoms.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/digestive-diseases/constipation/symptoms-causes",
        lastRetrieved: "2026-09-19"
    )

    static let constipation_diagnosis = CitationSource(
        id: "common_conditions_constipation_diagnosis",
        shortName: "NIDDK · Constipation diagnosis",
        detail: "Diagnosis of Constipation. Foundation reviewed May 2018. History, selected diagnostic tests and bowel-function assessment.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/digestive-diseases/constipation/diagnosis",
        lastRetrieved: "2026-09-19"
    )

    static let constipation_treatment = CitationSource(
        id: "common_conditions_constipation_treatment",
        shortName: "NIDDK · Constipation treatment",
        detail: "Treatment of Constipation. Foundation reviewed May 2018. Diet, activity, toileting and biofeedback only; older blanket laxative restrictions not reproduced.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/digestive-diseases/constipation/treatment",
        lastRetrieved: "2026-09-19"
    )

    static let constipation_aga2026 = CitationSource(
        id: "common_conditions_constipation_aga2026",
        shortName: "AGA · Refractory constipation, 2026",
        detail: "Staller K et al. AGA Clinical Practice Update on Evaluation and Management of Refractory Constipation. Published January 7, 2026. DOI: 10.1016/j.cgh.2025.09.031. Expert best-practice advice.",
        publisher: "American Gastroenterological Association",
        license: .factCitationOnly,
        url: "https://gastro.org/clinical-guidance/evaluation-and-management-of-refractory-constipation/",
        lastRetrieved: "2026-09-19"
    )

    static let constipation_aga2023 = CitationSource(
        id: "common_conditions_constipation_aga2023",
        shortName: "AGA/ACG · Constipation pharmacotherapy, 2023",
        detail: "Chang L et al. Pharmacological Management of Chronic Idiopathic Constipation. May 19, 2023. DOI: 10.1053/j.gastro.2023.03.214. Evidence-based adult recommendations.",
        publisher: "American Gastroenterological Association / American College of Gastroenterology",
        license: .factCitationOnly,
        url: "https://gastro.org/clinical-guidance/pharmacological-management-of-chronic-idiopathic-constipation-cic/",
        lastRetrieved: "2026-09-19"
    )

    static let ibs_diagnosis = CitationSource(
        id: "common_conditions_ibs_diagnosis",
        shortName: "NIDDK · IBS diagnosis",
        detail: "Diagnosis of Irritable Bowel Syndrome. Foundation reviewed November 2017; no source diagnostic duration criteria or blanket gluten avoidance reproduced.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/digestive-diseases/irritable-bowel-syndrome/diagnosis",
        lastRetrieved: "2026-09-19"
    )

    static let ibs_treatment = CitationSource(
        id: "common_conditions_ibs_treatment",
        shortName: "NIDDK · IBS treatment",
        detail: "Treatment of Irritable Bowel Syndrome. Foundation reviewed November 2017; no source diagnostic duration criteria or blanket gluten avoidance reproduced.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/digestive-diseases/irritable-bowel-syndrome/treatment",
        lastRetrieved: "2026-09-19"
    )

    static let ibs_diet = CitationSource(
        id: "common_conditions_ibs_diet",
        shortName: "NIDDK · IBS eating, diet and nutrition",
        detail: "Eating, diet and nutrition of Irritable Bowel Syndrome. Foundation reviewed November 2017; no source diagnostic duration criteria or blanket gluten avoidance reproduced.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/digestive-diseases/irritable-bowel-syndrome/eating-diet-nutrition",
        lastRetrieved: "2026-09-19"
    )

    static let ibs_caribs = CitationSource(
        id: "common_conditions_ibs_caribs",
        shortName: "CARIBS · Diet and medication trial, 2024",
        detail: "Nybacka S et al. A low FODMAP diet plus traditional dietary advice versus a low-carbohydrate diet versus pharmacological treatment in irritable bowel syndrome. Lancet Gastroenterol Hepatol. 2024. DOI: 10.1016/S2468-1253(24)00045-1. PMID: 38643782. Single-center randomized trial; Swedish public/foundation and other funding disclosed in primary record.",
        publisher: "The Lancet Gastroenterology & Hepatology / Elsevier",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/38643782/",
        lastRetrieved: "2026-09-19"
    )

    static let insomnia_diagnosis = CitationSource(
        id: "common_conditions_insomnia_diagnosis",
        shortName: "NHLBI · Insomnia diagnosis",
        detail: "Insomnia: Diagnosis. Updated March 24, 2022. Foundation assessment, behavioral therapy or follow-up; current pharmacotherapy guidance separately attributed to VA/DoD 2025.",
        publisher: "NHLBI, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/insomnia/diagnosis",
        lastRetrieved: "2026-09-19"
    )

    static let insomnia_treatment = CitationSource(
        id: "common_conditions_insomnia_treatment",
        shortName: "NHLBI · Insomnia treatment",
        detail: "Insomnia: Treatment. Updated March 24, 2022. Foundation assessment, behavioral therapy or follow-up; current pharmacotherapy guidance separately attributed to VA/DoD 2025.",
        publisher: "NHLBI, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/insomnia/treatment",
        lastRetrieved: "2026-09-19"
    )

    static let insomnia_living = CitationSource(
        id: "common_conditions_insomnia_living",
        shortName: "NHLBI · Insomnia living with insomnia",
        detail: "Insomnia: Living with insomnia. Updated March 24, 2022. Foundation assessment, behavioral therapy or follow-up; current pharmacotherapy guidance separately attributed to VA/DoD 2025.",
        publisher: "NHLBI, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/insomnia/living-with",
        lastRetrieved: "2026-09-19"
    )

    static let insomnia_va2025 = CitationSource(
        id: "common_conditions_insomnia_va2025",
        shortName: "VA/DoD · Insomnia guideline, 2025",
        detail: "Management of Chronic Insomnia Disorder and Obstructive Sleep Apnea. January 2025 guideline; September 15, 2025 file revision. Recommendations 5–10 and sidebars 3–4; treatment selection and CBT-I precautions.",
        publisher: "US Department of Veterans Affairs / Department of Defense",
        license: .publicDomain,
        url: "https://www.healthquality.va.gov/guidelines/CD/insomnia/I-OSA-CPG_2025-Guideline_final_20250915.pdf",
        lastRetrieved: "2026-09-19"
    )

    static let cessation_clinical = CitationSource(
        id: "common_conditions_cessation_clinical",
        shortName: "CDC · Treating tobacco dependence",
        detail: "Clinical Interventions to Treat Tobacco Use and Dependence Among Adults. May 2024. Repeated treatment, adult medication options, pregnancy boundaries and follow-up.",
        publisher: "Centers for Disease Control and Prevention",
        license: .publicDomain,
        url: "https://www.cdc.gov/tobacco/hcp/patient-care-settings/clinical.html",
        lastRetrieved: "2026-09-19"
    )

    static let cessation_quit = CitationSource(
        id: "common_conditions_cessation_quit",
        shortName: "CDC · Counseling and quit support",
        detail: "How to Quit Smoking. May 15, 2024. Counseling, quit planning and US quitline resources.",
        publisher: "Centers for Disease Control and Prevention",
        license: .publicDomain,
        url: "https://www.cdc.gov/tobacco/about/how-to-quit.html",
        lastRetrieved: "2026-09-19"
    )

    static let cessation_combination = CitationSource(
        id: "common_conditions_cessation_combination",
        shortName: "CDC · Combination nicotine replacement",
        detail: "How to Combine Quit Smoking Medicines. Reviewed October 4, 2024. Long-acting and short-acting nicotine replacement roles; precautions. No dosing schedule reproduced.",
        publisher: "Centers for Disease Control and Prevention",
        license: .publicDomain,
        url: "https://www.cdc.gov/tobacco/campaign/tips/quit-smoking/quit-smoking-medications/how-to-use-quit-smoking-medicines/how-to-combine-medicines.html",
        lastRetrieved: "2026-09-19"
    )

    static let cessation_withdrawal = CitationSource(
        id: "common_conditions_cessation_withdrawal",
        shortName: "CDC · Nicotine withdrawal and mood",
        detail: "7 Common Withdrawal Symptoms. Reviewed September 27, 2024. Symptoms, caffeine, coping and mental-health escalation.",
        publisher: "Centers for Disease Control and Prevention",
        license: .publicDomain,
        url: "https://www.cdc.gov/tobacco/campaign/tips/quit-smoking/7-common-withdrawal-symptoms/index.html",
        lastRetrieved: "2026-09-19"
    )

    static let cessation_mdd2025 = CitationSource(
        id: "common_conditions_cessation_mdd2025",
        shortName: "Smoking cessation and depression · Trial analysis, 2025",
        detail: "Kypriotakis G et al. Effects of Varenicline, Bupropion, Nicotine Patch, and Placebo on Treating Smoking Among Persons With Current or Past Major Depressive Disorder. Am J Psychiatry 2025;182:174–186; online December 11, 2024. DOI: 10.1176/appi.ajp.20230855. PMID: 39659160. Secondary analysis of randomized trial; industry affiliations disclosed.",
        publisher: "American Journal of Psychiatry / American Psychiatric Association",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/39659160/",
        lastRetrieved: "2026-09-19"
    )

    static let masld_diagnosis = CitationSource(
        id: "common_conditions_masld_diagnosis",
        shortName: "NIDDK · Fatty-liver assessment",
        detail: "Diagnosis of NAFLD and NASH. Foundation reviewed April 2021; page includes current MASLD/MASH terminology. Imaging, noninvasive scores and selected biopsy use.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/liver-disease/nafld-nash/diagnosis",
        lastRetrieved: "2026-09-19"
    )

    static let masld_lifestyle = CitationSource(
        id: "common_conditions_masld_lifestyle",
        shortName: "NIDDK · Fatty-liver lifestyle care",
        detail: "Treatment for NAFLD and NASH. Foundation reviewed April 2021. Only lifestyle, nutrition and supplement-safety content used. Its outdated statement that no medicines are approved is explicitly excluded; current treatment is separately cited to AASLD and ESSENCE.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/liver-disease/nafld-nash/treatment",
        lastRetrieved: "2026-09-19"
    )

    static let masld_aasld2023 = CitationSource(
        id: "common_conditions_masld_aasld2023",
        shortName: "AASLD · Fibrosis assessment, 2023",
        detail: "Rinella ME et al. Practice Guidance on the clinical assessment and management of nonalcoholic fatty liver disease. Hepatology 2023;77:1797–1835. DOI: 10.1097/HEP.0000000000000323. PMID: 36727674. Fibrosis-screening limitations, risk-based follow-up and referral.",
        publisher: "American Association for the Study of Liver Diseases",
        license: .factCitationOnly,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/10735173/",
        lastRetrieved: "2026-09-19"
    )

    static let masld_essence = CitationSource(
        id: "common_conditions_masld_essence",
        shortName: "ESSENCE · MASH trial, 2025",
        detail: "Sanyal AJ et al. Phase 3 Trial of Semaglutide in Metabolic Dysfunction-Associated Steatohepatitis. NEJM 2025;392:2089–2099. DOI: 10.1056/NEJMoa2413258. PMID: 40305708. Planned 72-week interim analysis; Novo Nordisk funded.",
        publisher: "New England Journal of Medicine / Massachusetts Medical Society",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/40305708/",
        lastRetrieved: "2026-09-19"
    )

    static let masld_aasld2025 = CitationSource(
        id: "common_conditions_masld_aasld2025",
        shortName: "AASLD · MASH treatment update, 2025/2026",
        detail: "Bansal MB et al. Semaglutide therapy for metabolic dysfunction-associated steatohepatitis: November 2025 updates to AASLD Practice Guidance. Online November 7, 2025; Hepatology 2026;83:1326–1340. DOI: 10.1097/HEP.0000000000001608. PMID: 41201884. Selection, monitoring and limits of response tests.",
        publisher: "American Association for the Study of Liver Diseases",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/41201884/",
        lastRetrieved: "2026-09-19"
    )

    static let cirrhosis_symptoms = CitationSource(
        id: "common_conditions_cirrhosis_symptoms",
        shortName: "NIDDK · Cirrhosis symptoms",
        detail: "Symptoms and Causes of Cirrhosis. Reviewed June 2023. Mental-status change, bleeding, edema, ascites and jaundice.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/liver-disease/cirrhosis/symptoms-causes",
        lastRetrieved: "2026-09-19"
    )

    static let migraine_ninds = CitationSource(
        id: "common_conditions_migraine_ninds",
        shortName: "NINDS · Headache assessment",
        detail: "Headache. Sections on diagnostic history, headache records and findings requiring prompt assessment. Federal educational foundation, not a new treatment guideline.",
        publisher: "NINDS, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.ninds.nih.gov/node/667",
        lastRetrieved: "2026-09-19"
    )

    static let migraine_2026_summary = CitationSource(
        id: "common_conditions_migraine_2026_summary",
        shortName: "AHS 2026 · Prevention guideline summary",
        detail: "Guideline Update To Help Clinicians Determine Most Effective Medications For Preventing Migraine In Adults. Issuer summary dated September 7, 2026; prevention candidacy, patient priorities and monitoring.",
        publisher: "American Headache Society",
        license: .factCitationOnly,
        url: "https://americanheadachesociety.org/news/updated-guideline-on-migraine-prevention-medications-for-adults",
        lastRetrieved: "2026-09-19"
    )

    static let migraine_ahs2024 = CitationSource(
        id: "common_conditions_migraine_ahs2024",
        shortName: "AHS 2024 · CGRP prevention position",
        detail: "Charles AC et al. CGRP-targeting therapies are a first-line option for migraine prevention. Headache. 2024;64:333–341. DOI: 10.1111/head.14692. Society position statement.",
        publisher: "American Headache Society / Wiley",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/38466028/",
        lastRetrieved: "2026-09-19"
    )

    static let migraine_2026 = CitationSource(
        id: "common_conditions_migraine_2026",
        shortName: "AAN–AHS 2026 · Adult migraine prevention",
        detail: "Potrebic S et al. Pharmacologic Treatment for Migraine Prevention in Adults Practice Guideline Recommendations. Headache. Online August 31, 2026. DOI: 10.1111/head.70199. Companion review searched through June 6, 2024.",
        publisher: "American Academy of Neurology Institute / American Headache Society",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/42673606/",
        lastRetrieved: "2026-09-19"
    )

    static let migraine_progress = CitationSource(
        id: "common_conditions_migraine_progress",
        shortName: "PROGRESS · Chronic migraine trial",
        detail: "Pozo-Rosich P et al. Atogepant for preventive treatment of chronic migraine (PROGRESS). Lancet. 2023;402:775–785. DOI: 10.1016/S0140-6736(23)01049-8. Randomized 12-week trial; funded by Allergan, now AbbVie.",
        publisher: "Elsevier / Lancet",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/37516125/",
        lastRetrieved: "2026-09-19"
    )

    static let gerd_symptoms = CitationSource(
        id: "common_conditions_gerd_symptoms",
        shortName: "NIDDK · GERD Symptoms and reassessment",
        detail: "Acid Reflux (GER & GERD) in Adults: Symptoms, contributing medicines and alarm findings. Last reviewed July 2020; newer treatment research is cited separately.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/digestive-diseases/acid-reflux-ger-gerd-adults/symptoms-causes",
        lastRetrieved: "2026-09-19"
    )

    static let gerd_diagnosis = CitationSource(
        id: "common_conditions_gerd_diagnosis",
        shortName: "NIDDK · GERD Diagnostic evaluation",
        detail: "Acid Reflux (GER & GERD) in Adults: Clinical assessment, endoscopy and esophageal reflux monitoring. Last reviewed July 2020; newer treatment research is cited separately.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/digestive-diseases/acid-reflux-ger-gerd-adults/diagnosis",
        lastRetrieved: "2026-09-19"
    )

    static let gerd_treatment = CitationSource(
        id: "common_conditions_gerd_treatment",
        shortName: "NIDDK · GERD Treatment foundation",
        detail: "Acid Reflux (GER & GERD) in Adults: Acid suppression and supportive lifestyle measures. Last reviewed July 2020; newer treatment research is cited separately.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/digestive-diseases/acid-reflux-ger-gerd-adults/treatment",
        lastRetrieved: "2026-09-19"
    )

    static let gerd_deprescribing = CitationSource(
        id: "common_conditions_gerd_deprescribing",
        shortName: "AGA 2022 · PPI indication review",
        detail: "Targownik LE, Fisher DA, Saini SD. AGA Clinical Practice Update on De-Prescribing of Proton Pump Inhibitors: Expert Review. Gastroenterology. 2022;162:1334–1342. DOI: 10.1053/j.gastro.2021.12.247. Expert advice, not a formally graded systematic review.",
        publisher: "American Gastroenterological Association / Elsevier",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/35183361/",
        lastRetrieved: "2026-09-19"
    )

    static let gerd_vonoprazan = CitationSource(
        id: "common_conditions_gerd_vonoprazan",
        shortName: "Vonoprazan · Nonerosive reflux trial",
        detail: "Laine L et al. Vonoprazan is Efficacious for Treatment of Heartburn in Non-erosive Reflux Disease: A Randomized Trial. Clin Gastroenterol Hepatol. 2024;22:2211–2220.e10. DOI: 10.1016/j.cgh.2024.05.004. Four-week placebo comparison and 20-week active extension.",
        publisher: "American Gastroenterological Association / Elsevier",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/38750866/",
        lastRetrieved: "2026-09-19"
    )

    static let iron_ods = CitationSource(
        id: "common_conditions_iron_ods",
        shortName: "NIH ODS · Iron assessment and interactions",
        detail: "Iron — Health Professional Fact Sheet. Iron-status assessment in inflammation and interactions with levothyroxine, levodopa and proton pump inhibitors.",
        publisher: "Office of Dietary Supplements, National Institutes of Health",
        license: .publicDomain,
        url: "https://ods.od.nih.gov/factsheets/Iron-HealthProfessional/",
        lastRetrieved: "2026-09-19"
    )

    static let iron_nhlbi = CitationSource(
        id: "common_conditions_iron_nhlbi",
        shortName: "NHLBI · Iron-deficiency anemia",
        detail: "Anemia — Iron-Deficiency Anemia. Updated March 24, 2022. Causes, oral-treatment tolerance and repletion follow-up; source graphics and generalized laboratory cutoffs are not reproduced.",
        publisher: "NHLBI, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/anemia/iron-deficiency-anemia",
        lastRetrieved: "2026-09-19"
    )

    static let iron_aga2024 = CitationSource(
        id: "common_conditions_iron_aga2024",
        shortName: "AGA 2024 · Iron-deficiency management",
        detail: "DeLoughery TG, Jackson CS, Ko CW, Rockey DC. AGA Clinical Practice Update on Management of Iron Deficiency Anemia: Expert Review. June 2024. DOI: 10.1016/j.cgh.2024.03.046. Oral tolerance, IV indications and underlying GI conditions.",
        publisher: "American Gastroenterological Association",
        license: .factCitationOnly,
        url: "https://gastro.org/clinical-guidance/management-of-iron-deficiency-anemia/",
        lastRetrieved: "2026-09-19"
    )

    static let iron_vitc = CitationSource(
        id: "common_conditions_iron_vitc",
        shortName: "Vitamin C · Iron equivalence trial",
        detail: "Li N et al. The Efficacy and Safety of Vitamin C for Iron Supplementation in Adult Patients With Iron Deficiency Anemia. JAMA Netw Open. 2020;3:e2023644. DOI: 10.1001/jamanetworkopen.2020.23644. Randomized equivalence trial.",
        publisher: "American Medical Association",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/33136134/",
        lastRetrieved: "2026-09-19"
    )

    static let iron_phosphare = CitationSource(
        id: "common_conditions_iron_phosphare",
        shortName: "PHOSPHARE-IBD · IV iron phosphate risk",
        detail: "Zoller H et al. Hypophosphataemia following ferric derisomaltose and ferric carboxymaltose in IBD (PHOSPHARE-IBD). Gut. 2023;72:644–653; online September 9, 2022. DOI: 10.1136/gutjnl-2022-327897. Randomized comparison.",
        publisher: "BMJ / Gut",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/36343979/",
        lastRetrieved: "2026-09-19"
    )

    static let oa_overview = CitationSource(
        id: "common_conditions_oa_overview",
        shortName: "NIAMS · Osteoarthritis symptoms",
        detail: "Osteoarthritis: Overview, Symptoms and Causes. Last reviewed September 2023. Joint tissues, symptom patterns and daily functional limitations.",
        publisher: "NIAMS, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niams.nih.gov/health-topics/osteoarthritis",
        lastRetrieved: "2026-09-19"
    )

    static let oa_care = CitationSource(
        id: "common_conditions_oa_care",
        shortName: "NIAMS · Osteoarthritis care",
        detail: "Osteoarthritis: Diagnosis, Treatment, and Steps to Take. Exercise, supports, diagnostic reassessment and surgical discussion. No tables or media reproduced.",
        publisher: "NIAMS, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niams.nih.gov/health-topics/osteoarthritis/diagnosis-treatment-and-steps-to-take",
        lastRetrieved: "2026-09-19"
    )

    static let oa_acr = CitationSource(
        id: "common_conditions_oa_acr",
        shortName: "ACR/AF · Joint-specific osteoarthritis care",
        detail: "Kolasinski SL et al. 2019 ACR/Arthritis Foundation Guideline for Osteoarthritis of the Hand, Hip, and Knee. Arthritis Rheumatol. 2020;72:220–233. DOI: 10.1002/art.41142. Recommendations differ by joint and patient context.",
        publisher: "American College of Rheumatology / Wiley",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/31908163/",
        lastRetrieved: "2026-09-19"
    )

    static let oa_fda = CitationSource(
        id: "common_conditions_oa_fda",
        shortName: "FDA · Nonprescription pain medicine safety",
        detail: "The best way to take your over-the-counter pain reliever? Seriously. Federal brochure: active-ingredient duplication, acetaminophen liver injury and NSAID gastrointestinal/kidney risk.",
        publisher: "US Food and Drug Administration",
        license: .publicDomain,
        url: "https://www.fda.gov/drugs/safe-use-over-counter-pain-relievers-and-fever-reducers/best-way-take-your-over-counter-pain-reliever-seriously-four-panel-brochure",
        lastRetrieved: "2026-09-19"
    )

    static let oa_step9 = CitationSource(
        id: "common_conditions_oa_step9",
        shortName: "STEP 9 · Obesity and knee osteoarthritis",
        detail: "Bliddal H et al. Once-Weekly Semaglutide in Persons with Obesity and Knee Osteoarthritis. N Engl J Med. 2024;391:1573–1583. DOI: 10.1056/NEJMoa2403664. 68-week randomized trial; funded by Novo Nordisk.",
        publisher: "Massachusetts Medical Society",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/39476339/",
        lastRetrieved: "2026-09-19"
    )

    static let bone_niams = CitationSource(
        id: "common_conditions_bone_niams",
        shortName: "NIAMS · Osteoporosis treatment and falls",
        detail: "Osteoporosis: Diagnosis, Treatment, and Steps to Take. DXA, nutrition, safe activity, secondary causes and fall prevention. Quantitative supplement tables are excluded.",
        publisher: "NIAMS, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niams.nih.gov/health-topics/osteoporosis/diagnosis-treatment-and-steps-to-take",
        lastRetrieved: "2026-09-19"
    )

    static let bone_endocrine = CitationSource(
        id: "common_conditions_bone_endocrine",
        shortName: "Endocrine Society · Treatment continuity",
        detail: "Pharmacological Management of Osteoporosis in Postmenopausal Women. 2019 guideline with February 2020 update. Sections 2 and 3: bisphosphonate reassessment/holiday and denosumab continuation or subsequent therapy.",
        publisher: "Endocrine Society",
        license: .factCitationOnly,
        url: "https://www.endocrine.org/clinical-practice-guidelines/osteoporosis-in-postmenopausal-women",
        lastRetrieved: "2026-09-19"
    )

    static let bone_fda = CitationSource(
        id: "common_conditions_bone_fda",
        shortName: "FDA 2024 · Prolia and advanced CKD",
        detail: "January 19, 2024 Drug Safety Communication. Boxed warning for severe hypocalcemia with Prolia in advanced CKD, especially dialysis or CKD-related mineral and bone disorder.",
        publisher: "US Food and Drug Administration",
        license: .publicDomain,
        url: "https://www.fda.gov/drugs/drug-safety-communications/fda-adds-boxed-warning-increased-risk-severe-hypocalcemia-patients-advanced-chronic-kidney-disease",
        lastRetrieved: "2026-09-19"
    )

    static let bone_dst2026 = CitationSource(
        id: "common_conditions_bone_dst2026",
        shortName: "DST 2026 · Denosumab sequential therapy",
        detail: "Yen HK et al. Therapeutic Strategies of Denosumab Sequential Therapy: A Four-Armed Randomized Controlled Trial. Clin Pharmacol Ther. 2026;119:480–489; online October 7, 2025. DOI: 10.1002/cpt.70088. Two-year BMD outcomes in 101 adults.",
        publisher: "American Society for Clinical Pharmacology and Therapeutics / Wiley",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/41058078/",
        lastRetrieved: "2026-09-19"
    )

    static let uti_diagnosis = CitationSource(
        id: "common_conditions_uti_diagnosis",
        shortName: "NIDDK · UTI Diagnostic evaluation",
        detail: "Bladder Infection in Adults: History, urinalysis, culture and selected structural evaluation. Last reviewed April 2024.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/urologic-diseases/bladder-infection-uti-in-adults/diagnosis",
        lastRetrieved: "2026-09-19"
    )

    static let uti_treatment = CitationSource(
        id: "common_conditions_uti_treatment",
        shortName: "NIDDK · UTI Treatment and prevention",
        detail: "Bladder Infection in Adults: Treatment reassessment, fluids, contraceptive factors and vaginal estrogen. Last reviewed April 2024.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/urologic-diseases/bladder-infection-uti-in-adults/treatment",
        lastRetrieved: "2026-09-19"
    )

    static let uti_symptoms = CitationSource(
        id: "common_conditions_uti_symptoms",
        shortName: "NIDDK · UTI Symptoms and kidney involvement",
        detail: "Bladder Infection in Adults: Bladder symptoms and findings concerning for kidney infection. Last reviewed April 2024.",
        publisher: "NIDDK, National Institutes of Health",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/urologic-diseases/bladder-infection-uti-in-adults/symptoms-causes",
        lastRetrieved: "2026-09-19"
    )

    static let uti_dmannose = CitationSource(
        id: "common_conditions_uti_dmannose",
        shortName: "D-mannose · Recurrent UTI trial",
        detail: "Hayward G et al. d-Mannose for Prevention of Recurrent Urinary Tract Infection Among Women. JAMA Intern Med. 2024;184:619–628. DOI: 10.1001/jamainternmed.2024.0264. Placebo-controlled UK primary-care trial, six-month outcome.",
        publisher: "American Medical Association",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/38587819/",
        lastRetrieved: "2026-09-19"
    )

    static let uti_altar = CitationSource(
        id: "common_conditions_uti_altar",
        shortName: "ALTAR · Methenamine prevention trial",
        detail: "Harding C et al. Methenamine hippurate compared with antibiotic prophylaxis to prevent recurrent urinary tract infections in women: the ALTAR non-inferiority RCT. Health Technol Assess. 2022;26(23):1–172. DOI: 10.3310/QOIZ6538. Primary trial report; noninferiority margin one UTI/person-year.",
        publisher: "National Institute for Health and Care Research Journals Library",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/35535708/",
        lastRetrieved: "2026-09-19"
    )

}
#endif
