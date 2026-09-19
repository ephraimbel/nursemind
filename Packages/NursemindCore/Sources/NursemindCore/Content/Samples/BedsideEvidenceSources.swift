import Foundation

enum BedsideEvidenceSources {
    static let delirium = CitationSource(
        id: "bedside_evidence_delirium", shortName: "Burton et al. — Non-ICU delirium prevention (2021)",
        detail: "Cochrane Database Syst Rev. 2021;11:CD013307. Abstract: multicomponent prevention comparison, certainty and population. Brief original factual summary only; no reproduced review, algorithm or instrument.",
        publisher: "Cochrane / Wiley", license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/34826144/", lastRetrieved: "2026-09-19"
    )

    static let cognition = CitationSource(
        id: "bedside_evidence_cognition", shortName: "Open RN — Cognitive impairments, section 6.2",
        detail: "Ernstmeyer K, Christman E, editors. Nursing Fundamentals, 2nd ed. (2024), section 6.2, Delirium and Comparison of Three Conditions. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/). Developmental-theory sections derived from StatPearls/OpenStax, figures, instruments and third-party tables excluded.",
        publisher: "Open Resources for Nursing; Chippewa Valley Technical College", license: .ccBy4,
        url: "https://www.ncbi.nlm.nih.gov/books/NBK610835/", lastRetrieved: "2026-09-19"
    )

    static let falls = CitationSource(
        id: "bedside_evidence_falls", shortName: "Morris et al. — Hospital falls interventions (2022)",
        detail: "Age Ageing. 2022;51:afac077. doi:10.1093/ageing/afac077. Abstract, Results and Discussion. Adapted and condensed by NurseMind under CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/); no figures or tables.",
        publisher: "The authors; Oxford University Press / British Geriatrics Society", license: .ccBy4,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9078046/", lastRetrieved: "2026-09-19"
    )

    static let mobility = CitationSource(
        id: "bedside_evidence_mobility", shortName: "Open RN — Mobility, sections 13.2–13.3",
        detail: "Ernstmeyer K, Christman E, editors. Nursing Fundamentals, 2nd ed. (2024). Original nursing assessment, activity-tolerance and safe-handling prose adapted and condensed by NurseMind under CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/). No proprietary tools, figures, diagnostic-taxonomy tables or externally attributed intervention lists.",
        publisher: "Open Resources for Nursing; Chippewa Valley Technical College", license: .ccBy4,
        url: "https://www.ncbi.nlm.nih.gov/books/NBK610826/", lastRetrieved: "2026-09-19"
    )

    static let turning = CitationSource(
        id: "bedside_evidence_turning", shortName: "Yap et al. — TEAM-UP repositioning trial (2022)",
        detail: "Effect of Varying Repositioning Frequency on Pressure Injury Prevention in Nursing Home Residents: TEAM-UP Trial Results. Methods, eligibility, Results and limitations. Brief original factual paraphrase only; no reproduced tables, protocol or Braden instrument.",
        publisher: "Advances in Skin & Wound Care / Wolters Kluwer", license: .factCitationOnly,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9119401/", lastRetrieved: "2026-09-19"
    )

    static let skin = CitationSource(
        id: "bedside_evidence_skin", shortName: "Open RN — Integumentary assessment, section 10.6",
        detail: "Ernstmeyer K, Christman E, editors. Nursing Fundamentals, 2nd ed. (2024). Section 10.6, original assessment, implementation and evaluation prose adapted and condensed by NurseMind under CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/). Braden derivatives, NANDA/NIC tables, staging images and fixed treatment schedules excluded.",
        publisher: "Open Resources for Nursing; Chippewa Valley Technical College", license: .ccBy4,
        url: "https://www.ncbi.nlm.nih.gov/books/NBK610817/", lastRetrieved: "2026-09-19"
    )

