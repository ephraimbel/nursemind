import Foundation

// Curator-model diagnosis entries (round 20 — STIs + GI common + addiction + peds rashes).

private let openrnDxR20 = CitationSource(
    id: "openrn_dx_round20",
    shortName: "Open RN Health Alterations + Maternity + Mental Health",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=STI+GI+addiction+peds+infection",
    lastRetrieved: "2026-05-12"
)
private let cdcDxR20 = CitationSource(
    id: "cdc_dx_round20",
    shortName: "CDC STI Treatment Guidelines 2021 + ACG / AAP concept citations",
    publisher: "CDC · ACG · AAP",
    license: .publicDomain,
    url: "https://www.cdc.gov/std/treatment-guidelines/",
    lastRetrieved: "2026-05-12"
)
private let specialtyDxR20 = CitationSource(
    id: "specialty_dx_round20",
    shortName: "ACG / AGA / ASAM / SAMHSA concept citations",
    publisher: "ACG · AGA · ASAM · SAMHSA",
    license: .factCitationOnly,
    url: "https://gi.org/guidelines/",
    lastRetrieved: "2026-05-12"
)

private let stiR20 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)
private let giR20 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .elimination)
private let psychR20 = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .mood)
private let pedsR20 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)

public enum TrichomoniasisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "trichomoniasis",
        title: "Trichomoniasis",
        subtitle: "Trichomonas vaginalis · most common curable STI · NAAT diagnosis · 7-day metro / single-dose tinidazole",
        nclexTags: stiR20,
        definition: AttributedProse(
            "Sexually transmitted protozoal infection caused by Trichomonas vaginalis — flagellated parasite affecting urogenital tract. Most common curable STI worldwide. Often asymptomatic in men; symptomatic in 50% of women per primary source.",
            citationIDs: ["openrn_dx_round20", "cdc_dx_round20"]
        ),
        pathophysiology: AttributedProse(
            "Anaerobic flagellated protozoan colonizes vaginal / urethral epithelium → inflammatory response → discharge + irritation. Infection associated with preterm birth, low birth weight, increased HIV acquisition + transmission.",
            citationIDs: ["openrn_dx_round20"]
        ),
        presentation: [
            AttributedBullet("Women — frothy yellow-green malodorous discharge; vaginal / vulvar irritation; dyspareunia; dysuria; \"strawberry cervix\" (punctate hemorrhages, ~2%).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Men — usually asymptomatic; sometimes urethritis, urethral discharge, dysuria.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Pregnancy — associated with PROM, preterm birth, low birth weight.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Increased susceptibility to + transmission of HIV.", citationIDs: ["cdc_dx_round20"])
        ],
        diagnosticCriteria: [
            AttributedBullet("NAAT (nucleic acid amplification) — most sensitive + specific; gold standard per primary source.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Wet mount microscopy — sees motile trichomonads; low sensitivity (~50–70%).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("OSOM Trichomonas Rapid Test — point-of-care; high specificity.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Universal HIV + STI panel — chlamydia, gonorrhea, syphilis testing recommended.", citationIDs: ["cdc_dx_round20"])
        ],
        priorityAssessments: [
            AttributedBullet("Sexual history including partners; pregnancy status.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("STI co-infection screening — universal HIV, GC, CT, syphilis.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Partner notification + treatment; expedited partner therapy where legal.", citationIDs: ["cdc_dx_round20"])
        ],
        commonInterventions: [
            AttributedBullet("WOMEN — METRONIDAZOLE 500 mg PO BID × 7 days (CDC 2021 update — single-dose less effective in women) per primary source.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("MEN — METRONIDAZOLE 2 g PO × 1 dose; or tinidazole 2 g PO × 1.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Alternative — tinidazole 2 g PO × 1 (less GI upset, longer half-life).", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Partner treatment SIMULTANEOUSLY; abstain until both treated + asymptomatic.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Alcohol avoidance during therapy + 72h after — disulfiram-like reaction.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Re-test in 3 months for women (high reinfection rate) per primary source.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Pregnancy — metronidazole 500 mg BID × 7 days in 2nd-3rd trimester acceptable; counsel + treat.", citationIDs: ["cdc_dx_round20"])
        ],
        watchFor: [
            AttributedBullet("REINFECTION — high rates without partner treatment; CDC recommends re-test at 3 months.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("RESISTANT TRICHOMONIASIS — increasing; refer for higher-dose / extended courses + cure-test.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("CONCURRENT HIV — increased transmission both directions; counsel safer sex.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Pregnancy outcomes — preterm birth, low birth weight; treat + monitor.", citationIDs: ["cdc_dx_round20"])
        ],
        citations: [openrnDxR20, cdcDxR20, specialtyDxR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum HPVWartsSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hpv-genital-warts",
        title: "HPV genital warts (condyloma acuminata)",
        subtitle: "HPV 6 + 11 mostly · imiquimod / cryo / podofilox · vaccinate · cervical screening still required",
        nclexTags: stiR20,
        definition: AttributedProse(
            "Sexually transmitted papillomavirus infection causing exophytic anogenital warts. Caused predominantly by HPV types 6 + 11 (low-risk for cancer). High-risk types (16, 18, 31, 33, etc.) cause cervical, oropharyngeal, anal cancer — different presentation per primary source.",
            citationIDs: ["openrn_dx_round20", "cdc_dx_round20"]
        ),
        pathophysiology: AttributedProse(
            "HPV infection of basal keratinocytes via micro-abrasion during sexual contact → viral replication → koilocytic atypia + exophytic growth → visible warts in 2–3 months. Most HPV infections clear spontaneously; ~10% become persistent.",
            citationIDs: ["openrn_dx_round20"]
        ),
        presentation: [
            AttributedBullet("Soft pink / flesh-colored papules or cauliflower-like growths on external genitalia, perianal area, anal canal, vagina, cervix.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Usually painless; sometimes pruritus, bleeding, or discomfort with intercourse.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Internal involvement (cervix, anal canal) may be asymptomatic — found on speculum / anoscopy.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Children — consider sexual abuse if not perinatally acquired; refer per protocol.", citationIDs: ["openrn_dx_round20"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical inspection — characteristic appearance.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Biopsy — atypical or refractory cases to rule out high-grade dysplasia / malignancy.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Acetic acid (\"vinegar\") test — whitens HPV lesions; low specificity; not recommended.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("HPV-PCR / genotyping — for cervical screening (different question), not for warts.", citationIDs: ["cdc_dx_round20"])
        ],
        priorityAssessments: [
            AttributedBullet("Sexual history; partner counseling.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Internal exam — speculum + cervical inspection; anoscopy if anal warts.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Concurrent STI screen; HIV.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Psychosocial — stigma, anxiety; counsel.", citationIDs: ["openrn_dx_round20"])
        ],
        commonInterventions: [
            AttributedBullet("PATIENT-APPLIED — imiquimod 5% cream 3×/week × 16 weeks OR podofilox 0.5% solution / gel BID × 3 days then 4 off, cycle up to 4 weeks OR sinecatechins 15% ointment 3×/day per primary source.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("PROVIDER-APPLIED — cryotherapy with liquid nitrogen weekly; TCA (trichloroacetic acid) 80–90% applied weekly; surgical (scissor / curette / laser) per primary source.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Recurrence common — 25-50% within 3 months regardless of therapy.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("HPV VACCINATION — for primary prevention; recommend Gardasil 9 if not vaccinated + within age range per primary source.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Cervical cancer screening per age-based guidelines — continued in vaccinated patients.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Condom use reduces but doesn't eliminate transmission (HPV can be in non-covered skin).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Counsel partner notification + screening — but no specific HPV test for asymptomatic partners.", citationIDs: ["cdc_dx_round20"])
        ],
        watchFor: [
            AttributedBullet("HIGH-GRADE DYSPLASIA / MALIGNANCY — atypical / refractory / pigmented lesions → biopsy.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("PREGNANCY — large warts can obstruct delivery; avoid podofilox + imiquimod in pregnancy; cryotherapy + TCA safer.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("IMMUNOCOMPROMISED — refractory / aggressive disease; specialty referral.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("CHILDREN — consider sexual abuse evaluation; mandatory reporting per state.", citationIDs: ["openrn_dx_round20"])
        ],
        citations: [openrnDxR20, cdcDxR20, specialtyDxR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum BVR20Sample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "bacterial-vaginosis",
        title: "Bacterial vaginosis (BV)",
        subtitle: "Polymicrobial dysbiosis · thin malodorous discharge · Amsel / Nugent · metronidazole / clindamycin",
        nclexTags: stiR20,
        definition: AttributedProse(
            "Polymicrobial vaginal dysbiosis — loss of Lactobacillus dominance + overgrowth of Gardnerella, Atopobium, Mobiluncus, anaerobes. Most common cause of vaginal discharge in reproductive-age women. NOT a classic STI (not transmitted person-to-person), but associated with sexual activity per primary source.",
            citationIDs: ["openrn_dx_round20", "cdc_dx_round20"]
        ),
        pathophysiology: AttributedProse(
            "Disruption of normal lactobacillus-dominated flora → rise in vaginal pH → overgrowth of anaerobic bacteria + biofilm formation → characteristic discharge. Risk factors: new / multiple partners, douching, IUDs (some), antibiotics.",
            citationIDs: ["openrn_dx_round20"]
        ),
        presentation: [
            AttributedBullet("Thin gray-white homogeneous discharge — adherent to vaginal walls.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("FISHY ODOR especially after sex / menses; positive whiff test (KOH).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Often asymptomatic (~50%); discomfort, irritation in symptomatic.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Risk factors — new / multiple sex partners, douching, recent abx, IUD users.", citationIDs: ["openrn_dx_round20"])
        ],
        diagnosticCriteria: [
            AttributedBullet("AMSEL criteria — ≥3 of 4: thin homogeneous discharge, pH >4.5, positive whiff test, ≥20% clue cells on micro per primary source.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("NUGENT score — Gram-stain scoring (research / lab standard).", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Molecular tests — Affirm VPIII, NuSwab, BD MAX — sensitive + specific.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Universal STI screen if risk factors — GC, CT, trichomoniasis (often co-infections).", citationIDs: ["cdc_dx_round20"])
        ],
        priorityAssessments: [
            AttributedBullet("Symptom severity + impact; recurrence pattern.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Pregnancy — BV associated with preterm birth, PROM; treat in symptomatic pregnant women.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Concurrent STI; differential trichomoniasis, candidiasis.", citationIDs: ["cdc_dx_round20"])
        ],
        commonInterventions: [
            AttributedBullet("METRONIDAZOLE 500 mg PO BID × 7 days (first-line CDC 2021).", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("ALT — metronidazole 0.75% gel intravaginally × 5 days OR clindamycin 2% cream × 7 days OR clindamycin 300 mg PO BID × 7 days.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Tinidazole 1 g PO × 5 days OR 2 g × 2 days — alternative.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Probiotic supplements — limited evidence for BV prevention / treatment per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Avoid douching; counsel sexual practices not necessarily causal; partner treatment generally NOT recommended for BV (unlike trich).", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Recurrence — common (~30% at 3 months); consider suppressive metronidazole gel 2×/week × 4–6 months for recurrent.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Alcohol avoidance during metronidazole + 72h after.", citationIDs: ["specialty_dx_round20"])
        ],
        watchFor: [
            AttributedBullet("RECURRENCE — common; suppressive therapy for ≥3 episodes/year per primary source.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("PREGNANCY — preterm birth + PROM association; screen + treat symptomatic.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("INCREASED HIV / STI ACQUISITION when BV present — safer-sex counsel.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Atrophic vaginitis (postmenopausal) — mimics BV; pair with vaginal estrogen if appropriate.", citationIDs: ["specialty_dx_round20"])
        ],
        citations: [openrnDxR20, cdcDxR20, specialtyDxR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum CholelithiasisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cholelithiasis",
        title: "Cholelithiasis (gallstones)",
        subtitle: "Asymptomatic stones · biliary colic if symptomatic · cholecystectomy for symptomatic / complicated",
        nclexTags: giR20,
        definition: AttributedProse(
            "Presence of gallstones in gallbladder — typically cholesterol (80%) or pigment (20%). 80% asymptomatic. Annual symptom risk in asymptomatic ~1–2%; once symptomatic, recurrence high → cholecystectomy indicated per primary source.",
            citationIDs: ["openrn_dx_round20", "specialty_dx_round20"]
        ),
        pathophysiology: AttributedProse(
            "Cholesterol supersaturation + biliary stasis + nucleation → stone formation. Risk factors — \"4 Fs\" (female, fertile, forty, fat), pregnancy, rapid weight loss, hemolytic anemia (pigment stones), Crohn's, parenteral nutrition.",
            citationIDs: ["openrn_dx_round20"]
        ),
        presentation: [
            AttributedBullet("Asymptomatic — most cases; incidental on imaging.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("BILIARY COLIC — postprandial RUQ / epigastric pain radiating to right scapula; lasts 30 min – several hours; resolves spontaneously; often after fatty meal.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("ACUTE CHOLECYSTITIS — persistent (>6 hr) RUQ pain + fever + Murphy's sign; complication = move to separate diagnosis.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("CHOLEDOCHOLITHIASIS — common bile duct stone → jaundice + cholangitis (Charcot's triad — fever, jaundice, RUQ pain).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("GALLSTONE PANCREATITIS — pancreatitis from stone migration.", citationIDs: ["openrn_dx_round20"])
        ],
        diagnosticCriteria: [
            AttributedBullet("RUQ ULTRASOUND — first-line; high sensitivity / specificity for stones per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("HIDA scan — if ultrasound equivocal + symptoms persist; assesses gallbladder function.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("MRCP / ERCP — for suspected choledocholithiasis (CBD stones).", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Labs — CMP (LFTs normal if uncomplicated; elevated in cholecystitis / CBD obstruction), lipase (rule out pancreatitis).", citationIDs: ["openrn_dx_round20"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain pattern + duration; constitutional symptoms; jaundice; fever.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Risk factors + medication review (estrogens, ceftriaxone — gallstone formers).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Surgical candidacy for cholecystectomy.", citationIDs: ["specialty_dx_round20"])
        ],
        commonInterventions: [
            AttributedBullet("ASYMPTOMATIC stones — no treatment; watchful waiting; lifestyle modification.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("SYMPTOMATIC — laparoscopic cholecystectomy (gold standard); elective for biliary colic, urgent for cholecystitis per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Non-surgical (rare) — ursodeoxycholic acid for cholesterol stones in poor surgical candidates; high recurrence after stopping.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("ERCP with stone extraction — CBD stones (choledocholithiasis); typically before cholecystectomy.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Pain management — NSAIDs (ketorolac, ibuprofen) often effective; opioids reserved for severe.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Dietary — low-fat, frequent small meals; weight management; avoid rapid weight loss.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Diabetic / immunocompromised — lower threshold for cholecystectomy (higher complication risk).", citationIDs: ["specialty_dx_round20"])
        ],
        watchFor: [
            AttributedBullet("ACUTE CHOLECYSTITIS — fever, persistent RUQ pain, Murphy's sign, leukocytosis; urgent surgical eval + abx.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("ASCENDING CHOLANGITIS — Charcot's triad / Reynold's pentad (add hypotension + AMS); emergent ERCP + IV abx.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("GALLSTONE PANCREATITIS — lipase elevation; admit + monitor; ERCP for persistent obstruction.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("GALLBLADDER CANCER — rare; consider in elderly / chronic stones / porcelain gallbladder.", citationIDs: ["specialty_dx_round20"])
        ],
        citations: [openrnDxR20, cdcDxR20, specialtyDxR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum AcuteDiverticulitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "diverticulitis-acute",
        title: "Acute diverticulitis",
        subtitle: "LLQ pain + fever + leukocytosis · CT diagnosis · outpatient (uncomplicated) vs admit + IV abx (complicated)",
        nclexTags: giR20,
        definition: AttributedProse(
            "Inflammation of colonic diverticula — most often sigmoid colon. Uncomplicated (~75%) responds to abx; complicated includes abscess, perforation, fistula, obstruction, peritonitis. Recurrence ~20% per primary source.",
            citationIDs: ["openrn_dx_round20", "specialty_dx_round20"]
        ),
        pathophysiology: AttributedProse(
            "Diverticulum (outpouching of mucosa through weakened muscle layer) → micro-perforation → focal inflammation ± abscess. Modern view emphasizes microbiome dysbiosis + low-grade chronic inflammation, not just mechanical obstruction.",
            citationIDs: ["openrn_dx_round20"]
        ),
        presentation: [
            AttributedBullet("LEFT LOWER QUADRANT pain — most characteristic (sigmoid colon predominates).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Fever, leukocytosis, nausea, change in bowel habits (constipation or diarrhea).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Asian populations + right-sided diverticulosis — RLQ pain (mimics appendicitis).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("COMPLICATED — perforation (peritonitis, sepsis), abscess (mass + persistent fever), fistula (colovesical → pneumaturia, fecaluria), obstruction.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Recurrent episodes — increasing complication risk; counsel.", citationIDs: ["specialty_dx_round20"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CT abdomen / pelvis with contrast — first-line; assesses severity, complications per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Labs — CBC (leukocytosis), CMP, urinalysis, lipase, blood / urine cultures.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("AVOID colonoscopy / barium enema in acute episode — perforation risk; defer 6-8 weeks for colon cancer screening per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Modified Hinchey classification — guides surgical management (I = pericolic phlegmon, II = pelvic abscess, III = purulent peritonitis, IV = fecal peritonitis).", citationIDs: ["specialty_dx_round20"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity — vitals, peritoneal signs, sepsis criteria.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Outpatient vs inpatient — uncomplicated stable patient can be outpatient with PO abx per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Surgical readiness — peritoneal signs, hemodynamic instability, abscess >4 cm.", citationIDs: ["specialty_dx_round20"])
        ],
        commonInterventions: [
            AttributedBullet("UNCOMPLICATED outpatient — clear liquids + reasonable activity + 7-10 day oral abx (amoxicillin-clavulanate OR metronidazole + ciprofloxacin / TMP-SMX) per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Recent evidence — some uncomplicated cases recover WITHOUT antibiotics; selective abx use emerging per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("COMPLICATED / sick / unable to tolerate PO — admit, IV ceftriaxone + metronidazole OR piperacillin-tazobactam.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("ABSCESS (Hinchey II) — IR drainage if >4 cm; antibiotics; surgery if refractory.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("PERFORATION (Hinchey III/IV) — emergent surgery (Hartmann's procedure or primary anastomosis with diversion).", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Diet — historically NPO acute, advance as tolerated; long-term high-fiber for prevention.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Colonoscopy 6-8 weeks after to rule out malignancy in first episode + selected recurrent per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Elective sigmoidectomy — recurrent / immunosuppressed / fistula; not routine after single episode.", citationIDs: ["specialty_dx_round20"])
        ],
        watchFor: [
            AttributedBullet("PERITONITIS / SEPSIS — emergent operative management.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("ABSCESS — percutaneous IR drainage + abx; surgical if >6cm / refractory.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("COLONIC OBSTRUCTION — strictures from prior episodes; surgical evaluation.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("FISTULA — colovesical most common; surgical repair.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("CONCURRENT COLON CANCER — interval colonoscopy at 6-8 weeks post-episode.", citationIDs: ["specialty_dx_round20"])
        ],
        citations: [openrnDxR20, cdcDxR20, specialtyDxR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum IBSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ibs",
        title: "Irritable bowel syndrome (IBS)",
        subtitle: "Functional disorder · Rome IV criteria · IBS-D / IBS-C / IBS-M · multimodal therapy",
        nclexTags: giR20,
        definition: AttributedProse(
            "Functional GI disorder — recurrent abdominal pain related to defecation OR associated with change in stool frequency / form, ≥1 day/week × 3 months, with onset ≥6 months prior per Rome IV criteria. Subtypes — IBS-D (diarrhea), IBS-C (constipation), IBS-M (mixed), IBS-U (unsubtypable) per primary source.",
            citationIDs: ["openrn_dx_round20", "specialty_dx_round20"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — visceral hypersensitivity, altered motility, gut-brain axis dysregulation, post-infectious changes, microbiome dysbiosis, psychological factors. Stress + diet are major triggers.",
            citationIDs: ["openrn_dx_round20"]
        ),
        presentation: [
            AttributedBullet("Recurrent abdominal pain related to defecation — relieved by BM or associated with change in stool form / frequency.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Bloating, distension, mucus in stool, feeling of incomplete evacuation.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("ALARM symptoms (NOT IBS — investigate) — weight loss, GI bleeding, anemia, family history of CRC / IBD, age >50 onset, nocturnal symptoms, fever.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Common comorbidities — anxiety, depression, fibromyalgia, migraines, interstitial cystitis.", citationIDs: ["openrn_dx_round20"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Rome IV — recurrent abdominal pain ≥1 day/week × 3 months + ≥2 of: related to defecation, change in stool frequency, change in stool form per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Limited workup in absence of alarm symptoms — CBC, CRP, celiac serology, TSH selectively.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Stool studies + colonoscopy — only if alarm symptoms or > 50 with new onset.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Differentiate from IBD (presence of inflammation), celiac, lactose intolerance.", citationIDs: ["specialty_dx_round20"])
        ],
        priorityAssessments: [
            AttributedBullet("Alarm symptom screen — never assume IBS in patients with red flags.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Subtype (D vs C vs M) — guides therapy.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Psychological + dietary contributors.", citationIDs: ["openrn_dx_round20"])
        ],
        commonInterventions: [
            AttributedBullet("DIET — low FODMAP trial (4-6 weeks reduce, then structured reintroduction); fiber for IBS-C; avoid triggers (caffeine, alcohol, fatty foods) per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("EXERCISE + STRESS MANAGEMENT — CBT, gut-directed hypnotherapy effective per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("IBS-D — loperamide, alosetron (women only), rifaximin (bloating-prominent), eluxadoline.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("IBS-C — fiber, PEG-3350, lubiprostone, linaclotide, plecanatide, tenapanor.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Antispasmodics — hyoscyamine, dicyclomine, peppermint oil for cramping (short-term).", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Antidepressants (low-dose TCAs, SSRIs) — visceral analgesia + mood; effective for severe.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Probiotics — limited but selective evidence; Bifidobacterium infantis 35624 some support.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Gut-directed CBT + hypnotherapy — robust evidence; mind-body approach.", citationIDs: ["specialty_dx_round20"])
        ],
        watchFor: [
            AttributedBullet("MISSED ORGANIC DISEASE — never accept IBS in alarm-symptom patients without workup.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("BILE ACID DIARRHEA — chronic diarrhea misdiagnosed as IBS-D; cholestyramine trial.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("MICROSCOPIC COLITIS in older adults — colonoscopy with biopsy.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("DEPRESSION + ANXIETY — bidirectional; treat both.", citationIDs: ["openrn_dx_round20"])
        ],
        citations: [openrnDxR20, cdcDxR20, specialtyDxR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum GERDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "gerd",
        title: "Gastroesophageal reflux disease (GERD)",
        subtitle: "Heartburn + regurgitation · lifestyle + PPI first-line · alarm symptoms = endoscopy",
        nclexTags: giR20,
        definition: AttributedProse(
            "Symptoms or complications resulting from reflux of gastric contents into esophagus. Affects ~20% of US adults. Spectrum from intermittent heartburn to erosive esophagitis to Barrett's esophagus per primary source.",
            citationIDs: ["openrn_dx_round20", "specialty_dx_round20"]
        ),
        pathophysiology: AttributedProse(
            "LES dysfunction + transient LES relaxations → acid reflux → mucosal injury. Contributors — obesity, hiatal hernia, delayed gastric emptying, pregnancy, smoking, medications (CCBs, anticholinergics, nitrates).",
            citationIDs: ["openrn_dx_round20"]
        ),
        presentation: [
            AttributedBullet("Heartburn (retrosternal burning) + regurgitation (acidic / sour taste) — cardinal symptoms.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Atypical — chronic cough, hoarseness, sore throat, asthma exacerbation, dental erosion.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Worse with — recumbency after meals, large/fatty meals, lying right side, certain foods (chocolate, mint, citrus, tomato).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Alarm — dysphagia, odynophagia, weight loss, anemia, hematemesis / melena, vomiting; refer endoscopy.", citationIDs: ["specialty_dx_round20"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis + empirical PPI trial — if classic symptoms without alarm features per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("EGD — alarm symptoms OR refractory after 8 weeks PPI; assesses erosive esophagitis, Barrett's.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Ambulatory pH or impedance-pH monitoring — refractory / atypical for objective evidence.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Esophageal manometry — pre-surgical evaluation; rule out achalasia.", citationIDs: ["specialty_dx_round20"])
        ],
        priorityAssessments: [
            AttributedBullet("Symptom severity + frequency + impact.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Alarm features → expedite endoscopy.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Medication review — drugs that worsen GERD; obesity + lifestyle.", citationIDs: ["openrn_dx_round20"])
        ],
        commonInterventions: [
            AttributedBullet("LIFESTYLE — weight loss (5–10% if overweight), elevate HOB ≥6\", avoid late meals (<3h before bed), avoid trigger foods, smoking cessation, alcohol moderation, left-side sleeping per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("PPI 8-week trial — omeprazole, esomeprazole, lansoprazole — first-line per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("H2 blockers (famotidine, ranitidine [withdrawn]) — milder cases, on-demand, nocturnal acid breakthrough.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Antacids — calcium carbonate, magnesium hydroxide — rapid PRN relief.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Step-down approach — taper PPI to lowest effective dose / H2 blocker / on-demand after 8 weeks.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Refractory — confirm diagnosis with pH study; consider fundoplication, magnetic sphincter augmentation, weight loss surgery.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Long-term PPI risks — bone fracture, B12 deficiency, hypomagnesemia, C. diff, AKI, dementia debate; use lowest effective dose per primary source.", citationIDs: ["specialty_dx_round20"])
        ],
        watchFor: [
            AttributedBullet("BARRETT'S ESOPHAGUS — long-standing GERD; surveillance endoscopy per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("EROSIVE ESOPHAGITIS — endoscopic finding; PPI healing course.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("STRICTURE / SCHATZKI'S RING — dysphagia; endoscopic dilation.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("ESOPHAGEAL ADENOCARCINOMA — Barrett's progression; surveillance.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("EXTRA-ESOPHAGEAL — asthma, laryngitis, dental erosion, chronic cough.", citationIDs: ["openrn_dx_round20"])
        ],
        citations: [openrnDxR20, cdcDxR20, specialtyDxR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum PUDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "peptic-ulcer",
        title: "Peptic ulcer disease (PUD)",
        subtitle: "Gastric or duodenal · H. pylori + NSAIDs · PPI + treat underlying · bleed / perforation risk",
        nclexTags: giR20,
        definition: AttributedProse(
            "Mucosal ulceration of stomach (gastric ulcer) or duodenum (duodenal ulcer) — extends through muscularis mucosae. Most caused by H. pylori or NSAIDs; smaller share by Zollinger-Ellison, malignancy, stress. Complications — bleeding, perforation, obstruction per primary source.",
            citationIDs: ["openrn_dx_round20", "specialty_dx_round20"]
        ),
        pathophysiology: AttributedProse(
            "Disruption of mucosal defense (mucus, bicarbonate, prostaglandins, blood flow) → exposure to acid + pepsin → ulceration. H. pylori urease, NSAID-induced COX inhibition (reduces protective PGs), acid hypersecretion (Zollinger-Ellison).",
            citationIDs: ["openrn_dx_round20"]
        ),
        presentation: [
            AttributedBullet("Epigastric pain — gnawing / burning; DUODENAL — worsens 2–3 hr after meals, improves with food; GASTRIC — worsens with food.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Nausea, bloating, early satiety, weight loss (especially gastric).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("BLEEDING — hematemesis (coffee-ground or bright red), melena, hematochezia (massive); 15–20% lifetime risk.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("PERFORATION — sudden severe pain, peritoneal signs, free air under diaphragm on imaging; <5% but emergent.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("OBSTRUCTION — gastric outlet from scarring; vomiting + early satiety + weight loss.", citationIDs: ["openrn_dx_round20"])
        ],
        diagnosticCriteria: [
            AttributedBullet("EGD — gold standard; biopsy any gastric ulcer (rule out malignancy) per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("H. PYLORI testing — stool antigen, urea breath test, biopsy with histology / rapid urease test (CLO); serology less useful (can't distinguish current from prior).", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Hold PPI 2 weeks before testing — false negatives.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Fasting gastrin — Zollinger-Ellison if recurrent / multiple / refractory ulcers (off PPI).", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Repeat EGD 8–12 weeks for gastric ulcer — confirm healing + rule out malignancy.", citationIDs: ["specialty_dx_round20"])
        ],
        priorityAssessments: [
            AttributedBullet("Identify + remove triggers — H. pylori, NSAIDs, smoking, alcohol.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Bleeding signs — Hgb trend, hemodynamics; melena / hematemesis = emergent.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Perforation signs — peritoneal exam, free air imaging.", citationIDs: ["openrn_dx_round20"])
        ],
        commonInterventions: [
            AttributedBullet("PPI 8–12 weeks — first-line for ulcer healing per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("H. PYLORI ERADICATION — quadruple therapy preferred (bismuth + tetracycline + metronidazole + PPI × 14 days) OR PCAB-based regimens (vonoprazan + amoxicillin + clarithromycin) per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("STOP NSAIDs — if continued, add PPI prophylaxis OR switch to celecoxib selectively.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Confirm H. pylori eradication 4+ weeks post-treatment via stool antigen / breath test.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("BLEEDING ULCER — IV PPI bolus + infusion, EGD with endoscopic hemostasis (clips, thermal, injection), transfusion as needed per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("PERFORATION — emergent surgical repair (Graham patch); fluid resuscitation + broad-spectrum abx.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Lifestyle — smoking cessation, alcohol moderation, stress management, smaller meals.", citationIDs: ["openrn_dx_round20"])
        ],
        watchFor: [
            AttributedBullet("UGI BLEED — emergent; high mortality without prompt EGD + PPI.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("PERFORATION — surgical emergency; mortality 5–10% if delayed.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("GASTRIC MALIGNANCY — every gastric ulcer needs biopsy + re-endoscopy to confirm healing.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("ZOLLINGER-ELLISON — refractory / multiple ulcers; fasting gastrin + secretin stimulation.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("H. pylori antibiotic resistance — clarithromycin resistance rising; choose regimens per local susceptibility.", citationIDs: ["specialty_dx_round20"])
        ],
        citations: [openrnDxR20, cdcDxR20, specialtyDxR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum GastritisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "gastritis",
        title: "Gastritis",
        subtitle: "Gastric mucosal inflammation · acute (NSAID / alcohol / stress) vs chronic (H. pylori / autoimmune) · PPI + remove trigger",
        nclexTags: giR20,
        definition: AttributedProse(
            "Inflammation of gastric mucosa — acute (erosive) or chronic (non-erosive). Acute often associated with NSAIDs, alcohol, severe stress (ICU). Chronic mostly H. pylori or autoimmune (pernicious anemia). Distinct from PUD by mucosal depth + presentation per primary source.",
            citationIDs: ["openrn_dx_round20", "specialty_dx_round20"]
        ),
        pathophysiology: AttributedProse(
            "Inflammation can be reactive (NSAID, alcohol, stress, bile reflux), infectious (H. pylori most common), or autoimmune (anti-parietal cell antibodies → atrophic gastritis + pernicious anemia + B12 deficiency).",
            citationIDs: ["openrn_dx_round20"]
        ),
        presentation: [
            AttributedBullet("Often asymptomatic; may have epigastric discomfort, nausea, early satiety, bloating.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Acute erosive — UGI bleed (especially ICU stress ulcer); hematemesis or melena.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Autoimmune (chronic atrophic) — B12 deficiency symptoms (anemia, neuropathy, cognitive); pernicious anemia is the classic presentation.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("H. pylori-related — overlap with PUD symptoms; may progress to ulcer or gastric cancer over years.", citationIDs: ["openrn_dx_round20"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical history + EGD — biopsy confirms histology + H. pylori + atrophy per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("H. pylori testing — stool antigen / breath test / biopsy.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("CBC + B12 + intrinsic factor antibody + anti-parietal cell antibody — autoimmune workup.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Differentiate from PUD, dyspepsia, GERD, gastric cancer.", citationIDs: ["specialty_dx_round20"])
        ],
        priorityAssessments: [
            AttributedBullet("Identify trigger (medications, alcohol, illness severity, H. pylori).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("ICU patients — stress ulcer prophylaxis if mechanical ventilation, coagulopathy, sepsis.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Autoimmune patients — B12 replacement + screen other autoimmune conditions (thyroid, T1DM).", citationIDs: ["specialty_dx_round20"])
        ],
        commonInterventions: [
            AttributedBullet("Remove offending agent — NSAIDs, alcohol, smoking.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("PPI 4-8 weeks for symptomatic + erosive gastritis per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("H. pylori eradication — quadruple therapy or PCAB-based as for PUD per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Stress ulcer prophylaxis in ICU — PPI / H2 blocker for ventilated, coagulopathic, sepsis patients.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Autoimmune — lifelong B12 replacement (parenteral or high-dose oral); screen + surveil for atrophic gastritis-associated gastric cancer per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Diet — bland, frequent small meals; avoid triggers (caffeine, alcohol, spicy, NSAIDs).", citationIDs: ["openrn_dx_round20"])
        ],
        watchFor: [
            AttributedBullet("ACUTE BLEEDING — emergent EGD + PPI infusion.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("CHRONIC ATROPHIC GASTRITIS — gastric cancer + carcinoid risk; surveillance endoscopy.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("B12 deficiency in autoimmune type — neurologic symptoms; replace before becoming irreversible.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Concurrent autoimmune disorders — screen thyroid (Hashimoto), T1DM.", citationIDs: ["specialty_dx_round20"])
        ],
        citations: [openrnDxR20, cdcDxR20, specialtyDxR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum LactoseIntoleranceSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "lactose-intolerance",
        title: "Lactose intolerance",
        subtitle: "Lactase deficiency · gas + diarrhea after dairy · lactase tablets or dietary adjustment",
        nclexTags: giR20,
        definition: AttributedProse(
            "Inability to digest lactose due to deficient intestinal lactase enzyme. Primary (genetic, age-related decline — common in Asian, African, Latino populations), secondary (post-infectious / IBD / celiac), or congenital (rare). Distinct from milk allergy (immune-mediated) per primary source.",
            citationIDs: ["openrn_dx_round20", "specialty_dx_round20"]
        ),
        pathophysiology: AttributedProse(
            "Insufficient lactase activity at intestinal brush border → undigested lactose reaches colon → bacterial fermentation produces gas (H2, methane, CO2) + osmotic water → bloating, gas, diarrhea.",
            citationIDs: ["openrn_dx_round20"]
        ),
        presentation: [
            AttributedBullet("Symptoms 30 min – 2 hours after dairy — bloating, gas, abdominal pain, diarrhea, nausea.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Dose-dependent — symptoms may not occur with small amounts (e.g., milk in coffee).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("NOT IgE-mediated — no urticaria, anaphylaxis, eczema (those = milk allergy).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Primary onset typically 20s-30s as lactase activity declines.", citationIDs: ["openrn_dx_round20"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Lactose-free dietary trial for 2 weeks + symptom resolution + recurrence on reintroduction — most practical.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Hydrogen breath test — most accurate; lactose load → breath H2 measurement per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Lactose tolerance test — blood glucose response to lactose load; less specific.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Genetic testing — LCT gene polymorphisms; supportive for primary.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Workup secondary — celiac serology, stool studies, colonoscopy if atypical / persistent.", citationIDs: ["specialty_dx_round20"])
        ],
        priorityAssessments: [
            AttributedBullet("Distinguish from milk allergy (IgE-mediated) — different management; emergent epinephrine if anaphylaxis.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Calcium + vitamin D intake — at risk for inadequate if avoid dairy.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Concurrent IBS / IBD / celiac considerations.", citationIDs: ["openrn_dx_round20"])
        ],
        commonInterventions: [
            AttributedBullet("DIETARY — limit lactose-containing foods OR use lactose-free dairy products per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("LACTASE SUPPLEMENT (Lactaid) — taken with first bite of dairy-containing meal.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Calcium + vitamin D supplementation if dairy restricted — 1000 mg Ca + 600-800 IU D daily.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Many tolerate small amounts of lactose (especially fermented dairy like yogurt + aged cheese which have less).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Treat underlying secondary cause — celiac, IBD, infection.", citationIDs: ["specialty_dx_round20"])
        ],
        watchFor: [
            AttributedBullet("CALCIUM / VITAMIN D INSUFFICIENCY — long-term dairy avoidance; bone density risk.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("CONFUSION WITH MILK ALLERGY — allergy can be life-threatening (anaphylaxis); lactose intolerance is not.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("UNDIAGNOSED CELIAC / IBD — secondary lactase deficiency from villous damage; workup if persistent.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Hidden lactose — bread, salad dressings, processed foods, medications (excipient).", citationIDs: ["openrn_dx_round20"])
        ],
        citations: [openrnDxR20, cdcDxR20, specialtyDxR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum CeliacDiseaseSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "celiac-disease",
        title: "Celiac disease",
        subtitle: "Gluten-triggered autoimmune enteropathy · tTG-IgA + biopsy · LIFELONG GLUTEN-FREE diet · monitor B12/iron/D",
        nclexTags: giR20,
        definition: AttributedProse(
            "Immune-mediated systemic disorder triggered by gluten (wheat, barley, rye) in genetically susceptible individuals (HLA-DQ2 / DQ8). Causes villous atrophy + chronic intestinal inflammation. ~1% of US population; many undiagnosed per primary source.",
            citationIDs: ["openrn_dx_round20", "specialty_dx_round20"]
        ),
        pathophysiology: AttributedProse(
            "Gluten peptides (especially gliadin) deamidated by tissue transglutaminase → presented by HLA-DQ2 / DQ8 → CD4 T-cell activation + autoantibodies → villous flattening + crypt hyperplasia + lymphocyte infiltration → malabsorption.",
            citationIDs: ["openrn_dx_round20"]
        ),
        presentation: [
            AttributedBullet("Classic — chronic diarrhea, steatorrhea, weight loss, bloating, abdominal pain.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Atypical / silent (more common in adults) — iron-deficiency anemia, osteoporosis, infertility, neurologic (ataxia, neuropathy), fatigue, transaminitis, dental enamel defects.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Dermatitis herpetiformis — pruritic vesicular rash on extensor surfaces; pathognomonic skin manifestation.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Failure to thrive in children + delayed puberty.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Associations — Type 1 DM, autoimmune thyroid, Down syndrome, Turner syndrome, IgA deficiency.", citationIDs: ["openrn_dx_round20"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Tissue transglutaminase IgA (tTG-IgA) + total IgA — first-line; while ON gluten-containing diet per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("If IgA deficient (~3% of celiac) — use tTG-IgG or DGP-IgG.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("EGD with DUODENAL BIOPSY — gold standard; ≥4 biopsies from distal duodenum + 2 from bulb; Marsh classification.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("HLA-DQ2 / DQ8 — high negative predictive value; confirms genetic susceptibility but doesn't prove disease.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("DO NOT START gluten-free diet BEFORE testing — false-negatives.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Screen first-degree relatives — ~10% celiac prevalence.", citationIDs: ["specialty_dx_round20"])
        ],
        priorityAssessments: [
            AttributedBullet("Confirm diagnosis BEFORE starting GF diet.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Nutritional deficiencies — iron, ferritin, B12, folate, vitamin D, calcium, zinc.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Bone density — DEXA at diagnosis; increased fracture risk.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Concurrent autoimmune disease screening.", citationIDs: ["specialty_dx_round20"])
        ],
        commonInterventions: [
            AttributedBullet("LIFELONG STRICT GLUTEN-FREE DIET — single most important intervention per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Dietitian consultation — identify hidden gluten, cross-contamination, label reading.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Nutritional repletion — iron, B12, folate, vitamin D, calcium per deficits.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Monitor antibody normalization at 6 + 12 months; persistent positivity suggests dietary lapses.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Repeat biopsy 1-2 years if persistent symptoms / antibody elevation — confirm mucosal healing.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Bone-density follow-up + osteoporosis treatment as indicated.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Vaccinations — pneumococcal (functional hyposplenism in some celiac patients).", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Support — Celiac Disease Foundation, local groups; significant lifestyle adjustment.", citationIDs: ["openrn_dx_round20"])
        ],
        watchFor: [
            AttributedBullet("REFRACTORY CELIAC — persistent symptoms + villous atrophy despite strict GF for 6+ months; specialty referral; risk of EATL lymphoma.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("ENTEROPATHY-ASSOCIATED T-CELL LYMPHOMA — rare but serious; ongoing surveillance.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("DERMATITIS HERPETIFORMIS — responsive to GF diet; sometimes dapsone short-term.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("INFERTILITY + PREGNANCY LOSS — improves with GF diet; screen women with recurrent loss.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("BONE DENSITY — DEXA periodically; calcium + vit D + bisphosphonates if osteoporotic.", citationIDs: ["specialty_dx_round20"])
        ],
        citations: [openrnDxR20, cdcDxR20, specialtyDxR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum AUDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "alcohol-use-disorder",
        title: "Alcohol use disorder (AUD)",
        subtitle: "DSM-5 criteria · MAT (naltrexone / acamprosate / disulfiram) · CIWA withdrawal management",
        nclexTags: psychR20,
        definition: AttributedProse(
            "Problematic pattern of alcohol use → clinically significant impairment / distress, ≥2 of 11 DSM-5 criteria in 12 months. Severity — mild (2-3), moderate (4-5), severe (≥6). Most undertreated SUD in US per primary source.",
            citationIDs: ["openrn_dx_round20", "specialty_dx_round20"]
        ),
        pathophysiology: AttributedProse(
            "Chronic ethanol → neuroadaptation in GABA + glutamate + dopamine systems → tolerance + dependence + reward dysregulation. Withdrawal from chronic use → CNS hyperexcitability (anxiety, tremor, seizures, delirium).",
            citationIDs: ["openrn_dx_round20"]
        ),
        presentation: [
            AttributedBullet("DSM-5 criteria — larger amounts than intended, can't cut down, time spent obtaining / using / recovering, craving, role failure, social problems despite use, activities given up, hazardous use, continued use despite problems, tolerance, withdrawal.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Withdrawal — tremor, anxiety, autonomic hyperactivity within 6-24 hours; seizures 6-48h; delirium tremens 48-96h (potentially fatal).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Co-occurring depression, anxiety, PTSD common — bidirectional.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Medical complications — cirrhosis, pancreatitis, cardiomyopathy, Wernicke-Korsakoff, cancers, malnutrition.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Screening — AUDIT-C ≥4 (men) / ≥3 (women) → further assessment.", citationIDs: ["specialty_dx_round20"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5 criteria + AUDIT-C screening + clinical interview per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Lab markers — elevated GGT, AST > ALT (2:1 ratio classic), MCV, CDT (carbohydrate-deficient transferrin); not diagnostic but supportive.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("PEth (phosphatidylethanol) — specific marker of recent heavy drinking.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Workup complications — LFTs, CBC, B12 / folate / thiamine, ECG, abdominal ultrasound.", citationIDs: ["openrn_dx_round20"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity + readiness for change (Stages of Change model).", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Withdrawal risk — last drink + prior withdrawal history (especially seizures / DTs).", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Suicide risk — high in AUD; ongoing assessment.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Co-occurring mental illness + medical comorbidities.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Pregnancy — fetal alcohol risk; care coordination.", citationIDs: ["specialty_dx_round20"])
        ],
        commonInterventions: [
            AttributedBullet("WITHDRAWAL MANAGEMENT — CIWA-Ar-guided benzodiazepines (lorazepam or diazepam); thiamine BEFORE glucose to prevent Wernicke; folate, multivitamin.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("MEDICATION-ASSISTED TREATMENT (MAT) — naltrexone (oral or Vivitrol IM) OR acamprosate OR disulfiram per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("NALTREXONE first-line — reduces cravings + heavy drinking days; oral 50 mg daily OR Vivitrol 380 mg IM monthly.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("ACAMPROSATE alternative — supports abstinence maintenance; 666 mg PO TID.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("DISULFIRAM — for motivated, abstinence-committed patients; informed consent essential.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("BEHAVIORAL — CBT, motivational interviewing, AA / SMART Recovery, group therapy.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Comprehensive — address comorbid mental health, medical comorbidities, social determinants.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("SBIRT in primary care — Screening, Brief Intervention, Referral to Treatment.", citationIDs: ["specialty_dx_round20"])
        ],
        watchFor: [
            AttributedBullet("DELIRIUM TREMENS — autonomic instability + confusion + hallucinations; ICU-level care; high mortality untreated.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("WERNICKE-KORSAKOFF — thiamine BEFORE glucose in malnourished alcoholics; classic triad ophthalmoplegia + ataxia + confusion.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("SUICIDE risk — particularly during acute withdrawal + early recovery.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("HEPATIC + PANCREATITIS complications — coordinate hepatology + GI.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("ALCOHOL + BENZODIAZEPINE / OPIOID combination — high overdose risk.", citationIDs: ["specialty_dx_round20"])
        ],
        citations: [openrnDxR20, cdcDxR20, specialtyDxR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum TobaccoUseDisorderSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "tobacco-use-disorder",
        title: "Tobacco use disorder",
        subtitle: "Most preventable cause of death · combo behavioral + pharmacotherapy doubles quit · 5As / 5Rs",
        nclexTags: psychR20,
        definition: AttributedProse(
            "Problematic pattern of nicotine / tobacco use causing clinically significant impairment + ≥2 DSM-5 criteria over 12 months. Leading preventable cause of death — smoking accounts for ~480,000 US deaths/year per primary source.",
            citationIDs: ["openrn_dx_round20", "cdc_dx_round20"]
        ),
        pathophysiology: AttributedProse(
            "Nicotine binds nicotinic ACh receptors → dopamine release in nucleus accumbens → reinforcement / addiction. Chronic use → upregulation of receptors → tolerance + withdrawal upon cessation.",
            citationIDs: ["openrn_dx_round20"]
        ),
        presentation: [
            AttributedBullet("Cigarette smoking — most common; cigars, smokeless, e-cigarettes/vape also captured.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Withdrawal — irritability, anxiety, restlessness, increased appetite, depressed mood, difficulty concentrating, insomnia; peaks ~3 days, lasts 2-4 weeks.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Smoking-related medical disease — COPD, CAD, multiple cancers, stroke, peripheral vascular, infertility, periodontal.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Comorbid mental illness — depression, anxiety, schizophrenia much more common in smokers.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("E-cigarette / vape (EVALI) — lung injury from THC + vitamin E acetate cartridges.", citationIDs: ["cdc_dx_round20"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5 — ≥2 of 11 criteria over 12 months (tolerance, withdrawal, larger / longer use, can't cut down, time / craving / role failure / social / activities / hazardous / continued despite harm).", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Pack-year history — packs/day × years; quantifies exposure for cancer / COPD risk stratification.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Fagerström Test for Nicotine Dependence — quantifies severity.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Cotinine — biomarker of recent nicotine exposure.", citationIDs: ["openrn_dx_round20"])
        ],
        priorityAssessments: [
            AttributedBullet("Readiness to quit (Stages of Change); commitment + barriers.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("Co-occurring mental illness — bidirectional; smoking + depression / anxiety / schizophrenia.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("Smoking-related disease screening — CT chest for lung cancer (USPSTF criteria), spirometry, CV evaluation.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("Family smoke exposure — secondhand smoke harms children + spouses.", citationIDs: ["openrn_dx_round20"])
        ],
        commonInterventions: [
            AttributedBullet("5 A's — ASK (every visit), ADVISE (clear personal recommendation), ASSESS (readiness), ASSIST (medication + counseling), ARRANGE (follow-up).", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("5 R's for ambivalent — Relevance, Risks, Rewards, Roadblocks, Repetition.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("COMBINATION PHARMACOTHERAPY + BEHAVIORAL doubles quit rate vs either alone.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("VARENICLINE — most effective monotherapy; partial nicotinic agonist; 12-week course per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("NICOTINE REPLACEMENT — patch + gum / lozenge combination; long-acting + short-acting per primary source.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("BUPROPION — alternative; useful when depression comorbid; lowers seizure threshold.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("BEHAVIORAL — telephone quitline (1-800-QUIT-NOW), text programs, smartphone apps, individual / group counseling, brief intervention.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("LUNG CANCER SCREENING — annual low-dose CT for age 50-80 + 20 pack-year + currently smoke or quit ≤15 years per USPSTF per primary source.", citationIDs: ["cdc_dx_round20"]),
            AttributedBullet("E-cigarettes — controversial; FDA does not approve as cessation aid; safer than combustibles but not safe + youth uptake concerning.", citationIDs: ["cdc_dx_round20"])
        ],
        watchFor: [
            AttributedBullet("RELAPSE common — average 7-9 quit attempts to permanent cessation; treat as expected, not failure.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("CARDIOVASCULAR EVENT in first year post-quit — paradoxical small spike in some studies; aggressive CV care.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("WEIGHT GAIN ~5-10 lbs average after quitting — counsel + plan; do NOT let it derail.", citationIDs: ["openrn_dx_round20"]),
            AttributedBullet("MENTAL HEALTH worsening (rare) on varenicline — monitor mood + suicidality.", citationIDs: ["specialty_dx_round20"]),
            AttributedBullet("EVALI from e-cigarettes — vitamin E acetate; supportive care + steroids in selected.", citationIDs: ["cdc_dx_round20"])
        ],
        citations: [openrnDxR20, cdcDxR20, specialtyDxR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}
