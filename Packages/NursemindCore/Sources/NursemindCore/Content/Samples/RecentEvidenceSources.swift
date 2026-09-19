import Foundation

#if DEBUG && RECENT_EVIDENCE_REVIEW
enum RecentEvidenceSources {
    static let suzetrigine_label = CitationSource(
        id: "recent_evidence_suzetrigine_label",
        shortName: "Journavx prescribing information",
        detail: "Journavx (suzetrigine); DailyMed SPL set f0976da4-1d20-4517-945c-b60ed2f41c12; sections 1, 2, 4–8, 12 and 14. Prescribing information revised January 2026; SPL updated April 2026.",
        publisher: "Vertex Pharmaceuticals · DailyMed",
        license: .factCitationOnly,
        url: "https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=f0976da4-1d20-4517-945c-b60ed2f41c12",
        lastRetrieved: "2026-09-19"
    )

    static let gepotidacin_label = CitationSource(
        id: "recent_evidence_gepotidacin_label",
        shortName: "Blujepa prescribing information",
        detail: "Blujepa (gepotidacin); DailyMed SPL set 80b57cfe-7819-4d95-a57d-014af42f118d; sections 1, 2, 4–8, 12 and 14.",
        publisher: "GlaxoSmithKline · DailyMed",
        license: .factCitationOnly,
        url: "https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=80b57cfe-7819-4d95-a57d-014af42f118d",
        lastRetrieved: "2026-09-19"
    )

    static let brensocatib_label = CitationSource(
        id: "recent_evidence_brensocatib_label",
        shortName: "Brinsupri prescribing information",
        detail: "Brinsupri (brensocatib); DailyMed SPL set b56986ae-e7db-421e-b622-a7f41e321f3d; sections 1, 2, 4–8, 12 and 14.",
        publisher: "Insmed · DailyMed",
        license: .factCitationOnly,
        url: "https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=b56986ae-e7db-421e-b622-a7f41e321f3d",
        lastRetrieved: "2026-09-19"
    )

    static let nerandomilast_label = CitationSource(
        id: "recent_evidence_nerandomilast_label",
        shortName: "Jascayd prescribing information",
        detail: "Jascayd (nerandomilast); DailyMed SPL set fa1b14c6-957f-d326-5099-911bfe33e391; sections 1, 2, 4–8, 12 and 14.",
        publisher: "Boehringer Ingelheim · DailyMed",
        license: .factCitationOnly,
        url: "https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=fa1b14c6-957f-d326-5099-911bfe33e391",
        lastRetrieved: "2026-09-19"
    )

    static let donanemab_label = CitationSource(
        id: "recent_evidence_donanemab_label",
        shortName: "Kisunla prescribing information",
        detail: "Kisunla (donanemab); DailyMed SPL set 190352d4-ef62-4679-b4fa-e846e2766afa; sections 1, 2, 4–8, 12 and 14.",
        publisher: "Eli Lilly · DailyMed",
        license: .factCitationOnly,
        url: "https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=190352d4-ef62-4679-b4fa-e846e2766afa",
        lastRetrieved: "2026-09-19"
    )

    static let zuranolone_label = CitationSource(
        id: "recent_evidence_zuranolone_label",
        shortName: "Zurzuvae prescribing information",
        detail: "Zurzuvae (zuranolone); DailyMed SPL set f18e53b0-d0bb-422d-8de7-ab64b7292b29; sections 1, 2, 4–8, 12 and 14. Prescribing information revised April 2026; SPL updated June 2026.",
        publisher: "Biogen · DailyMed",
        license: .factCitationOnly,
        url: "https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=f18e53b0-d0bb-422d-8de7-ab64b7292b29",
        lastRetrieved: "2026-09-19"
    )

    static let suzetrigine_fda = CitationSource(
        id: "recent_evidence_suzetrigine_fda",
        shortName: "FDA · Journavx approval",
        detail: "FDA approval announcement, January 30, 2025. Adult moderate-to-severe acute pain indication and development program.",
        publisher: "FDA",
        license: .publicDomain,
        url: "https://www.fda.gov/news-events/press-announcements/fda-approves-novel-non-opioid-treatment-moderate-severe-acute-pain",
        lastRetrieved: "2026-09-19"
    )