    static let hydration = CitationSource(
        id: "bedside_evidence_hydration", shortName: "Viñas et al. — Dysphagia and hydration (2022)",
        detail: "Nutrients. 2022;14:2497. doi:10.3390/nu14122497. Abstract and conclusions of two parallel systematic/scoping reviews. Brief original factual paraphrase; no source prose, figures or fluid prescription reproduced. Hydration findings must not be represented as pneumonia-prevention evidence.",
        publisher: "The authors; Nutrients / MDPI", license: .factCitationOnly,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9228104/", lastRetrieved: "2026-09-19"
    )

    static let swallow = CitationSource(
        id: "bedside_evidence_swallow", shortName: "MedlinePlus — Dysphagia tests",
        detail: "NLM-authored Medical Test page: purpose, symptoms, screening versus diagnostic testing, FEES and VFSS. Adapted and condensed by NurseMind. Excludes linked third-party pages and images.",
        publisher: "National Library of Medicine", license: .publicDomain,
        url: "https://medlineplus.gov/lab-tests/dysphagia-tests/", lastRetrieved: "2026-09-19"
    )

    static let discharge = CitationSource(
        id: "bedside_evidence_discharge", shortName: "Becker et al. — Discharge communication (2021)",
        detail: "JAMA Netw Open. 2021;4:e2119346. doi:10.1001/jamanetworkopen.2021.19346. Abstract, eligibility and limitations. Adapted and condensed by NurseMind under CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/); no figures or tables.",
        publisher: "The authors; JAMA Network Open", license: .ccBy4,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8397933/", lastRetrieved: "2026-09-19"
    )

    static let red = CitationSource(
        id: "bedside_evidence_red", shortName: "AHRQ — Re-Engineered Discharge, Tool 3",
        detail: "Re-Engineered Discharge Toolkit (2013), Tool 3: roles, follow-up, pending results and after-hospital plan. Brief original factual summary; contractor-authored toolkit is not assumed public domain. Obsolete National Guideline Clearinghouse reference, templates and third-party materials excluded.",
        publisher: "Agency for Healthcare Research and Quality; Boston University RED team", license: .factCitationOnly,
        url: "https://www.ahrq.gov/patient-safety/settings/hospital/red/toolkit/redtool3.html", lastRetrieved: "2026-09-19"
    )

    static let teach_study = CitationSource(
        id: "bedside_evidence_teach_study", shortName: "Talevski et al. — Teach-back implementation (2020)",
        detail: "PLoS One. 2020;15:e0231350. doi:10.1371/journal.pone.0231350. Abstract, intervention definition, implementation and limitations. Adapted and condensed by NurseMind under CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/); excludes figures.",
        publisher: "Talevski and colleagues; PLOS", license: .ccBy4,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC7156054/", lastRetrieved: "2026-09-19"
    )

    static let teach = CitationSource(
        id: "bedside_evidence_teach", shortName: "AHRQ — Use the teach-back method, Tool 5",
        detail: "Health Literacy Universal Precautions Toolkit, third edition, Tool 5; reviewed April 2024. Brief original factual summary of teach-back, show-me and implementation; no copied scripts or externally linked instruments. Contractor authorship is not assumed public domain.",
        publisher: "Agency for Healthcare Research and Quality", license: .factCitationOnly,
        url: "https://www.ahrq.gov/health-literacy/improve/precautions/tool5.html", lastRetrieved: "2026-09-19"
    )

    static let marquis = CitationSource(
        id: "bedside_evidence_marquis", shortName: "Schnipper et al. — MARQUIS2 medication reconciliation",
        detail: "Effects of a refined evidence-based toolkit and mentored implementation on medication reconciliation at 18 hospitals: results of the MARQUIS2 study. Published online 2021. Abstract: design, discrepancy outcome and interrupted time-series analysis. Brief original factual summary; no toolkit or source prose reproduced.",
        publisher: "BMJ Quality & Safety; MARQUIS2 investigators", license: .factCitationOnly,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10964422/", lastRetrieved: "2026-09-19"
    )

