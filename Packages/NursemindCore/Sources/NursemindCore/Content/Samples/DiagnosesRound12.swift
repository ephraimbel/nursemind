import Foundation

// Curator-model diagnosis entries (round 12 expansion — adult solid tumors + GI/hepatic + heme malignancies).
// Sources: Open RN Health Alterations (CC BY 4.0), OpenStax (CC BY 4.0 with AI restriction),
// CDC + NCCN + AGA + AASLD concept citations.

private let openrnDxR12 = CitationSource(
    id: "openrn_dx_round12",
    shortName: "Open RN Health Alterations / Med-Surg",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=cancer+IBD+liver",
    lastRetrieved: "2026-05-04"
)
private let openstaxDxR12 = CitationSource(
    id: "openstax_dx_round12",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let cdcDxR12 = CitationSource(
    id: "cdc_dx_round12",
    shortName: "CDC clinical guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let specialtyDxR12 = CitationSource(
    id: "specialty_dx_round12",
    shortName: "NCCN / AGA / AASLD / ASCO concept citations",
    publisher: "NCCN · AGA · AASLD · ASCO",
    license: .factCitationOnly,
    url: "https://www.nccn.org/guidelines/",
    lastRetrieved: "2026-05-04"
)

private let oncR12 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cellularRegulation)
private let giR12 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .elimination)
private let hepR12 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let hemR12 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .clottingHemostasis)

// MARK: - Colorectal Cancer