    static let suzetrigine_trial = CitationSource(
        id: "recent_evidence_suzetrigine_trial",
        shortName: "Suzetrigine · phase 3 trials",
        detail: "Suzetrigine, a Nonopioid NaV1.8 Inhibitor for Treatment of Moderate-to-severe Acute Pain: Two Phase 3 Randomized Clinical Trials. 2025. PMID 40117446.",
        publisher: "Anesthesiology",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/40117446/",
        lastRetrieved: "2026-09-19"
    )

    static let gepotidacin_fda = CitationSource(
        id: "recent_evidence_gepotidacin_fda",
        shortName: "FDA · oral gonorrhea therapies",
        detail: "FDA approval announcement, December 12, 2025; Blujepa expanded indication approved December 11.",
        publisher: "FDA",
        license: .publicDomain,
        url: "https://www.fda.gov/news-events/press-announcements/fda-approves-two-oral-therapies-treat-gonorrhea",
        lastRetrieved: "2026-09-19"
    )

    static let gepotidacin_trial = CitationSource(
        id: "recent_evidence_gepotidacin_trial",
        shortName: "EAGLE-1 · gepotidacin",
        detail: "Oral gepotidacin for the treatment of uncomplicated urogenital gonorrhoea (EAGLE-1): a phase 3 randomised, open-label, non-inferiority, multicentre study. 2025. PMID 40245902.",
        publisher: "The Lancet",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/40245902/",
        lastRetrieved: "2026-09-19"
    )

    static let brensocatib_fda = CitationSource(
        id: "recent_evidence_brensocatib_fda",
        shortName: "FDA · Brinsupri snapshot",
        detail: "Drug Trials Snapshots: Brinsupri. Approval August 12, 2025; non-cystic fibrosis bronchiectasis.",
        publisher: "FDA",
        license: .publicDomain,
        url: "https://www.fda.gov/drugs/drug-trials-snapshots/drug-trials-snapshots-brinsupri",
        lastRetrieved: "2026-09-19"
    )

    static let aspen = CitationSource(
        id: "recent_evidence_aspen",
        shortName: "ASPEN · bronchiectasis",
        detail: "Chalmers et al. Phase 3 Trial of Brensocatib in Bronchiectasis. 2025. DOI 10.1056/NEJMoa2411664; PMID 40267423.",
        publisher: "New England Journal of Medicine",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/40267423/",
        lastRetrieved: "2026-09-19"
    )

    static let nerandomilast_fda = CitationSource(
        id: "recent_evidence_nerandomilast_fda",
        shortName: "FDA · progressive pulmonary fibrosis",
        detail: "FDA approval of Jascayd for progressive pulmonary fibrosis, December 19, 2025.",
        publisher: "FDA",
        license: .publicDomain,
        url: "https://www.fda.gov/drugs/news-events-human-drugs/fda-approves-drug-treat-chronic-progressive-lung-disease",
        lastRetrieved: "2026-09-19"
    )

    static let fibroneer = CitationSource(
        id: "recent_evidence_fibroneer",
        shortName: "FIBRONEER-IPF",
        detail: "Richeldi et al. Nerandomilast in Patients with Idiopathic Pulmonary Fibrosis. NEJM 2025;392:2193–2202. DOI 10.1056/NEJMoa2414108; PMID 40387033.",
        publisher: "New England Journal of Medicine",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/40387033/",
        lastRetrieved: "2026-09-19"
    )

    static let donanemab_fda = CitationSource(
        id: "recent_evidence_donanemab_fda",
        shortName: "FDA · Kisunla snapshot",
        detail: "Drug Trials Snapshots: Kisunla. Early Alzheimer disease trial population and approval evidence.",
        publisher: "FDA",
        license: .publicDomain,
        url: "https://www.fda.gov/drugs/drug-trials-snapshots/drug-trials-snapshots-kisunla",
        lastRetrieved: "2026-09-19"
    )

