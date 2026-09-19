import Foundation

/// Three items the Feed actually published, bundled so the showcase can set
/// the brief before the store has loaded anything. Captured from
/// `feed_items_ranked` on 2026-09-19; the live items replace them the
/// moment a refresh lands.
enum FeedShowcaseFixture {
    static let items: [FeedItem] = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return (try? decoder.decode([FeedItem].self, from: Data(json.utf8))) ?? []
    }()

    static let json = """
[
  {
    "id": "bd145413-5b4e-4f1e-9d68-3411de9ab16c",
    "source": "fda-enforcement",
    "source_url": "https://api.fda.gov/drug/enforcement.json?search=recall_number.exact:%22D-0811-2026%22",
    "source_published_at": "2026-09-09T00:00:00+00:00",
    "headline": "Baxter vasopressin injection recalled for CGMP deviations",
    "why_nurses_care": "A Class II recall affects vasopressin vials used in critical care; verify lot numbers and check your institution's supply.",
    "body": "Baxter Healthcare Corporation is recalling Vasopressin in 0.9% Sodium Chloride Injection, 0.2 units/mL in 100 mL single-dose containers [1]. The recall is classified as Class II and applies to product distributed nationwide in the United States, Puerto Rico, and Chile [1].\\n\\nThe reason for recall is current good manufacturing practice (CGMP) deviations [1]. Verification of lot numbers against the recall notice is a key step, and coordination with pharmacy and materials management helps identify affected vials in clinical areas. The recall status is ongoing [1], so institutional supply chains should be monitored for newly received inventory.",
    "ask_followup_prompt": "What lot numbers are included in this vasopressin recall, and how should we verify our current stock?",
    "category": "drug_safety",
    "specialties": [],
    "nclex_areas": [],
    "priority": "standard",
    "citations": [
      {
        "n": 1,
        "url": "https://api.fda.gov/drug/enforcement.json?search=recall_number.exact:%22D-0811-2026%22",
        "quote": "Class II. Baxter Healthcare Corporation is recalling Vasopressin, in 0.9% Sodium Chloride Injection, 20 units per 100 mL (0.2 units/mL), 100mL Single-Dose Container... Reason: CGMP Deviations. Distribution: US Nationwide; Puerto Rico; and Chile. Status: Ongoing.",
        "source": "FDA Drug Recalls (openFDA Enforcement)"
      }
    ],
    "published_at": "2026-09-19T04:32:02.318532+00:00"
  },
  {
    "id": "029bf463-8f31-47ce-b652-d14cd3bd5c0f",
    "source": "fda-enforcement",
    "source_url": "https://api.fda.gov/drug/enforcement.json?search=recall_number.exact:%22D-0813-2026%22",
    "source_published_at": "2026-09-09T00:00:00+00:00",
    "headline": "Cardene IV recall for CGMP deviations",
    "why_nurses_care": "A Class II recall of nicardipine IV affects supply of this critical antihypertensive agent.",
    "body": "Baxter Healthcare Corporation is recalling CARDENE IV (nicardipine hydrochloride) 0.2 mg/mL in 0.83% sodium chloride injection, supplied in GALAXY single-dose containers [1]. The recall is classified as Class II and is ongoing as of the published date [1]. The reason cited is current good manufacturing practice (CGMP) deviations [1]. Distribution includes the United States nationwide, Puerto Rico, and Chile [1].\\n\\nNicardipine is a dihydropyridine calcium channel blocker used for acute blood pressure reduction in hospitalized patients [1]. Nurses administering IV antihypertensives should verify lot numbers and check institutional recall notices. Affected facilities may need to identify alternative agents or sourcing while the recall remains active.",
    "ask_followup_prompt": "What are the clinical alternatives to IV nicardipine for acute hypertension management in hospitalized patients?",
    "category": "drug_safety",
    "specialties": [],
    "nclex_areas": [],
    "priority": "standard",
    "citations": [
      {
        "n": 1,
        "url": "https://api.fda.gov/drug/enforcement.json?search=recall_number.exact:%22D-0813-2026%22",
        "quote": "Class II. Baxter Healthcare Corporation is recalling CARDENE IV (Nicardipine Hydrochloride) in 0.83% Sodium Chloride Injection, 40 mg in 200 mL (0.2 mg/mL) in GALAXY Single-Dose Container... Reason: CGMP Deviations. Distribution: US Nationwide; Puerto Rico; and Chile.. Status: Ongoing.",
        "source": "FDA Drug Recalls (openFDA Enforcement)"
      }
    ],
    "published_at": "2026-09-19T04:32:02.39085+00:00"
  },
  {
    "id": "cf712447-b68b-4c06-a7e0-c0323fd2647c",
    "source": "plos-medicine",
    "source_url": "https://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.1004802",
    "source_published_at": "2026-09-11T14:00:00+00:00",
    "headline": "INHBC protein links Type 2 diabetes to kidney disease risk",
    "why_nurses_care": "A mendelian randomization study identifies a circulating protein that may mediate diabetic kidney disease.",
    "body": "Chronic kidney disease occurs in 20 to 50 percent of people living with Type 2 diabetes and is the leading cause of kidney failure worldwide [1]. The mechanisms linking diabetes to kidney injury remain incompletely understood, and few interventions reliably prevent CKD progression in this population.\\n\\nResearchers used large-scale proteomics and mendelian randomization to identify circulating proteins that may mediate the relationship between Type 2 diabetes and kidney dysfunction. Analysis of genetic and proteomic data from over one million participants identified five proteins—INHBC, GNPTG, LPO, AGRN, and CTSD—whose levels were altered by genetic predisposition to diabetes and were associated with kidney traits including blood urea nitrogen, estimated glomerular filtration rate, and CKD risk [1]. Higher circulating INHBC levels were associated with lower eGFR and higher BUN in mendelian randomization analyses, and this finding was replicated across four independent proteomic datasets [1].\\n\\nIn observational analysis of 37,854 UK Biobank participants, increased circulating INHBC levels were associated with increased hazard for kidney disease diagnosis [1]. The authors estimated that INHBC levels mediate approximately 1.3 percent [1] of the association between Type 2 diabetes and kidney disease diagnosis. The study was limited by its reliance on population-based cohorts assessing diabetes and kidney function separately rather than individuals with established diabetic kidney disease, and the authors note that additional functional analyses in disease-specific cohorts are needed [1].",
    "ask_followup_prompt": "What are the current mechanisms by which Type 2 diabetes causes chronic kidney disease, and how might INHBC fit into that pathway?",
    "category": "research",
    "specialties": [],
    "nclex_areas": [],
    "priority": "standard",
    "citations": [
      {
        "n": 1,
        "url": "https://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.1004802",
        "quote": "Chronic kidney disease (CKD) occurs in 20–50% of the people living with Type 2 diabetes (T2D) and is the leading cause of kidney failure worldwide... five proteins (INHBC, GNPTG, LPO, AGRN, and CTSD) affected three kidney traits (blood urea nitrogen [BUN], estimated glomerular filtration rate [eGFR] and CKD risk)... higher levels of circulating INHBC protein were estimated to lead to a lower eGFR and higher BUN... increased circulating INHBC levels were associated with increased hazard for kidney disease diagnosis in 37,854 UK Biobank participants... circulating INHBC levels mediate 1.3% (95% confidence interval [0.85%, 1.9%]) of the association between T2D and kidney disease diagnosis",
        "source": "PLOS Medicine"
      }
    ],
    "published_at": "2026-09-19T04:32:02.004941+00:00"
  }
]
"""
}