    static let match = CitationSource(
        id: "bedside_evidence_match", shortName: "AHRQ — MATCH medication reconciliation, chapter 3",
        detail: "Medications at Transitions and Clinical Handoffs Toolkit (2012), chapter 3: shared list, roles and transition workflow. Brief original factual summary; no copied forms or workflow diagrams. Contractor authorship is not assumed public domain.",
        publisher: "Agency for Healthcare Research and Quality", license: .factCitationOnly,
        url: "https://www.ahrq.gov/patient-safety/settings/hospital/match/chapter-3.html", lastRetrieved: "2026-09-19"
    )

    static let sleep_study = CitationSource(
        id: "bedside_evidence_sleep_study", shortName: "Acharya et al. — Inpatient sleep interventions (2024)",
        detail: "Acharya R, Blackwell S, Simoes J, et al. Non-pharmacological interventions to improve sleep quality and quantity for hospitalized adult patients—co-produced study with surgical patient partners: systematic review. BJS Open. 2024;zrae018. doi:10.1093/bjsopen/zrae018. Abstract and Discussion. Adapted and condensed by NurseMind under CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/).",
        publisher: "The authors; BJS Open / Oxford University Press", license: .ccBy4,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC11004792/", lastRetrieved: "2026-09-19"
    )

    static let nutrition_study = CitationSource(
        id: "bedside_evidence_nutrition_study", shortName: "Gomes et al. — Nutritional support in medical inpatients (2019)",
        detail: "JAMA Netw Open. 2019;2:e1915138. doi:10.1001/jamanetworkopen.2019.15138. Abstract: trial populations, mortality and readmissions. Adapted and condensed by NurseMind under CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/); no diet targets, figures or tables.",
        publisher: "The authors; JAMA Network Open", license: .ccBy4,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6902795/", lastRetrieved: "2026-09-19"
    )

    static let walking = CitationSource(
        id: "bedside_evidence_walking", shortName: "Loyd et al. — Hospital walking programs (2023)",
        detail: "Nursing Open. 2023;10:1942–1953; online November 2022. doi:10.1002/nop2.1496. Results and Conclusion: older medical/surgical inpatients, length of stay and heterogeneity. Brief original factual summary only; no walking prescription or copied source text.",
        publisher: "Nursing Open / Wiley", license: .factCitationOnly,
        url: "https://onlinelibrary.wiley.com/doi/10.1002/nop2.1496", lastRetrieved: "2026-09-19"
    )

    static let brushing = CitationSource(
        id: "bedside_evidence_brushing", shortName: "Ehrenzeller & Klompas — Toothbrushing and pneumonia (2024)",
        detail: "JAMA Intern Med. 2024;184:131–142; online December 2023. doi:10.1001/jamainternmed.2023.6638. Abstract and subgroup results. Brief original factual summary only; copyright American Medical Association, all rights reserved. No tables or figures.",
        publisher: "American Medical Association", license: .factCitationOnly,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10728803/", lastRetrieved: "2026-09-19"
    )

    static let contacts = CitationSource(
        id: "bedside_evidence_contacts", shortName: "VA Evidence Synthesis — Post-discharge contacts (2024)",
        detail: "Boggan JC, Sankineni S, Gordon AM, et al. Effectiveness of Post-Discharge Contacts on Health Care Utilization and Patient Satisfaction. VA Evidence Synthesis Program, March 2024. Executive Summary: study eligibility, findings and certainty. Federal report explicitly public domain; adapted and condensed by NurseMind.",
        publisher: "Department of Veterans Affairs; Evidence Synthesis Program", license: .publicDomain,
        url: "https://www.ncbi.nlm.nih.gov/books/NBK613007/", lastRetrieved: "2026-09-19"
    )

    static let call = CitationSource(
        id: "bedside_evidence_call", shortName: "AHRQ — Postdischarge follow-up phone call, Tool 5",
        detail: "Re-Engineered Discharge Toolkit (2013), Tool 5: preparation, medication review, services and post-call communication. Brief original factual summary; no scripts or forms reproduced. Contractor authorship is not assumed public domain.",
        publisher: "Agency for Healthcare Research and Quality; Boston University RED team", license: .factCitationOnly,
        url: "https://www.ahrq.gov/patient-safety/settings/hospital/red/toolkit/redtool5.html", lastRetrieved: "2026-09-19"
    )

}