    static let alz6 = CitationSource(
        id: "recent_evidence_alz6",
        shortName: "TRAILBLAZER-ALZ 6 · completed analysis",
        detail: "Wang et al. The effect of modified donanemab titration on amyloid-related imaging abnormalities with edema/effusions and amyloid reduction: 18-month results from TRAILBLAZER-ALZ 6. 2025. DOI 10.1016/j.tjpad.2025.100266; PMID 40619285.",
        publisher: "The Journal of Prevention of Alzheimer’s Disease",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/40619285/",
        lastRetrieved: "2026-09-19"
    )

    static let zuranolone_fda = CitationSource(
        id: "recent_evidence_zuranolone_fda",
        shortName: "FDA · Zurzuvae snapshot",
        detail: "Drug Trials Snapshots: Zurzuvae. Adult postpartum depression indication; two placebo-controlled trials.",
        publisher: "FDA",
        license: .publicDomain,
        url: "https://www.fda.gov/drugs/drug-trials-snapshots/drug-trials-snapshots-zurzuvae",
        lastRetrieved: "2026-09-19"
    )

    static let zuranolone_trial = CitationSource(
        id: "recent_evidence_zuranolone_trial",
        shortName: "Zuranolone · postpartum depression trial",
        detail: "Deligiannidis et al. Zuranolone for the Treatment of Postpartum Depression. Am J Psychiatry 2023;180:668–675. DOI 10.1176/appi.ajp.20220785; PMID 37491938. Correction PMID 39659161 concerns a supplemental MADRS timepoint, not the reported HAM-D endpoint.",
        publisher: "American Journal of Psychiatry",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/37491938/",
        lastRetrieved: "2026-09-19"
    )

    static let ptau_fda = CitationSource(
        id: "recent_evidence_ptau_fda",
        shortName: "FDA · first Alzheimer blood test",
        detail: "FDA clearance of Lumipulse G pTau217/β-Amyloid 1-42 Plasma Ratio, May 16, 2025. Device-specific population, comparison study and limitations.",
        publisher: "FDA",
        license: .publicDomain,
        url: "https://www.fda.gov/news-events/press-announcements/fda-clears-first-blood-test-used-diagnosing-alzheimers-disease",
        lastRetrieved: "2026-09-19"
    )

    static let blood_biomarker_guideline = CitationSource(
        id: "recent_evidence_blood_biomarker_guideline",
        shortName: "Alzheimer’s Association · blood biomarkers",
        detail: "Palmqvist et al. Alzheimer’s Association Clinical Practice Guideline on blood-based biomarkers in specialized care. 2025. DOI 10.1002/alz.70535; PMID 40729527.",
        publisher: "Alzheimer’s & Dementia",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/40729527/",
        lastRetrieved: "2026-09-19"
    )

    static let hpv_fda = CitationSource(
        id: "recent_evidence_hpv_fda",
        shortName: "FDA · Teal Wand authorization",
        detail: "FDA De Novo review summary and classification order, DEN240045, May 9, 2025. Teal Wand prescription home vaginal collection device for specifically validated HPV molecular assays.",
        publisher: "FDA",
        license: .publicDomain,
        url: "https://www.accessdata.fda.gov/cdrh_docs/reviews/DEN240045.pdf",
        lastRetrieved: "2026-09-19"
    )

    static let self_cerv = CitationSource(
        id: "recent_evidence_self_cerv",
        shortName: "SELF-CERV · HPV self-collection",
        detail: "Clinical Validation of a Vaginal Cervical Cancer Screening Self-Collection Method for At-Home Use: A Nonrandomized Clinical Trial. 2025. PMID 40388167; NCT06120205.",
        publisher: "JAMA Network Open",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/40388167/",
        lastRetrieved: "2026-09-19"
    )

    static let lenacapavir_cdc = CitationSource(
        id: "recent_evidence_lenacapavir_cdc",
        shortName: "CDC · lenacapavir PrEP recommendation",
        detail: "Clinical Recommendation for the Use of Injectable Lenacapavir as HIV Preexposure Prophylaxis — United States, 2025. MMWR 74, September 18, 2025.",
        publisher: "CDC",
        license: .publicDomain,
        url: "https://www.cdc.gov/mmwr/volumes/74/wr/mm7435a1.htm",
        lastRetrieved: "2026-09-19"
    )