public enum ColorectalCancerSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "colorectal-cancer",
        title: "Colorectal cancer (CRC)",
        subtitle: "Adenocarcinoma · screening reduces mortality · resection + chemo",
        nclexTags: oncR12,
        definition: AttributedProse(
            "Adenocarcinoma of the colon / rectum — third most common cancer and second-leading cause of cancer death in the U.S. Most arise from adenomatous polyps over 10–15 years. Effective screening + polyp removal reduces incidence and mortality per primary source.",
            citationIDs: ["openrn_dx_round12", "specialty_dx_round12"]
        ),
        pathophysiology: AttributedProse(
            "Adenoma → carcinoma sequence — APC, KRAS, p53 stepwise mutations. Risk factors: age ≥45, family history, IBD, FAP / Lynch syndrome, obesity, processed meat / low fiber, smoking, alcohol.",
            citationIDs: ["openrn_dx_round12"]
        ),
        presentation: [
            AttributedBullet("Often asymptomatic, found on screening.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Right-sided — chronic occult blood loss → iron-deficiency anemia, fatigue.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Left-sided — obstruction, change in stool caliber, hematochezia.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Constitutional — weight loss, fatigue.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Liver / lung mets — RUQ pain, jaundice, dyspnea.", citationIDs: ["openrn_dx_round12"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Colonoscopy with biopsy — gold standard; allows polypectomy.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("CT colonography (\"virtual\") — alternative; abnormalities require follow-up colonoscopy.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Stool-based — FIT (annual), Cologuard / FIT-DNA (every 1–3 years), gFOBT (less common now).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Staging — CT chest/abdomen/pelvis; CEA baseline; MRI rectum for rectal cancer.", citationIDs: ["openrn_dx_round12"])
        ],
        priorityAssessments: [
            AttributedBullet("Bowel pattern, rectal bleeding, weight, family history.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Anemia screen; fecal occult blood.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Genetic counseling for early-onset (<50) or strong family history (Lynch / FAP).", citationIDs: ["openrn_dx_round12"])
        ],
        commonInterventions: [
            AttributedBullet("Screening — USPSTF / ACS recommend screening starting age 45 for average risk; earlier and more frequent for high risk per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Surgical resection (laparoscopic or open) — primary treatment for localized disease.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Adjuvant chemotherapy — FOLFOX (5-FU + leucovorin + oxaliplatin) for stage III; CAPOX alternative; selective stage II per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Metastatic — chemo + targeted (bevacizumab, cetuximab if KRAS wild-type), immunotherapy (pembrolizumab) for MSI-H/dMMR per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Rectal cancer — total mesorectal excision; neoadjuvant chemoradiation for locally advanced; total neoadjuvant therapy increasingly per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Surveillance — CEA every 3–6 months × 5 yr, CT annually × 5 yr, colonoscopy 1 yr post + per protocol.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Counseling — diet, activity, smoking cessation, alcohol moderation.", citationIDs: ["openrn_dx_round12"])
        ],
        watchFor: [
            AttributedBullet("BOWEL OBSTRUCTION — emergent presentation; vomiting, distension, no flatus; diversion or stent.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Liver metastases — most common; resectable in select cases.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Recurrence — rising CEA on surveillance triggers imaging.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Lynch syndrome — first-degree relatives need screening; periodic gyn screening (endometrial / ovarian).", citationIDs: ["openrn_dx_round12"])
        ],
        citations: [openrnDxR12, specialtyDxR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Prostate Cancer

public enum ProstateCancerSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "prostate-cancer",
        title: "Prostate cancer",
        subtitle: "Most common male cancer · indolent vs aggressive · active surveillance vs treatment",
        nclexTags: oncR12,
        definition: AttributedProse(
            "Adenocarcinoma of the prostate gland — most common non-skin cancer in men. Wide spectrum from indolent low-grade (lifetime observation safe) to aggressive metastatic disease. Treatment decisions involve shared discussion of risk per primary source.",
            citationIDs: ["openrn_dx_round12", "specialty_dx_round12"]
        ),
        pathophysiology: AttributedProse(
            "Androgen-driven malignancy of prostate epithelial cells. Most arise from peripheral zone. Risk factors: age, Black race, family history, BRCA mutations, obesity, Western diet.",
            citationIDs: ["openrn_dx_round12"]
        ),
        presentation: [
            AttributedBullet("Often ASYMPTOMATIC — found on PSA screening or DRE.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("LUTS — urinary frequency, urgency, hesitancy, weak stream (often from co-existing BPH rather than cancer).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Hematuria, hematospermia, perineal pain (locally advanced).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Bone pain (mets — common to vertebrae, pelvis, ribs).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Spinal cord compression from vertebral mets — back pain + neuro deficit = oncologic emergency.", citationIDs: ["openrn_dx_round12"])
        ],
        diagnosticCriteria: [
            AttributedBullet("PSA + DRE → MRI prostate → image-guided biopsy if suspicious.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Biopsy — Gleason score (now ISUP grade groups 1–5); ≥7 (Gleason ≥3+4 = grade group ≥2) = clinically significant.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Staging — bone scan + CT for high-risk; PSMA PET emerging.", citationIDs: ["openrn_dx_round12"])
        ],
        priorityAssessments: [
            AttributedBullet("Voiding pattern, urinary symptoms, sexual function (baseline before treatment).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("PSA trend; family history; BRCA / Lynch genetic risk.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Bone pain or neurologic symptoms — rule out cord compression, bone mets.", citationIDs: ["openrn_dx_round12"])
        ],
        commonInterventions: [
            AttributedBullet("ACTIVE SURVEILLANCE — for low-risk disease (Grade Group 1, low PSA); serial PSA + repeat biopsy / MRI; AVOIDS overtreatment per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Radical prostatectomy — for localized intermediate/high-risk; risks of incontinence and erectile dysfunction.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Radiation therapy — external beam or brachytherapy; alternative to surgery; bowel/bladder side effects.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("ANDROGEN-DEPRIVATION THERAPY (ADT) — leuprolide / degarelix / orchiectomy; for advanced / metastatic disease per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Castration-resistant — abiraterone, enzalutamide, docetaxel, cabazitaxel, radium-223 for bone, PARP inhibitors for BRCA per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Bone-targeted — denosumab or zoledronic acid for skeletal-related events in metastatic disease.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Surveillance after definitive therapy — PSA every 6 months × 5 yr.", citationIDs: ["openrn_dx_round12"])
        ],
        watchFor: [
            AttributedBullet("CORD COMPRESSION — back pain + lower-extremity weakness in known prostate cancer = MRI emergency; high-dose steroids + radiation per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Bone fractures — pathologic; bone-targeted agents reduce risk.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("ADT side effects — hot flashes, sexual dysfunction, bone-density loss, metabolic syndrome, mood changes.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Mental health — diagnosis and treatment side effects affect quality of life; counsel and refer.", citationIDs: ["openrn_dx_round12"])
        ],
        citations: [openrnDxR12, specialtyDxR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pancreatic Cancer

public enum PancreaticCancerSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pancreatic-cancer",
        title: "Pancreatic cancer",
        subtitle: "Adenocarcinoma · poor prognosis · painless jaundice + weight loss",
        nclexTags: oncR12,
        definition: AttributedProse(
            "Most pancreatic cancers are adenocarcinomas of exocrine pancreas (90%+). Often diagnosed at advanced stage; 5-year survival ~12% overall. Risk factors: smoking, family history (BRCA / Lynch), chronic pancreatitis, obesity, T2DM per primary source.",
            citationIDs: ["openrn_dx_round12", "specialty_dx_round12"]
        ),
        pathophysiology: AttributedProse(
            "Most arise from pancreatic ductal cells; KRAS / TP53 / SMAD4 / CDKN2A mutations. Aggressive local invasion + early metastasis (liver, peritoneum). Head of pancreas tumors obstruct biliary tree → painless jaundice.",
            citationIDs: ["openrn_dx_round12"]
        ),
        presentation: [
            AttributedBullet("Painless jaundice (head of pancreas) — Courvoisier sign (palpable distended gallbladder + jaundice).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Weight loss, anorexia (often early and severe).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Abdominal / back pain (body / tail tumors; perineural invasion).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("New-onset DM in older adult without obesity — consider pancreatic cancer per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Steatorrhea (exocrine insufficiency).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Migratory thrombophlebitis (Trousseau syndrome).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Late — ascites, palpable Sister Mary Joseph nodule (umbilical mets), Virchow node.", citationIDs: ["openrn_dx_round12"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Multiphase CT or MRI pancreas (\"pancreas protocol\") — gold standard imaging.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("EUS (endoscopic ultrasound) with FNA — tissue diagnosis; high sensitivity for small tumors.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("CA 19-9 — supporting; not specific; useful for trending response.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("LFTs — obstructive pattern with biliary obstruction.", citationIDs: ["openrn_dx_round12"])
        ],
        priorityAssessments: [
            AttributedBullet("Nutritional status; pain pattern; new diabetes; family history.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Skin / sclera for jaundice; abdominal palpation for masses; calf pain (DVT).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Goals-of-care discussion early given prognosis.", citationIDs: ["openrn_dx_round12"])
        ],
        commonInterventions: [
            AttributedBullet("Surgical resection — only ~20% are resectable at diagnosis; Whipple (pancreaticoduodenectomy) for head; distal pancreatectomy for body/tail per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Adjuvant chemotherapy — modified FOLFIRINOX (younger / fit) or gemcitabine + capecitabine (older / less fit) per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Locally advanced unresectable — chemoradiation or chemo alone with possible conversion to surgery.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Metastatic — modified FOLFIRINOX or gemcitabine + nab-paclitaxel as first-line; targeted (olaparib if BRCA, larotrectinib if NTRK) per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Symptom management — biliary stent for obstruction, pancreatic-enzyme replacement for steatorrhea, opioids + celiac plexus block for pain.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Nutritional support; enteral feeding when possible.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Early palliative care + hospice — improves QoL, symptom control, and survival per primary source.", citationIDs: ["openrn_dx_round12"])
        ],
        watchFor: [
            AttributedBullet("VTE / Trousseau syndrome — high rate; anticoagulation per primary source (LMWH or DOAC).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Cholangitis from biliary obstruction — fever, RUQ pain, jaundice; emergent biliary drainage + antibiotics.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Cachexia / nutritional decline — pancreatic-enzyme replacement, megestrol / dronabinol per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Family history — first-degree relatives + BRCA / Lynch — refer for genetic counseling and surveillance per primary source.", citationIDs: ["openrn_dx_round12"])
        ],
        citations: [openrnDxR12, specialtyDxR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Gastric Cancer

public enum GastricCancerSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "gastric-cancer",
        title: "Gastric cancer",
        subtitle: "Adenocarcinoma · H. pylori-driven (intestinal type) · diffuse type aggressive",
        nclexTags: oncR12,
        definition: AttributedProse(
            "Adenocarcinoma of the stomach. Two main types — intestinal (often arises from chronic H. pylori gastritis → atrophic gastritis → intestinal metaplasia → dysplasia → carcinoma; better prognosis) and diffuse (signet-ring cells, infiltrative, worse prognosis). Higher prevalence in East Asia, Eastern Europe, South America per primary source.",
            citationIDs: ["openrn_dx_round12", "specialty_dx_round12"]
        ),
        pathophysiology: AttributedProse(
            "Risk factors — H. pylori (Class I carcinogen), high-salt / smoked / pickled foods, smoking, family history, hereditary diffuse gastric cancer (CDH1 mutation), pernicious anemia, prior gastric surgery.",
            citationIDs: ["openrn_dx_round12"]
        ),
        presentation: [
            AttributedBullet("Often asymptomatic until advanced.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Vague dyspepsia, early satiety, postprandial discomfort.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Weight loss, anorexia, nausea, fatigue.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Hematemesis / melena / iron-deficiency anemia.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Late — Virchow node (left supraclavicular), Sister Mary Joseph nodule, Krukenberg tumor (ovarian metastasis), ascites, palpable epigastric mass.", citationIDs: ["openrn_dx_round12"])
        ],
        diagnosticCriteria: [
            AttributedBullet("EGD with biopsy — gold standard.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("EUS for staging local invasion / nodes.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("CT chest/abdomen/pelvis; PET selected.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Molecular — HER2, MSI/MMR, PD-L1, Claudin-18.2 — informs treatment per primary source.", citationIDs: ["openrn_dx_round12"])
        ],
        priorityAssessments: [
            AttributedBullet("Nutritional status; weight loss; symptoms of bleeding.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("H. pylori testing in any patient with new dyspepsia per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Family history — CDH1 carriers may need prophylactic gastrectomy per primary source.", citationIDs: ["openrn_dx_round12"])
        ],
        commonInterventions: [
            AttributedBullet("Surgical resection — partial / total gastrectomy with D2 lymphadenectomy for resectable disease.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Perioperative chemotherapy — FLOT (fluorouracil + leucovorin + oxaliplatin + docetaxel) or platinum-based per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("HER2-positive metastatic — add trastuzumab to chemo per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Immunotherapy — pembrolizumab or nivolumab in PD-L1-positive or MSI-H per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("H. PYLORI eradication — reduces gastric-cancer risk in the population per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Post-gastrectomy — vitamin B12 replacement (lifelong), iron, calcium, vitamin D; monitor for dumping syndrome, anastomotic stricture.", citationIDs: ["openrn_dx_round12"])
        ],
        watchFor: [
            AttributedBullet("DUMPING SYNDROME post-gastrectomy — early (15–30 min postprandial cramping, palpitations) or late (1–3 hr hypoglycemia); small frequent meals, low-carb, separate fluids from solids.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("VITAMIN B12 deficiency — lifelong replacement after total / partial gastrectomy.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Peritoneal carcinomatosis → ascites, bowel obstruction.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("CDH1 carriers — prophylactic gastrectomy considered; family genetic counseling per primary source.", citationIDs: ["openrn_dx_round12"])
        ],
        citations: [openrnDxR12, specialtyDxR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Esophageal Cancer

public enum EsophagealCancerSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "esophageal-cancer",
        title: "Esophageal cancer",
        subtitle: "Adenocarcinoma vs squamous · GERD / Barrett's vs smoking / alcohol",
        nclexTags: oncR12,
        definition: AttributedProse(
            "Two main histologies — squamous-cell carcinoma (mid/upper esophagus; smoking + alcohol) and adenocarcinoma (lower esophagus / GE junction; Barrett's esophagus from chronic GERD). Adenocarcinoma now predominates in U.S. per primary source.",
            citationIDs: ["openrn_dx_round12", "specialty_dx_round12"]
        ),
        pathophysiology: AttributedProse(
            "Adenocarcinoma — chronic GERD → metaplasia (Barrett's) → dysplasia → carcinoma. Squamous — direct mucosal injury from smoking + alcohol + nitrates + hot beverages.",
            citationIDs: ["openrn_dx_round12"]
        ),
        presentation: [
            AttributedBullet("Progressive dysphagia — solids then liquids (most common presenting symptom).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Odynophagia, regurgitation.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Weight loss; anorexia.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Hoarseness (recurrent laryngeal nerve invasion); cough; aspiration pneumonia.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Hematemesis, melena, iron-deficiency anemia.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Late — fistula formation (TE fistula → recurrent pneumonia), supraclavicular adenopathy.", citationIDs: ["openrn_dx_round12"])
        ],
        diagnosticCriteria: [
            AttributedBullet("EGD with biopsy.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("EUS for local staging (T and N).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("CT chest / abdomen + PET for distant staging.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Molecular — HER2, PD-L1, Claudin-18.2 per primary source.", citationIDs: ["openrn_dx_round12"])
        ],
        priorityAssessments: [
            AttributedBullet("Swallow assessment, nutrition, weight, aspiration risk.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Risk factors — smoking, alcohol, GERD/Barrett's, obesity.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Hoarseness or stridor — airway evaluation.", citationIDs: ["openrn_dx_round12"])
        ],
        commonInterventions: [
            AttributedBullet("Resectable — neoadjuvant chemoradiation (CROSS regimen) → esophagectomy per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Locally advanced unresectable — definitive chemoradiation.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Metastatic — chemo (FOLFOX, paclitaxel + carboplatin), trastuzumab if HER2+, immunotherapy (nivolumab, pembrolizumab) per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Palliative — esophageal stent for dysphagia, PEG/J tube for nutrition, radiation for symptom relief.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Smoking cessation + alcohol moderation + acid suppression for Barrett's surveillance.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Barrett's surveillance EGD per AGA — no dysplasia 3–5 yr; low-grade 6–12 mo or endoscopic ablation; high-grade or carcinoma in situ — endoscopic resection / RFA per primary source.", citationIDs: ["specialty_dx_round12"])
        ],
        watchFor: [
            AttributedBullet("ASPIRATION pneumonia — recurrent; swallow eval, NPO if severe, alternate nutrition.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("TE FISTULA — recurrent pneumonia, choking with food/drink; bronchoscopy / esophagram; stenting.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Post-esophagectomy — anastomotic leak (most serious early), chyle leak, dumping, reflux.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Cachexia / malnutrition common; aggressive nutritional support.", citationIDs: ["openrn_dx_round12"])
        ],
        citations: [openrnDxR12, specialtyDxR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - HCC

public enum HCCSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hcc",
        title: "Hepatocellular carcinoma (HCC)",
        subtitle: "Cirrhosis-associated liver cancer · screen high-risk · BCLC staging",
        nclexTags: oncR12,
        definition: AttributedProse(
            "Most common primary liver cancer; arises in setting of cirrhosis from HBV, HCV, alcohol, NASH, hereditary hemochromatosis. AFP and imaging characteristics are diagnostic; biopsy not always required per primary source.",
            citationIDs: ["openrn_dx_round12", "specialty_dx_round12"]
        ),
        pathophysiology: AttributedProse(
            "Chronic liver inflammation + cirrhosis → hepatocyte regeneration with mutational accumulation → dysplastic nodules → HCC. Aflatoxin exposure (food contamination) is co-factor in regions of Asia / Africa.",
            citationIDs: ["openrn_dx_round12"]
        ),
        presentation: [
            AttributedBullet("Asymptomatic — found on surveillance imaging.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("RUQ pain, weight loss, anorexia, fatigue.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Decompensation of underlying cirrhosis — ascites, jaundice, encephalopathy, varices.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Paraneoplastic — hypoglycemia, erythrocytosis, hypercalcemia.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Tumor rupture — sudden severe abdominal pain + hemoperitoneum.", citationIDs: ["openrn_dx_round12"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Multiphase CT or MRI — characteristic arterial enhancement + portal venous washout (LI-RADS 5) is diagnostic in cirrhotic per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("AFP >400 ng/mL with characteristic imaging — supportive but not required.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Biopsy — when imaging not diagnostic or in non-cirrhotic.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("BCLC staging combines tumor burden + liver function (Child-Pugh) + performance status to guide therapy.", citationIDs: ["openrn_dx_round12"])
        ],
        priorityAssessments: [
            AttributedBullet("Cirrhosis severity (Child-Pugh, MELD); decompensation signs.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Underlying liver disease — HBV / HCV serology, alcohol use.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Performance status; transplant candidacy.", citationIDs: ["openrn_dx_round12"])
        ],
        commonInterventions: [
            AttributedBullet("SCREENING — AFP + abdominal US every 6 months in cirrhotic patients (HBV, HCV, alcohol, NASH) per AASLD per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("CURATIVE — surgical resection (preserved liver function), liver transplant (Milan criteria — single lesion ≤5 cm or up to 3 lesions ≤3 cm), or RFA / microwave ablation for small tumors per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("LOCAL — TACE (transarterial chemoembolization) or TARE (Y-90) for intermediate-stage per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("ADVANCED — atezolizumab + bevacizumab first-line; alternative — durvalumab + tremelimumab; sorafenib / lenvatinib / regorafenib per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("HBV antivirals (entecavir / tenofovir) reduce HCC recurrence + risk in HBV-infected.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("HCV cure (DAAs) markedly reduces HCC risk.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Alcohol cessation; manage NASH (weight, glycemic control, statin per primary source).", citationIDs: ["openrn_dx_round12"])
        ],
        watchFor: [
            AttributedBullet("DECOMPENSATION — varices, ascites, encephalopathy worsens during HCC course; manage per AASLD.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("TUMOR RUPTURE — sudden RUQ pain + shock; emergent angioembolization.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Bleeding from varices on active treatment — coordinate with hepatology.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Transplant candidacy reassessment as liver function changes.", citationIDs: ["openrn_dx_round12"])
        ],
        citations: [openrnDxR12, specialtyDxR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - RCC

public enum RCCSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "rcc",
        title: "Renal cell carcinoma (RCC)",
        subtitle: "Most common adult kidney cancer · classic triad rare · partial / radical nephrectomy",
        nclexTags: oncR12,
        definition: AttributedProse(
            "Most common adult kidney cancer; clear-cell histology most common (75%). Associated with smoking, obesity, HTN, dialysis, von Hippel-Lindau syndrome, hereditary syndromes per primary source.",
            citationIDs: ["openrn_dx_round12", "specialty_dx_round12"]
        ),
        pathophysiology: AttributedProse(
            "Arises from renal tubular epithelium. Clear-cell RCC commonly has VHL gene loss → HIF activation → angiogenesis (drives target for VEGF inhibitors).",
            citationIDs: ["openrn_dx_round12"]
        ),
        presentation: [
            AttributedBullet("Most often INCIDENTAL on imaging done for unrelated reasons.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Classic triad (rare and late) — hematuria + flank pain + palpable mass.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Hematuria, flank pain, weight loss, fatigue, fever.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Paraneoplastic — polycythemia (EPO), HTN (renin), hypercalcemia (PTHrP), Stauffer syndrome (hepatic dysfunction).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Left varicocele (sudden onset adult — left RCC obstructing renal vein).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Bone, lung, brain mets at diagnosis ~25%.", citationIDs: ["openrn_dx_round12"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CT or MRI abdomen with contrast — mass characterization (solid vs cystic, enhancement).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Biopsy — increasingly performed for small renal masses for histologic confirmation; not always needed if surgically resected.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Staging — chest CT, bone scan if symptoms.", citationIDs: ["openrn_dx_round12"])
        ],
        priorityAssessments: [
            AttributedBullet("Renal function (baseline before any nephrectomy).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Risk-factor history; family history (VHL, hereditary papillary).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Paraneoplastic features — HTN, polycythemia.", citationIDs: ["openrn_dx_round12"])
        ],
        commonInterventions: [
            AttributedBullet("Localized — partial (preferred for T1) OR radical nephrectomy; cryo / RF ablation for small tumors in non-surgical candidates per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("ADJUVANT — pembrolizumab approved for high-risk post-nephrectomy clear-cell per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("METASTATIC — combination immunotherapy + tyrosine-kinase inhibitor (e.g., axitinib + pembrolizumab; nivolumab + cabozantinib; pembrolizumab + lenvatinib) per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Cytoreductive nephrectomy — selected metastatic patients per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Surveillance — CT chest / abdomen at intervals per stage.", citationIDs: ["openrn_dx_round12"])
        ],
        watchFor: [
            AttributedBullet("Post-nephrectomy CKD — long-term renal function follow-up; avoid nephrotoxins per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("VTE — RCC has elevated thromboembolic risk.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Tumor thrombus extending into renal vein / IVC — surgical complexity; cardiothoracic involvement.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Hereditary syndromes — VHL, hereditary papillary, BHD; family screening.", citationIDs: ["openrn_dx_round12"])
        ],
        citations: [openrnDxR12, specialtyDxR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Bladder Cancer

public enum BladderCancerSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "bladder-cancer",
        title: "Bladder cancer",
        subtitle: "Urothelial carcinoma · painless gross hematuria · cystoscopy",
        nclexTags: oncR12,
        definition: AttributedProse(
            "Most common urinary-tract malignancy; ~90% urothelial (transitional-cell) carcinoma. Strongly associated with smoking and occupational chemical exposure (aromatic amines — dye, rubber, leather industries) per primary source.",
            citationIDs: ["openrn_dx_round12", "specialty_dx_round12"]
        ),
        pathophysiology: AttributedProse(
            "Urothelial mucosa of bladder, ureters, renal pelvis. \"Field-effect\" — entire urothelium at risk → bilateral / multifocal disease and recurrence common. Squamous-cell variant in regions endemic for schistosomiasis.",
            citationIDs: ["openrn_dx_round12"]
        ),
        presentation: [
            AttributedBullet("PAINLESS GROSS HEMATURIA — hallmark presenting symptom.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Microscopic hematuria found on routine UA in many cases.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Irritative voiding symptoms — frequency, urgency, dysuria (mimics UTI).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Late — pelvic pain, hydronephrosis, bone pain (mets).", citationIDs: ["openrn_dx_round12"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Cystoscopy with biopsy — gold standard.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Urine cytology — high-grade tumor; less sensitive for low-grade.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("CT urography — assesses upper urinary tract; rules out renal mass.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Staging — TNM via TURBT (transurethral resection of bladder tumor) for muscle invasion; CT for distant.", citationIDs: ["openrn_dx_round12"])
        ],
        priorityAssessments: [
            AttributedBullet("Hematuria timing, gross vs microscopic, with vs without clots.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Risk factors — smoking (current vs former), occupational chemical exposure, prior pelvic radiation, schistosomiasis.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Voiding symptoms; urinary retention.", citationIDs: ["openrn_dx_round12"])
        ],
        commonInterventions: [
            AttributedBullet("NMIBC (non-muscle-invasive) — TURBT + intravesical therapy (BCG for high-risk, mitomycin for low-grade) per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("MIBC (muscle-invasive) — neoadjuvant cisplatin-based chemo → radical cystectomy + ileal-conduit / neobladder OR bladder-preservation chemoradiation per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Metastatic — cisplatin- or carboplatin-based chemo; immunotherapy (pembrolizumab, atezolizumab, avelumab maintenance); enfortumab vedotin (Nectin-4 ADC), erdafitinib (FGFR) per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Surveillance — cystoscopy every 3 months × 2 yr, then per protocol; urine cytology; CT urography per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("SMOKING CESSATION — improves survival even after diagnosis.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Hydration; ostomy / continence support after cystectomy.", citationIDs: ["openrn_dx_round12"])
        ],
        watchFor: [
            AttributedBullet("Recurrence — high rate even for non-invasive; lifelong cystoscopy surveillance.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("BCG ADVERSE EFFECTS — cystitis, fever, hematuria; rare BCG sepsis (fever / chills / hypotension after instillation); hold BCG and treat with anti-TB therapy if systemic per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Post-cystectomy — stoma care, body image, sexual function counseling; vitamin B12 if neobladder uses ileum.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Upper-tract urothelial cancer — same field; CT urography surveillance.", citationIDs: ["openrn_dx_round12"])
        ],
        citations: [openrnDxR12, specialtyDxR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Ulcerative Colitis

public enum UCSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ulcerative-colitis",
        title: "Ulcerative colitis (UC)",
        subtitle: "Continuous mucosal colon disease · bloody diarrhea · 5-ASA / biologics / colectomy",
        nclexTags: giR12,
        definition: AttributedProse(
            "Chronic inflammatory bowel disease characterized by continuous mucosal inflammation of colon, starting at rectum and extending proximally. Distinct from Crohn's (which can affect any GI level + transmural). Curative option exists — total colectomy per primary source.",
            citationIDs: ["openrn_dx_round12", "specialty_dx_round12"]
        ),
        pathophysiology: AttributedProse(
            "Aberrant immune response to gut microbiota in genetically predisposed individuals. Mucosal inflammation → ulceration, friability, bleeding. Transmural disease and granulomas are NOT seen (vs Crohn's).",
            citationIDs: ["openrn_dx_round12"]
        ),
        presentation: [
            AttributedBullet("Bloody diarrhea (most common); urgency; tenesmus.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Abdominal cramping; weight loss.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Extraintestinal — uveitis / episcleritis, erythema nodosum, pyoderma gangrenosum, primary sclerosing cholangitis (PSC), arthritis.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Severe / fulminant — fever, tachycardia, hemodynamic compromise; toxic megacolon.", citationIDs: ["openrn_dx_round12"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Colonoscopy with biopsy — characteristic continuous distal disease + crypt abscesses + chronic inflammation per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Fecal calprotectin elevated; CRP / ESR elevated in active disease.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Stool studies — rule out C. diff, infectious colitis BEFORE attributing to flare.", citationIDs: ["openrn_dx_round12"])
        ],
        priorityAssessments: [
            AttributedBullet("Stool frequency / volume / bloody; abdominal pain; weight; signs of dehydration / anemia.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Severity — mild / moderate / severe / fulminant (Truelove + Witts).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Extraintestinal manifestations.", citationIDs: ["openrn_dx_round12"])
        ],
        commonInterventions: [
            AttributedBullet("Mild-moderate — 5-ASA (mesalamine) oral + topical for distal disease per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Moderate-severe — biologics (anti-TNF infliximab / adalimumab; vedolizumab; ustekinumab; risankizumab) ± JAK inhibitor (tofacitinib / upadacitinib) per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Acute severe UC (hospitalized) — IV methylprednisolone; if no response in 3–5 days → infliximab or cyclosporine RESCUE; surgical evaluation per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Maintenance — same biologic / thiopurine / 5-ASA; thiopurines (azathioprine / 6-MP) often combined with biologic to reduce immunogenicity.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("CURATIVE — total proctocolectomy with ileal pouch-anal anastomosis (IPAA) — eliminates colon cancer risk.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Surveillance colonoscopy every 1–3 years starting 8 years after diagnosis (10–15 years for left-sided) — ELEVATED colorectal cancer risk per primary source.", citationIDs: ["openrn_dx_round12"])
        ],
        watchFor: [
            AttributedBullet("TOXIC MEGACOLON — fever, tachycardia, abdominal distension, dilated colon (>6 cm) on imaging; emergent IV steroids + decompression + early surgical consult per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("PERFORATION — emergent surgery.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("VTE — IBD is hypercoagulable state; pharmacologic prophylaxis even with active GI bleed unless severe per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("PSC — co-occurring; cholangitis risk; needs hepatology surveillance.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Colorectal cancer — surveillance colonoscopy critical.", citationIDs: ["openrn_dx_round12"])
        ],
        citations: [openrnDxR12, specialtyDxR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Crohn's Disease

public enum CrohnsSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "crohns-disease",
        title: "Crohn's disease",
        subtitle: "Transmural skip lesions · any GI level · fistula / stricture · biologics",
        nclexTags: giR12,
        definition: AttributedProse(
            "Chronic inflammatory bowel disease with TRANSMURAL inflammation that can affect ANY part of the GI tract from mouth to anus, with characteristic SKIP LESIONS, fistulae, and strictures. Unlike UC, Crohn's is NOT cured by colectomy per primary source.",
            citationIDs: ["openrn_dx_round12", "specialty_dx_round12"]
        ),
        pathophysiology: AttributedProse(
            "Aberrant immune response to gut microbiota; transmural inflammation → fissures, fistulae, strictures, abscesses. Most common in terminal ileum and colon. Granulomas histologically (non-caseating).",
            citationIDs: ["openrn_dx_round12"]
        ),
        presentation: [
            AttributedBullet("Chronic abdominal pain (often RLQ), diarrhea (less commonly bloody than UC).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Weight loss, fatigue, fever, growth failure (peds).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Perianal disease — fissures, fistulae, abscesses, skin tags (often pathognomonic).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Aphthous oral ulcers, conjunctivitis, arthritis, skin lesions, gallstones, kidney stones.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Complications — bowel obstruction (stricture), enteric fistulae, malabsorption (B12 / vitamin D / iron / calcium).", citationIDs: ["openrn_dx_round12"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Colonoscopy with ileoscopy + biopsy — skip lesions, cobblestoning, granulomas.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("MRE (MR enterography) or CT enterography — assesses small-bowel involvement, strictures, fistulae per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Fecal calprotectin, CRP / ESR, CBC, B12, vitamin D, iron studies.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Stool studies to exclude infection.", citationIDs: ["openrn_dx_round12"])
        ],
        priorityAssessments: [
            AttributedBullet("Disease distribution + severity (Montreal classification: A age, L location, B behavior); perianal involvement.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Nutritional status — micronutrient deficiencies common.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Smoking — WORSENS Crohn's; counsel cessation per primary source.", citationIDs: ["openrn_dx_round12"])
        ],
        commonInterventions: [
            AttributedBullet("Mild — symptomatic; budesonide for ileal disease; nutritional therapy in pediatrics.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Moderate-severe — biologics (anti-TNF infliximab / adalimumab; vedolizumab; ustekinumab; risankizumab; mirikizumab) ± immunomodulator (azathioprine / 6-MP / methotrexate) per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Perianal fistulizing disease — anti-TNF (especially infliximab) + EUA / drainage / setons per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Abscess — drainage + antibiotics; fistula → surgical / interventional per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Strictures — endoscopic balloon dilation; surgical strictureplasty / resection.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Surgery — NOT curative; preserve as much bowel as possible (short-bowel risk); reserved for complications and refractory disease.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Smoking cessation; nutritional support; B12 lifelong if terminal-ileum resection; vaccinations updated.", citationIDs: ["openrn_dx_round12"])
        ],
        watchFor: [
            AttributedBullet("BOWEL OBSTRUCTION — strictures cause partial / complete obstruction; vomiting, distension; surgical evaluation.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("FISTULA — enterocutaneous, enterovesical (pneumaturia / fecaluria), enterovaginal — emergent imaging + surgery.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("ABSCESS — fever + abdominal pain + tenderness; CT confirms; drain + antibiotics; HOLD biologics during active infection.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("VTE risk in active disease — prophylaxis even during GI bleeding usually appropriate per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Lymphoma — particularly hepatosplenic T-cell lymphoma in young men on combination thiopurine + anti-TNF; counsel and risk-stratify per primary source.", citationIDs: ["openrn_dx_round12"])
        ],
        citations: [openrnDxR12, specialtyDxR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - NAFLD / NASH

public enum NAFLDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "nafld-nash",
        title: "NAFLD / NASH (now MASLD / MASH)",
        subtitle: "Metabolic-dysfunction associated steatotic liver disease · most common chronic liver disease",
        nclexTags: hepR12,
        definition: AttributedProse(
            "Spectrum of hepatic steatosis (fat infiltration) associated with metabolic dysfunction (T2DM, obesity, dyslipidemia, HTN) without significant alcohol use. NASH = non-alcoholic steatohepatitis = inflammation + steatosis ± fibrosis. NEW NOMENCLATURE per AASLD 2023 — MASLD (metabolic dysfunction-associated steatotic liver disease) and MASH per primary source.",
            citationIDs: ["openrn_dx_round12", "specialty_dx_round12"]
        ),
        pathophysiology: AttributedProse(
            "Insulin resistance + dyslipidemia → hepatic triglyceride accumulation → \"two-hit\" inflammation, oxidative stress, hepatocyte injury → progressive fibrosis → cirrhosis → HCC.",
            citationIDs: ["openrn_dx_round12"]
        ),
        presentation: [
            AttributedBullet("Most patients ASYMPTOMATIC; found on incidental imaging or LFT elevation.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Fatigue; RUQ discomfort.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Hepatomegaly on exam.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Late — cirrhosis features (ascites, varices, encephalopathy, jaundice).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Strong association — central obesity, T2DM, hyperlipidemia, metabolic syndrome.", citationIDs: ["openrn_dx_round12"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Hepatic steatosis on imaging (US, CT, MRI) — first-line.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("FibroScan / transient elastography — non-invasive fibrosis assessment.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("FIB-4 / NAFLD fibrosis score — risk-stratify based on age, AST, ALT, platelets, albumin.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Liver biopsy — gold standard for NASH and fibrosis staging; reserved for diagnostic uncertainty per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Exclude other causes — viral hepatitis, alcohol, autoimmune, hereditary hemochromatosis, Wilson disease, drug.", citationIDs: ["openrn_dx_round12"])
        ],
        priorityAssessments: [
            AttributedBullet("BMI / waist circumference; metabolic risk; alcohol use (must be <140 g/wk women, <210 g/wk men for diagnosis per primary source).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Diabetes / lipids / BP control.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Cirrhosis / decompensation signs in advanced disease.", citationIDs: ["openrn_dx_round12"])
        ],
        commonInterventions: [
            AttributedBullet("LIFESTYLE — weight loss is the only proven intervention to reverse steatosis and fibrosis; 5–7% weight loss reduces steatosis, 10%+ reduces fibrosis per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Diet — Mediterranean preferred; avoid fructose-sweetened beverages.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Manage metabolic comorbidities aggressively — A1c, lipids, BP per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("GLP-1 agonists (semaglutide / liraglutide) — significant weight loss + improvement in liver histology per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Resmetirom (THR-β agonist) — FDA-approved 2024 for NASH with significant fibrosis per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Vitamin E (in non-diabetic NASH); pioglitazone (in T2DM with NASH) — selected use per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Bariatric surgery — significant weight loss + NASH improvement; consider in obesity.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("HCC surveillance — every 6 months in cirrhotic NASH per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Avoid hepatotoxins; vaccinate hep A + B; alcohol moderation / cessation.", citationIDs: ["openrn_dx_round12"])
        ],
        watchFor: [
            AttributedBullet("Progression to CIRRHOSIS — ~20% of NASH; increases HCC risk markedly.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Cardiovascular disease — leading cause of death in NAFLD; aggressive risk-factor management.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Decompensation — same management as cirrhosis (ascites, varices, encephalopathy).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Lean NAFLD — non-obese patients with NAFLD; investigate for metabolic dysfunction.", citationIDs: ["openrn_dx_round12"])
        ],
        citations: [openrnDxR12, specialtyDxR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Acute Liver Failure

public enum ALFSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "acute-liver-failure",
        title: "Acute liver failure (ALF)",
        subtitle: "Coagulopathy + encephalopathy in <26 weeks · acetaminophen leading cause · transplant-center transfer",
        nclexTags: hepR12,
        definition: AttributedProse(
            "Acute hepatic dysfunction with coagulopathy (INR ≥1.5) AND any degree of encephalopathy in a patient WITHOUT pre-existing cirrhosis, with illness duration <26 weeks. Most common cause in U.S. — acetaminophen toxicity per primary source.",
            citationIDs: ["openrn_dx_round12", "specialty_dx_round12"]
        ),
        pathophysiology: AttributedProse(
            "Massive hepatocyte necrosis from drug toxicity (acetaminophen, idiosyncratic), viral hepatitis (HAV, HBV, HEV), autoimmune, ischemia, Wilson, Budd-Chiari, mushroom (Amanita), pregnancy-related (HELLP, AFLP).",
            citationIDs: ["openrn_dx_round12"]
        ),
        presentation: [
            AttributedBullet("Jaundice, fatigue, anorexia, nausea / vomiting, RUQ pain.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Coagulopathy — bleeding, easy bruising; INR ≥1.5.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Encephalopathy — confusion → stupor → coma (graded I–IV).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Cerebral edema (especially fulminant) — hypertension, bradycardia (Cushing reflex), pupillary changes.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Hypoglycemia, hypotension, AKI (hepatorenal), infection.", citationIDs: ["openrn_dx_round12"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Severe LFT elevation (often AST/ALT >1000), elevated bilirubin, INR ≥1.5; hypoglycemia common.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Acetaminophen level (essential — antidote available); HBV / HAV / HCV / HEV / autoimmune workup.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Imaging — RUQ US ± Doppler (rule out Budd-Chiari, biliary obstruction).", citationIDs: ["openrn_dx_round12"])
        ],
        priorityAssessments: [
            AttributedBullet("Mental status (encephalopathy grade); pupils; signs of cerebral edema.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Coagulopathy; glucose; renal function; ABG; electrolytes.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Medication / supplement review; mushroom ingestion; pregnancy.", citationIDs: ["openrn_dx_round12"])
        ],
        commonInterventions: [
            AttributedBullet("EMERGENT TRANSFER to liver-transplant center per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Acetaminophen — N-ACETYLCYSTEINE empirically (also benefit in non-acetaminophen ALF) per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("HBV reactivation — entecavir / tenofovir.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Autoimmune — high-dose corticosteroids per provider.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Cerebral edema — ICU; HOB 30°; mannitol or hypertonic saline; consider ICP monitoring per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Coagulopathy — DO NOT routinely correct unless bleeding or pre-procedure (INR is severity marker per primary source).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Hypoglycemia → glucose; hyponatremia → cautious correction.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("LIVER TRANSPLANT — definitive for many; use King's College / Clichy criteria for listing per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Avoid sedation if possible (masks encephalopathy assessment); avoid lactulose (limited benefit + worsens cerebral edema in ALF) per primary source.", citationIDs: ["openrn_dx_round12"])
        ],
        watchFor: [
            AttributedBullet("CEREBRAL EDEMA / HERNIATION — leading cause of death; aggressive ICU management.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("INFECTION — high risk; surveillance cultures; antibiotics per protocol.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("HEPATORENAL SYNDROME — emergent; liver transplant only definitive.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Spontaneous recovery vs need for transplant — King's College criteria assess prognosis per primary source.", citationIDs: ["openrn_dx_round12"])
        ],
        citations: [openrnDxR12, specialtyDxR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Multiple Myeloma

public enum MyelomaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "multiple-myeloma",
        title: "Multiple myeloma",
        subtitle: "Plasma-cell malignancy · CRAB features · M-protein + bone-marrow plasmacytosis",
        nclexTags: hemR12,
        definition: AttributedProse(
            "Malignancy of bone-marrow plasma cells producing monoclonal immunoglobulin (M-protein). Diagnosed by ≥10% clonal plasma cells in marrow OR plasmacytoma + 1 of CRAB criteria OR myeloma-defining biomarker per primary source.",
            citationIDs: ["openrn_dx_round12", "specialty_dx_round12"]
        ),
        pathophysiology: AttributedProse(
            "Clonal plasma-cell proliferation in bone marrow → osteolytic lesions, monoclonal protein production → end-organ damage. Median age at diagnosis 69; more common in Black population.",
            citationIDs: ["openrn_dx_round12"]
        ),
        presentation: [
            AttributedBullet("CRAB features — Hypercalcemia (>11 mg/dL or 1 mg/dL above ULN), Renal insufficiency (creatinine >2 or CrCl <40), Anemia (Hgb <10 or 2 g/dL below normal), Bone lytic lesions (≥1 lesion ≥5 mm).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Bone pain (back / chest), pathologic fractures.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Recurrent infections (functional hypogammaglobulinemia despite high M-protein).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Fatigue (anemia); cord compression from vertebral lesion.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Hyperviscosity — headache, vision changes, mucosal bleeding (when M-protein very high).", citationIDs: ["openrn_dx_round12"])
        ],
        diagnosticCriteria: [
            AttributedBullet("SPEP / UPEP / IFE — M-protein characterization; serum free light-chain ratio.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Bone marrow biopsy — clonal plasma cells.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Skeletal survey OR low-dose CT OR PET/CT for lytic lesions per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Beta-2 microglobulin and albumin for staging (R-ISS).", citationIDs: ["openrn_dx_round12"])
        ],
        priorityAssessments: [
            AttributedBullet("Renal function, calcium, hemoglobin; bone pain.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Infection screen; spinal exam (cord compression).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Performance status; transplant candidacy.", citationIDs: ["openrn_dx_round12"])
        ],
        commonInterventions: [
            AttributedBullet("Induction — combinations like bortezomib + lenalidomide + dexamethasone (VRd) ± daratumumab; further regimens per NCCN per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Autologous stem-cell transplant for eligible patients per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Maintenance — lenalidomide ± others.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Bone-targeted — bisphosphonate (zoledronic acid) or denosumab for skeletal-related events; calcium + vitamin D per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Hypercalcemia — IV fluids, calcitonin, bisphosphonate.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Renal protection — hydration, avoid NSAIDs / contrast / aminoglycosides.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Infection — vaccination, prophylactic acyclovir + TMP-SMX per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Cord compression — emergent radiation + steroids; surgical decompression if needed.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Newer — CAR-T (idecabtagene, ciltacabtagene), bispecific T-cell engagers (teclistamab, talquetamab) per primary source.", citationIDs: ["specialty_dx_round12"])
        ],
        watchFor: [
            AttributedBullet("CORD COMPRESSION — back pain + neurologic deficit = MRI emergency.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("HYPERVISCOSITY — vision changes, headache, mucosal bleeding; emergent plasmapheresis.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("ACUTE KIDNEY INJURY — light-chain cast nephropathy; aggressive hydration; consider plasmapheresis.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("TUMOR LYSIS in highly proliferative disease at induction — uric acid, K, phosphate.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("VTE — IMID (lenalidomide) + dexamethasone increases VTE; aspirin or LMWH prophylaxis per primary source.", citationIDs: ["openrn_dx_round12"])
        ],
        citations: [openrnDxR12, specialtyDxR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hodgkin Lymphoma

public enum HodgkinLymphomaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hodgkin-lymphoma",
        title: "Hodgkin lymphoma",
        subtitle: "Reed-Sternberg cells · bimodal age · highly curable",
        nclexTags: hemR12,
        definition: AttributedProse(
            "B-cell lymphoma characterized by Reed-Sternberg cells. Two main types — classical Hodgkin lymphoma (95%, includes nodular sclerosis subtype most common in young adults) and nodular lymphocyte-predominant Hodgkin lymphoma (NLPHL). One of the most curable cancers per primary source.",
            citationIDs: ["openrn_dx_round12", "specialty_dx_round12"]
        ),
        pathophysiology: AttributedProse(
            "Bimodal age distribution — young adults (20s) and older adults (60s+). EBV association in some cases. Reed-Sternberg cells are mutated germinal-center B-cells.",
            citationIDs: ["openrn_dx_round12"]
        ),
        presentation: [
            AttributedBullet("Painless cervical / supraclavicular / mediastinal lymphadenopathy.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("\"B SYMPTOMS\" — Fever (>38°C), drenching night sweats, weight loss (>10% in 6 mo) — STAGING modifier (B vs A).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Pruritus (sometimes); alcohol-induced lymph-node pain (rare but classic).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Mediastinal mass — cough, dyspnea, SVC syndrome (severe).", citationIDs: ["openrn_dx_round12"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Excisional lymph-node biopsy — REED-STERNBERG cells (large bi-nucleated \"owl-eye\") in inflammatory background.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Staging — PET/CT for whole-body assessment; bone marrow biopsy now optional in advanced cases per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Lugano staging system (replaces Ann Arbor); A vs B (B symptoms).", citationIDs: ["openrn_dx_round12"])
        ],
        priorityAssessments: [
            AttributedBullet("Lymph-node exam (cervical, supraclavicular, axillary, inguinal); abdominal exam (splenomegaly).", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("B symptoms; performance status.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Fertility counseling BEFORE chemotherapy in young patients per primary source.", citationIDs: ["openrn_dx_round12"])
        ],
        commonInterventions: [
            AttributedBullet("EARLY-STAGE — ABVD chemotherapy (doxorubicin + bleomycin + vinblastine + dacarbazine) ± involved-site radiation per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("ADVANCED-STAGE — escalated BEACOPP, A+AVD (brentuximab vedotin substituted for bleomycin), or pembrolizumab combinations per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("RELAPSED / refractory — brentuximab vedotin (anti-CD30 ADC), nivolumab / pembrolizumab; high-dose chemo + autologous SCT per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Cure rate — early stage ~95%, advanced stage ~70–80% per primary source.", citationIDs: ["specialty_dx_round12"]),
            AttributedBullet("Long-term survivorship — surveillance for secondary malignancy (breast, lung, leukemia from radiation / chemo), cardiac (anthracycline + chest radiation), pulmonary (bleomycin), endocrine (radiation), fertility per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Vaccinations — pneumococcal post-splenectomy / radiation; HPV; herpes zoster.", citationIDs: ["openrn_dx_round12"])
        ],
        watchFor: [
            AttributedBullet("MEDIASTINAL MASS COMPLICATIONS — SVC syndrome (oncologic emergency); pericardial effusion; airway compromise.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("BLEOMYCIN PULMONARY TOXICITY — interstitial pneumonitis; AVOID high FiO2 in survivors per primary source.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("FERTILITY PRESERVATION — sperm / oocyte / embryo cryopreservation BEFORE chemo in patients of reproductive age.", citationIDs: ["openrn_dx_round12"]),
            AttributedBullet("Late effects in survivors — secondary cancer, cardiac, pulmonary, thyroid, neurocognitive; lifelong surveillance per primary source.", citationIDs: ["openrn_dx_round12"])
        ],
        citations: [openrnDxR12, specialtyDxR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}
