import Foundation

/// Sources the daily cases cite. Public-domain US government works and
/// CC BY 4.0 Open RN chapters only, per docs/CONTENT_SOURCING.md.
enum MicroCaseSources {
    static let retrieved = "2026-09-18"

    static let ahrqTeamSTEPPS = CitationSource(
        id: "mc_ahrq_teamstepps",
        shortName: "AHRQ TeamSTEPPS — Situation monitoring, CUS and escalation tools",
        publisher: "Agency for Healthcare Research and Quality",
        license: .publicDomain,
        url: "https://www.ahrq.gov/teamstepps-program/index.html",
        lastRetrieved: retrieved
    )
    static let ahrqPSNet = CitationSource(
        id: "mc_ahrq_psnet",
        shortName: "AHRQ Patient Safety Network — Cases & Commentaries",
        publisher: "Agency for Healthcare Research and Quality",
        license: .publicDomain,
        url: "https://psnet.ahrq.gov/",
        lastRetrieved: retrieved
    )
    static let ahrqFalls = CitationSource(
        id: "mc_ahrq_falls",
        shortName: "AHRQ — Preventing Falls in Hospitals toolkit",
        publisher: "Agency for Healthcare Research and Quality",
        license: .publicDomain,
        url: "https://www.ahrq.gov/patient-safety/settings/hospital/fall-prevention/toolkit/index.html",
        lastRetrieved: retrieved
    )
    static let ahrqPressureInjury = CitationSource(
        id: "mc_ahrq_pressure",
        shortName: "AHRQ — Preventing Pressure Ulcers in Hospitals toolkit",
        publisher: "Agency for Healthcare Research and Quality",
        license: .publicDomain,
        url: "https://www.ahrq.gov/patient-safety/settings/hospital/resource/pressureulcer/tool/index.html",
        lastRetrieved: retrieved
    )
    static let cdcSepsis = CitationSource(
        id: "mc_cdc_sepsis",
        shortName: "CDC — Sepsis: Get Ahead of Sepsis",
        publisher: "Centers for Disease Control and Prevention",
        license: .publicDomain,
        url: "https://www.cdc.gov/sepsis/index.html",
        lastRetrieved: retrieved
    )
    static let cdcSeizure = CitationSource(
        id: "mc_cdc_seizure",
        shortName: "CDC — Epilepsy: Seizure first aid",
        publisher: "Centers for Disease Control and Prevention",
        license: .publicDomain,
        url: "https://www.cdc.gov/epilepsy/about/first-aid-for-seizures.html",
        lastRetrieved: retrieved
    )
    static let cdcSTEADI = CitationSource(
        id: "mc_cdc_steadi",
        shortName: "CDC — STEADI: Older adult fall prevention",
        publisher: "Centers for Disease Control and Prevention",
        license: .publicDomain,
        url: "https://www.cdc.gov/steadi/",
        lastRetrieved: retrieved
    )
    static let cdcOverdose = CitationSource(
        id: "mc_cdc_overdose",
        shortName: "CDC — Overdose prevention: recognizing and responding to an opioid overdose",
        publisher: "Centers for Disease Control and Prevention",
        license: .publicDomain,
        url: "https://www.cdc.gov/overdose-prevention/",
        lastRetrieved: retrieved
    )
    static let cdcHearHer = CitationSource(
        id: "mc_cdc_hearher",
        shortName: "CDC — Hear Her: urgent maternal warning signs",
        publisher: "Centers for Disease Control and Prevention",
        license: .publicDomain,
        url: "https://www.cdc.gov/hearher/",
        lastRetrieved: retrieved
    )
    static let cdcRSV = CitationSource(
        id: "mc_cdc_rsv",
        shortName: "CDC — RSV in infants and young children",
        publisher: "Centers for Disease Control and Prevention",
        license: .publicDomain,
        url: "https://www.cdc.gov/rsv/",
        lastRetrieved: retrieved
    )
    static let cdcCancerInfection = CitationSource(
        id: "mc_cdc_cancer_infection",
        shortName: "CDC — Preventing infections in cancer patients (neutropenia)",
        publisher: "Centers for Disease Control and Prevention",
        license: .publicDomain,
        url: "https://www.cdc.gov/cancer/",
        lastRetrieved: retrieved
    )
    static let cdcHAI = CitationSource(
        id: "mc_cdc_hai",
        shortName: "CDC — Healthcare-associated infections: CLABSI and CAUTI prevention",
        publisher: "Centers for Disease Control and Prevention",
        license: .publicDomain,
        url: "https://www.cdc.gov/hai/",
        lastRetrieved: retrieved
    )
    static let nindsStroke = CitationSource(
        id: "mc_ninds_stroke",
        shortName: "NIH/NINDS — Know Stroke: recognition and time",
        publisher: "National Institute of Neurological Disorders and Stroke",
        license: .publicDomain,
        url: "https://www.ninds.nih.gov/health-information/public-education/know-stroke",
        lastRetrieved: retrieved
    )
    static let niddkHypoglycemia = CitationSource(
        id: "mc_niddk_hypoglycemia",
        shortName: "NIH/NIDDK — Low blood glucose (hypoglycemia)",
        publisher: "National Institute of Diabetes and Digestive and Kidney Diseases",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/diabetes/overview/preventing-problems/low-blood-glucose-hypoglycemia",
        lastRetrieved: retrieved
    )
    static let niddkDKA = CitationSource(
        id: "mc_niddk_dka",
        shortName: "NIH/NIDDK — Diabetic ketoacidosis and managing diabetes when sick",
        publisher: "National Institute of Diabetes and Digestive and Kidney Diseases",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/diabetes/overview/preventing-problems",
        lastRetrieved: retrieved
    )
    static let niddkKidney = CitationSource(
        id: "mc_niddk_kidney",
        shortName: "NIH/NIDDK — Chronic kidney disease: potassium and dialysis",
        publisher: "National Institute of Diabetes and Digestive and Kidney Diseases",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/kidney-disease",
        lastRetrieved: retrieved
    )
    static let nhlbiVTE = CitationSource(
        id: "mc_nhlbi_vte",
        shortName: "NIH/NHLBI — Venous thromboembolism: pulmonary embolism signs",
        publisher: "National Heart, Lung, and Blood Institute",
        license: .publicDomain,
        url: "https://www.nhlbi.nih.gov/health/venous-thromboembolism",
        lastRetrieved: retrieved
    )
    static let niaDelirium = CitationSource(
        id: "mc_nia_delirium",
        shortName: "NIH/NIA — Delirium and confusion in older adults",
        publisher: "National Institute on Aging",
        license: .publicDomain,
        url: "https://www.nia.nih.gov/health",
        lastRetrieved: retrieved
    )
    static let niaaaWithdrawal = CitationSource(
        id: "mc_niaaa_withdrawal",
        shortName: "NIH/NIAAA — Alcohol withdrawal",
        publisher: "National Institute on Alcohol Abuse and Alcoholism",
        license: .publicDomain,
        url: "https://www.niaaa.nih.gov/",
        lastRetrieved: retrieved
    )
    static let niaidAnaphylaxis = CitationSource(
        id: "mc_niaid_anaphylaxis",
        shortName: "NIH/NIAID — Anaphylaxis",
        publisher: "National Institute of Allergy and Infectious Diseases",
        license: .publicDomain,
        url: "https://www.niaid.nih.gov/diseases-conditions/anaphylaxis",
        lastRetrieved: retrieved
    )
    static let openrnFundamentals = CitationSource(
        id: "mc_openrn_fundamentals",
        shortName: "Open RN — Nursing Fundamentals",
        publisher: "Open RN (WTCS)",
        license: .ccBy4,
        url: "https://wtcs.pressbooks.pub/nursingfundamentals/",
        lastRetrieved: retrieved
    )
    static let openrnSkills = CitationSource(
        id: "mc_openrn_skills",
        shortName: "Open RN — Nursing Skills",
        publisher: "Open RN (WTCS)",
        license: .ccBy4,
        url: "https://wtcs.pressbooks.pub/nursingskills/",
        lastRetrieved: retrieved
    )
    static let openrnHealthAlterations = CitationSource(
        id: "mc_openrn_health_alterations",
        shortName: "Open RN — Health Alterations",
        publisher: "Open RN (WTCS)",
        license: .ccBy4,
        url: "https://wtcs.pressbooks.pub/healthalterations/",
        lastRetrieved: retrieved
    )
    static let openrnPharmacology = CitationSource(
        id: "mc_openrn_pharmacology",
        shortName: "Open RN — Nursing Pharmacology",
        publisher: "Open RN (WTCS)",
        license: .ccBy4,
        url: "https://wtcs.pressbooks.pub/pharmacology/",
        lastRetrieved: retrieved
    )
    static let openrnManagement = CitationSource(
        id: "mc_openrn_management",
        shortName: "Open RN — Nursing Management and Professional Concepts",
        publisher: "Open RN (WTCS)",
        license: .ccBy4,
        url: "https://wtcs.pressbooks.pub/nursingmpc/",
        lastRetrieved: retrieved
    )
}

/// Every compiled case. Batches are separate files so a content round can
/// add one without touching the rest. Registry init asserts unique ids and
/// unique publish dates; `MicroCaseCorpusTests` checks everything else.
enum MicroCaseCorpus {
    static let all: [MicroCase] = MicroCasesBatch01.cases + MicroCasesBatch02.cases + MicroCasesBatch03.cases + MicroCasesBatch04.cases
}