    static let purpose2 = CitationSource(
        id: "recent_evidence_purpose2",
        shortName: "PURPOSE 2 · HIV prevention",
        detail: "Twice-Yearly Lenacapavir for HIV Prevention in Men and Gender-Diverse Persons. DOI 10.1056/NEJMoa2411858; PMID 39602624. Online 2024, print 2025.",
        publisher: "New England Journal of Medicine",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/39602624/",
        lastRetrieved: "2026-09-19"
    )

    static let purpose1 = CitationSource(
        id: "recent_evidence_purpose1",
        shortName: "PURPOSE 1 · HIV prevention",
        detail: "Twice-Yearly Lenacapavir or Daily F/TAF for HIV Prevention in Cisgender Women. 2024. DOI 10.1056/NEJMoa2407001; PMID 39046157.",
        publisher: "New England Journal of Medicine",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/39046157/",
        lastRetrieved: "2026-09-19"
    )

    static let rsv_cdc = CitationSource(
        id: "recent_evidence_rsv_cdc",
        shortName: "CDC · adult RSV guidance",
        detail: "RSV Vaccine Guidance for Adults. Updated February 24, 2026. Eligibility, timing and repeat-dose guidance.",
        publisher: "CDC",
        license: .publicDomain,
        url: "https://www.cdc.gov/rsv/hcp/vaccine-clinical-guidance/adults.html",
        lastRetrieved: "2026-09-19"
    )

    static let dan_rsv = CitationSource(
        id: "recent_evidence_dan_rsv",
        shortName: "DAN-RSV · two-season follow-up",
        detail: "Lassen et al. Durability of RSV Prefusion F Vaccine Protection across Two RSV Seasons. NEJM Evidence, August 29, 2026. DOI 10.1056/EVIDoa2600242; PMID 42666088.",
        publisher: "NEJM Evidence",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/42666088/",
        lastRetrieved: "2026-09-19"
    )

    static let surmount5 = CitationSource(
        id: "recent_evidence_surmount5",
        shortName: "SURMOUNT-5 · obesity comparison",
        detail: "Aronne et al. Tirzepatide as Compared with Semaglutide for the Treatment of Obesity. 2025. DOI 10.1056/NEJMoa2416394; PMID 40353578.",
        publisher: "New England Journal of Medicine",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/40353578/",
        lastRetrieved: "2026-09-19"
    )

    static let obesity_cohort = CitationSource(
        id: "recent_evidence_obesity_cohort",
        shortName: "Tirzepatide–semaglutide · 2026 cohort",
        detail: "Katsura et al. Real-World Cardiovascular Outcomes of Obesity Treatment With Tirzepatide Versus Semaglutide in Non-Diabetic Adults. Diabetes Obes Metab 2026;28:5174–5183. DOI 10.1111/dom.70721; PMID 41891334.",
        publisher: "Diabetes, Obesity and Metabolism",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/41891334/",
        lastRetrieved: "2026-09-19"
    )

    static let obesity_niddk = CitationSource(
        id: "recent_evidence_obesity_niddk",
        shortName: "NIDDK · weight-management medicines",
        detail: "Prescription Medications to Treat Overweight & Obesity. Patient education: treatment selection, lifestyle support, adverse effects and discontinuation.",
        publisher: "NIDDK",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/weight-management/prescription-medications-treat-overweight-obesity",
        lastRetrieved: "2026-09-19"
    )

    static let confidence = CitationSource(
        id: "recent_evidence_confidence",
        shortName: "CONFIDENCE · combination kidney therapy",
        detail: "Agarwal et al. Finerenone with Empagliflozin in Chronic Kidney Disease and Type 2 Diabetes. NEJM 2025;393:533–543. DOI 10.1056/NEJMoa2410659; PMID 40470996.",
        publisher: "New England Journal of Medicine",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/40470996/",
        lastRetrieved: "2026-09-19"
    )

    static let uacr_niddk = CitationSource(
        id: "recent_evidence_uacr_niddk",
        shortName: "NIDDK · UACR and GFR",
        detail: "Quick Reference on UACR & GFR. Interpretation and measurement of albuminuria and estimated filtration.",
        publisher: "NIDDK",
        license: .publicDomain,
        url: "https://www.niddk.nih.gov/health-information/professionals/advanced-search/quick-reference-uacr-gfr",
        lastRetrieved: "2026-09-19"
    )

    static let soul = CitationSource(
        id: "recent_evidence_soul",
        shortName: "SOUL · oral semaglutide",
        detail: "McGuire et al. Oral Semaglutide and Cardiovascular Outcomes in High-Risk Type 2 Diabetes. 2025. DOI 10.1056/NEJMoa2501006; PMID 40162642.",
        publisher: "New England Journal of Medicine",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/40162642/",
        lastRetrieved: "2026-09-19"
    )

    static let soul_hf = CitationSource(
        id: "recent_evidence_soul_hf",
        shortName: "SOUL · 2026 heart-failure analysis",
        detail: "Pop-Busui et al. Oral Semaglutide and Heart Failure Outcomes in Persons With Type 2 Diabetes: A Secondary Analysis of the SOUL Randomized Clinical Trial. JAMA Intern Med 2026;186:426–436. DOI 10.1001/jamainternmed.2025.7774; PMID 41627802.",
        publisher: "JAMA Internal Medicine",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/41627802/",
        lastRetrieved: "2026-09-19"
    )

    static let bproad = CitationSource(
        id: "recent_evidence_bproad",
        shortName: "BPROAD · blood-pressure targets",
        detail: "Bi et al. Intensive Blood-Pressure Control in Patients with Type 2 Diabetes. NEJM 2025;392:1155–1167. DOI 10.1056/NEJMoa2412006; PMID 39555827. Online November 16, 2024.",
        publisher: "New England Journal of Medicine",
        license: .factCitationOnly,
        url: "https://pubmed.ncbi.nlm.nih.gov/39555827/",
        lastRetrieved: "2026-09-19"
    )

    static let bp_meta = CitationSource(
        id: "recent_evidence_bp_meta",
        shortName: "Blood-pressure intensification · 2026 review",
        detail: "Liu, Wang and Niu. Frontiers in Endocrinology 2026;17:1850865. DOI 10.3389/fendo.2026.1850865. Nine randomized trials in type 2 diabetes; search through December 12, 2025.",
        publisher: "Frontiers in Endocrinology",
        license: .ccBy4,
        url: "https://www.frontiersin.org/journals/endocrinology/articles/10.3389/fendo.2026.1850865/full",
        lastRetrieved: "2026-09-19"
    )

    static let bp_aha = CitationSource(
        id: "recent_evidence_bp_aha",
        shortName: "AHA/ACC · 2025 blood-pressure guidance",
        detail: "Top Things to Know: 2025 High Blood Pressure Guideline. Measurement, treatment goals and individualized management.",
        publisher: "American Heart Association",
        license: .factCitationOnly,
        url: "https://professional.heart.org/en/science-news/2025-high-blood-pressure-guideline/top-things-to-know",
        lastRetrieved: "2026-09-19"
    )

    static let hpv_enduring = CitationSource(
        id: "recent_evidence_hpv_enduring",
        shortName: "Enduring Guidelines · home HPV testing",
        detail: "Wentzensen et al. Re: Self-Collected Vaginal Specimens at Home for HPV Testing: Recommendations From the Enduring Guidelines Committee. J Low Genit Tract Dis 2026;30:97–99. DOI 10.1097/LGT.0000000000000929; PMID 41616373.",
        publisher: "Journal of Lower Genital Tract Disease",
        license: .factCitationOnly,
        url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC12994907/",
        lastRetrieved: "2026-09-19"
    )

    static let zuranolone_correction = CitationSource(
        id: "recent_evidence_zuranolone_correction",
        shortName: "Zuranolone trial · correction",
        detail: "Correction to Deligiannidis et al. Am J Psychiatry 2025;182:311. DOI 10.1176/appi.ajp.20220785correction; PMID 39659161.",
        publisher: "American Journal of Psychiatry",
        license: .factCitationOnly,
        url: "https://psychiatryonline.org/doi/10.1176/appi.ajp.20220785correction",
        lastRetrieved: "2026-09-19"
    )

}
#endif
