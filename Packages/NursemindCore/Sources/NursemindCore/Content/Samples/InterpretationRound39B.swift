import Foundation

// Curator-model references (round 39 part B — drug class reference sheets).

private let openrnLI39B = CitationSource(
    id: "openrn_li39b",
    shortName: "Open RN Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-05-13"
)
private let cdcLI39B = CitationSource(
    id: "cdc_li39b",
    shortName: "CDC + NIH + AHRQ concept citations",
    publisher: "CDC · NIH · AHRQ",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyLI39B = CitationSource(
    id: "specialty_li39b",
    shortName: "IDSA + ADA + AACE + AHA/ACC + ASH fact citations",
    publisher: "IDSA · ADA · AACE · AHA/ACC · ASH",
    license: .factCitationOnly,
    url: "https://www.idsociety.org/",
    lastRetrieved: "2026-05-13"
)

private let drugRefTagsR39B = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .pharmacologicalAndParenteralTherapies,
    priorityConcept: .safety
)

public enum AntibioticSpectrumSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "antibiotic-spectrum-reference",
        title: "Antibiotic spectrum reference",
        subtitle: "Class-by-class coverage chart · gram positive + negative + anaerobes + atypical · MRSA + Pseudomonas + ESBL + carbapenemase coverage · empiric vs targeted",
        eyebrow: "REFERENCE · DRUG CLASS",
        nclexTags: drugRefTagsR39B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Antibiotic selection requires understanding spectrum of activity, pharmacokinetics, mechanism of action, resistance patterns, and patient-specific factors. Empiric therapy targets likely pathogens until cultures available; de-escalation to narrow spectrum reduces resistance + adverse effects. Local antibiogram + institutional protocols guide selection. Antibiotic stewardship principles minimize unnecessary use per primary source.",
                citationIDs: ["specialty_li39b"]
            )),
            .keyValueTable(title: "BETA-LACTAMS — penicillins", [
                KeyValueRow(key: "Natural penicillins (Pen V, Pen G)", value: "GAS, syphilis, oral anaerobes (above diaphragm); narrow spectrum"),
                KeyValueRow(key: "Aminopenicillins (amoxicillin, ampicillin)", value: "Above + Listeria + enterococci + some gram-negatives (E. coli, H. flu); good for ENT, UTI, oral"),
                KeyValueRow(key: "Antistaph penicillins (oxacillin, nafcillin, dicloxacillin)", value: "MSSA (methicillin-susceptible Staph aureus), strep; NO MRSA + NO enterococci + NO gram-negatives"),
                KeyValueRow(key: "Piperacillin-tazobactam (Zosyn)", value: "Broad-spectrum — gram pos (no MRSA), gram neg INCLUDING PSEUDOMONAS, anaerobes; widely used empiric for sepsis + intra-abdominal + healthcare-associated"),
                KeyValueRow(key: "Ampicillin-sulbactam (Unasyn)", value: "Like aminopenicillin + beta-lactamase inhibitor; covers most gram-pos + gram-neg + anaerobes; NO Pseudomonas; common for animal/human bites + intra-abdominal"),
                KeyValueRow(key: "Amoxicillin-clavulanate (Augmentin)", value: "Oral version; same coverage; common for sinusitis, otitis, UTI, animal/human bites")
            ]),
            .keyValueTable(title: "BETA-LACTAMS — cephalosporins", [
                KeyValueRow(key: "1st generation (cefazolin, cephalexin)", value: "MSSA + strep + some gram-neg (E. coli, Klebsiella, Proteus); SSI prophylaxis (cefazolin), uncomplicated cellulitis + cystitis"),
                KeyValueRow(key: "2nd generation (cefuroxime, cefoxitin, cefotetan)", value: "Above + improved gram-neg + cefoxitin/cefotetan have ANAEROBIC coverage; gynecologic surgery, intra-abdominal"),
                KeyValueRow(key: "3rd generation (ceftriaxone, cefotaxime, ceftazidime)", value: "Broad gram-neg INCLUDING H. flu, Neisseria; ceftazidime adds PSEUDOMONAS; ceftriaxone — community pneumonia, meningitis, gonorrhea, pyelonephritis; LIMITED gram-pos vs 1st gen"),
                KeyValueRow(key: "4th generation (cefepime)", value: "Broader — gram-pos AND gram-neg INCLUDING PSEUDOMONAS; healthcare-associated infections, neutropenic fever, severe sepsis"),
                KeyValueRow(key: "5th generation (ceftaroline)", value: "Anti-MRSA — only beta-lactam with MRSA activity; community + healthcare MRSA; complicated SSTI + CAP"),
                KeyValueRow(key: "Ceftolozane-tazobactam, ceftazidime-avibactam", value: "Newer; multidrug-resistant Pseudomonas + ESBLs + some carbapenemase producers; reserve antibiotics")
            ]),
            .keyValueTable(title: "BETA-LACTAMS — carbapenems + monobactam", [
                KeyValueRow(key: "Meropenem, imipenem, ertapenem, doripenem", value: "Broad-spectrum — gram-pos + gram-neg + anaerobes + ESBL producers + Pseudomonas (NOT ertapenem); SEVERE infections, multidrug-resistant + neutropenic + ESBL; meropenem preferred for CNS"),
                KeyValueRow(key: "Aztreonam (monobactam)", value: "Gram-NEG ONLY (including Pseudomonas); SAFE for severe penicillin/cephalosporin allergy (no cross-reactivity)")
            ]),
            .keyValueTable(title: "FLUOROQUINOLONES", [
                KeyValueRow(key: "Ciprofloxacin", value: "Gram-neg (E. coli, Pseudomonas, Salmonella); LIMITED gram-pos; UTI, GI, gonorrhea (resistant in some areas), Pseudomonas; oral bioavailability excellent"),
                KeyValueRow(key: "Levofloxacin, moxifloxacin", value: "\"Respiratory fluoroquinolones\" — gram-neg + atypicals (Mycoplasma, Chlamydia, Legionella) + Streptococcus pneumoniae; CAP, complicated SSTI, intra-abdominal (with metronidazole), TB (selected); moxifloxacin has anaerobic coverage"),
                KeyValueRow(key: "BBW", value: "Tendinopathy/tendon rupture, peripheral neuropathy, CNS effects, QT prolongation, hypoglycemia, aortic aneurysm; AVOID in pediatric (cartilage damage), pregnancy, frail elderly when alternatives available")
            ]),
            .keyValueTable(title: "MACROLIDES", [
                KeyValueRow(key: "Azithromycin, clarithromycin, erythromycin", value: "Gram-pos + atypicals (Mycoplasma, Chlamydia, Legionella); ERTHROMYCIN narrow + GI side effects; AZITHROMYCIN — convenient daily × 5 days, drug-interactions less than erythro/clarithro"),
                KeyValueRow(key: "Use", value: "CAP, sinusitis, pharyngitis (penicillin allergy), pertussis, chlamydia, gonorrhea (resistance increasing — combination with ceftriaxone)"),
                KeyValueRow(key: "QT prolongation", value: "Caution with other QT-prolonging drugs; cardiac history; check ECG")
            ]),
            .keyValueTable(title: "TETRACYCLINES + GLYCYLCYCLINES", [
                KeyValueRow(key: "Doxycycline (most used)", value: "Atypicals (Chlamydia, Mycoplasma, Rickettsia — RMSF empirically), Lyme, gonorrhea (with ceftriaxone), CAP, complicated SSTI, MRSA (some), VRE; PNA in PNCR or fluoroquinolone allergy"),
                KeyValueRow(key: "Minocycline", value: "Similar to doxycycline; CNS penetration; vestibular toxicity"),
                KeyValueRow(key: "Tigecycline (glycylcycline)", value: "Broad-spectrum INCLUDING MRSA, VRE, ESBL; complicated SSTI + intra-abdominal; BBW for increased mortality"),
                KeyValueRow(key: "Avoid", value: "Pregnancy + children <8 (tooth discoloration, decreased bone growth); take with food (food OK, dairy + iron + calcium decrease absorption)")
            ]),
            .keyValueTable(title: "ANTI-MRSA AGENTS", [
                KeyValueRow(key: "Vancomycin (IV)", value: "MRSA gold standard; gram-pos including VRE-susceptible enterococci; nephrotoxicity + ototoxicity + red man syndrome"),
                KeyValueRow(key: "Linezolid", value: "MRSA + VRE; MAOI activity (avoid SSRIs/serotonergic — serotonin syndrome); thrombocytopenia + lactic acidosis"),
                KeyValueRow(key: "Daptomycin", value: "MRSA + VRE; AVOID in pneumonia (inactivated by surfactant); rhabdomyolysis (CK monitoring)"),
                KeyValueRow(key: "Tedizolid", value: "Similar to linezolid + simpler dosing"),
                KeyValueRow(key: "Ceftaroline", value: "Beta-lactam with MRSA activity"),
                KeyValueRow(key: "Anti-MRSA oral", value: "TMP-SMX (also some MSSA + Pseudomonas), doxycycline, clindamycin, linezolid; resistance variable")
            ]),
            .keyValueTable(title: "ANTI-PSEUDOMONAL", [
                KeyValueRow(key: "Beta-lactams", value: "Piperacillin-tazobactam, ceftazidime, cefepime, meropenem, imipenem, doripenem, ceftolozane-tazobactam"),
                KeyValueRow(key: "Aminoglycosides", value: "Tobramycin, gentamicin, amikacin (synergistic with beta-lactam)"),
                KeyValueRow(key: "Fluoroquinolones", value: "Ciprofloxacin, levofloxacin"),
                KeyValueRow(key: "Polymyxins", value: "Colistin (polymyxin E), polymyxin B; reserve for multidrug-resistant; nephrotoxicity"),
                KeyValueRow(key: "Aztreonam", value: "Severe penicillin allergy + need Pseudomonas coverage")
            ]),
            .keyValueTable(title: "ANAEROBIC coverage (intra-abdominal)", [
                KeyValueRow(key: "Metronidazole", value: "Anaerobes + protozoa (Trichomonas, Giardia, Entamoeba); intra-abdominal + C. diff (oral); disulfiram reaction with alcohol"),
                KeyValueRow(key: "Clindamycin", value: "Anaerobes (above + below diaphragm) + gram-pos including MRSA (community); C. diff risk"),
                KeyValueRow(key: "Beta-lactams with anaerobic activity", value: "Pip-tazo, ampicillin-sulbactam, amoxicillin-clavulanate, cefoxitin/cefotetan (2nd gen ceph), carbapenems"),
                KeyValueRow(key: "Combination", value: "For intra-abdominal — beta-lactam ± metronidazole; carbapenem alone")
            ]),
            .keyValueTable(title: "OTHER classes", [
                KeyValueRow(key: "Aminoglycosides (gentamicin, tobramycin, amikacin)", value: "Gram-neg INCLUDING Pseudomonas; synergy with beta-lactam for serious gram-pos (endocarditis); NEPHRO + OTOTOXICITY (often permanent); single-daily dosing reduces toxicity"),
                KeyValueRow(key: "TMP-SMX (Bactrim)", value: "Broad-spectrum — gram-pos including community MRSA, gram-neg including Stenotrophomonas, atypicals (Pneumocystis jirovecii — both treatment + prophylaxis)"),
                KeyValueRow(key: "Fidaxomicin (oral, narrow GI)", value: "C. difficile (preferred over vancomycin per IDSA 2021); minimal systemic absorption; expensive"),
                KeyValueRow(key: "Vancomycin (oral)", value: "C. difficile (alternative to fidaxomicin); not absorbed systemically"),
                KeyValueRow(key: "Nitrofurantoin (Macrobid)", value: "Uncomplicated UTI — concentrated in urine; AVOID with CrCl <30 (inadequate urinary concentration); pulmonary fibrosis (long-term)"),
                KeyValueRow(key: "Fosfomycin", value: "Single-dose oral for uncomplicated UTI in females; alternative for resistant E. coli")
            ]),
            .bullets(title: "Empiric therapy by indication", [
                AttributedBullet("CAP outpatient — amoxicillin OR doxycycline OR macrolide; if comorbidities or recent antibiotics — fluoroquinolone OR beta-lactam + macrolide.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("CAP inpatient — beta-lactam (ceftriaxone) + macrolide OR fluoroquinolone monotherapy; ICU — anti-Pseudomonal if risk factors.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("HAP/VAP — anti-Pseudomonal + anti-MRSA (pip-tazo OR cefepime + vancomycin OR linezolid).", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Sepsis empiric — broad-spectrum within 60 min; pip-tazo OR carbapenem + vancomycin if MRSA/line risk; tailor to source + culture.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Cellulitis — cephalexin OR clindamycin (PCN allergy); add MRSA coverage if abscess or risk factors (TMP-SMX, clindamycin, doxycycline).", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Uncomplicated UTI — nitrofurantoin × 5 days OR TMP-SMX × 3 days OR fosfomycin single dose; fluoroquinolone reserved for complicated/pyelonephritis.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Pyelonephritis — ceftriaxone IV → oral fluoroquinolone OR TMP-SMX 7-14 days.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Meningitis empiric — vancomycin + ceftriaxone (+ ampicillin if >50 yr or immunocompromised — Listeria); + dexamethasone (15 min before/with first antibiotic dose).", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Intra-abdominal — pip-tazo OR ceftriaxone + metronidazole OR carbapenem; surgical source control essential.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Neutropenic fever — ANTIBIOTIC WITHIN 60 MIN; cefepime OR pip-tazo OR meropenem; add vancomycin if MRSA risk; antifungals if persistent.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("C. difficile — fidaxomicin × 10 days (preferred per IDSA 2021); vancomycin oral × 10 days alternative; bezlotoxumab IV for recurrence prevention.", citationIDs: ["specialty_li39b"])
            ])
        ],
        citations: [openrnLI39B, cdcLI39B, specialtyLI39B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum InsulinRegimensSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "insulin-regimens-reference",
        title: "Insulin regimens reference",
        subtitle: "Basal-bolus + sliding scale + premix · onset/peak/duration · concentrations (U100, U500, U200, U300) · transitioning · weight-based dosing",
        eyebrow: "REFERENCE · DRUG CLASS",
        nclexTags: drugRefTagsR39B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Insulin regimens — replace endogenous insulin in T1DM (essential, lifelong) + supplement in T2DM (when oral inadequate). Basal-bolus regimen is physiologic standard — long-acting basal + rapid-acting bolus with meals. Sliding scale insulin (SSI) is non-physiologic + reactive (treats hyperglycemia after the fact); used cautiously + transitioned to basal-bolus for hospitalized patients. Multiple insulin types + concentrations require careful prescribing + monitoring per primary source.",
                citationIDs: ["specialty_li39b"]
            )),
            .keyValueTable(title: "Insulin types — onset/peak/duration", [
                KeyValueRow(key: "RAPID-ACTING (bolus, mealtime)", value: "Lispro (Humalog), Aspart (Novolog), Glulisine (Apidra) — onset 5-15 min, peak 30-90 min, duration 3-5 hr; FIASP (faster aspart) onset <5 min"),
                KeyValueRow(key: "SHORT-ACTING (regular insulin — Humulin R, Novolin R)", value: "Onset 30-60 min, peak 2-4 hr, duration 5-8 hr; classic IV insulin (DKA), some IM use; no longer commonly used SC for meals"),
                KeyValueRow(key: "INTERMEDIATE (NPH — Humulin N, Novolin N)", value: "Onset 1-2 hr, peak 4-12 hr, duration 12-18 hr; cloudy (suspension); historically used for basal but unpredictable peaks; 1-2x/day OR mixed with regular"),
                KeyValueRow(key: "LONG-ACTING (basal)", value: "Glargine (Lantus, Basaglar) — onset 1-2 hr, no significant peak, duration ~24 hr (some need BID). Detemir (Levemir) — duration 12-24 hr (often needs BID). Glargine U-300 (Toujeo) — duration 30+ hr, less hypoglycemia. Degludec (Tresiba) — duration 42+ hr, very stable, U100 + U200 concentrations"),
                KeyValueRow(key: "PREMIX (mixed before injection)", value: "70/30 (70% NPH + 30% regular OR 70% protaminated insulin + 30% rapid), 75/25, 50/50; convenience but less flexibility than basal-bolus")
            ]),
            .keyValueTable(title: "Concentrations + administration", [
                KeyValueRow(key: "U100", value: "Standard concentration; 100 units/mL; most insulins"),
                KeyValueRow(key: "U200 (insulin lispro 200, degludec 200)", value: "200 units/mL; smaller injection volume; SAME number of units as U100 (insulin pen counts units, not volume)"),
                KeyValueRow(key: "U300 (Toujeo glargine)", value: "300 units/mL; smaller volume; pen counts units"),
                KeyValueRow(key: "U500 (Humulin R U500)", value: "500 units/mL; SEVERELY INSULIN-RESISTANT patients (typically T2DM with daily requirements >200 units); high-alert + LASA — prescribe in UNITS not mL; specific U500 syringes available"),
                KeyValueRow(key: "Pen vs vial/syringe", value: "Pens easier + reduce errors; some patients prefer vial/syringe (cost, comfort); both safe with proper technique")
            ]),
            .keyValueTable(title: "Basal-bolus regimen (physiologic standard)", [
                KeyValueRow(key: "Total daily dose (TDD)", value: "T1DM: 0.4-1.0 units/kg/day starting; T2DM transitioning to insulin: 0.1-0.2 units/kg/day starting; adjust based on response"),
                KeyValueRow(key: "Basal (50% of TDD)", value: "Long-acting once daily (typically PM) OR BID (detemir, glargine sometimes); covers fasting + between-meal needs; titrate based on fasting glucose"),
                KeyValueRow(key: "Bolus (50% of TDD divided across meals)", value: "Rapid-acting before each meal; covers carbohydrate + corrects pre-meal hyperglycemia; can be fixed dose OR carbohydrate-counting (insulin-to-carb ratio + correction factor)"),
                KeyValueRow(key: "Insulin-to-carb ratio (ICR)", value: "1 unit per 10-20 g carbs; calculate by 500 ÷ TDD = grams carbs covered by 1 unit (rule of 500); individualized + adjusted"),
                KeyValueRow(key: "Correction factor (CF) / Insulin sensitivity factor (ISF)", value: "Drop in BG per unit of insulin; calculate by 1800 ÷ TDD (rule of 1800) for rapid-acting OR 1500 ÷ TDD (rule of 1500) for regular insulin"),
                KeyValueRow(key: "Pre-meal correction", value: "Correction = (current BG − target BG) ÷ CF; add to meal dose")
            ]),
            .keyValueTable(title: "Hospital insulin (inpatient)", [
                KeyValueRow(key: "Basal-bolus preferred (even short hospital stay)", value: "Better glycemic control + safer than SSI; 0.5 units/kg/day TDD typical (less if elderly, kidney disease); 50% basal + 50% bolus split"),
                KeyValueRow(key: "Sliding scale insulin (SSI)", value: "Reactive (treats hyperglycemia after the fact); leads to glucose roller-coaster + hypoglycemia + persistent hyperglycemia; AVOID as monotherapy except mild stress hyperglycemia + short-term"),
                KeyValueRow(key: "DKA insulin", value: "REGULAR INSULIN IV bolus 0.1 units/kg + continuous infusion 0.1 units/kg/hr; titrate by hourly glucose; transition to SC after gap closes + tolerating PO; start basal-bolus 1-2 hours before stopping IV"),
                KeyValueRow(key: "TPN/enteral nutrition", value: "70-80% of expected basal needs as basal insulin; bolus for transitions; if continuous tube feed — basal coverage continuous"),
                KeyValueRow(key: "NPO patient", value: "BASAL only (50% of TDD); HOLD bolus; resume bolus when eating")
            ]),
            .keyValueTable(title: "Common ERRORS + safety", [
                KeyValueRow(key: "LASA — insulin types", value: "Humalog vs Humulin (lispro vs regular vs NPH); Lantus vs Toujeo (different concentrations of glargine); names + colors + manufacturers vary"),
                KeyValueRow(key: "U500 errors", value: "Catastrophic — give in UNITS using U500 syringe OR pen; NEVER use U100 syringe with U500 vial without converting carefully"),
                KeyValueRow(key: "Mixed insulins", value: "Clear before cloudy (regular before NPH); never mix glargine OR detemir with other insulins (changes pH + activity)"),
                KeyValueRow(key: "Site rotation", value: "Same site causes lipohypertrophy → erratic absorption; rotate within abdomen, thigh, upper arm, buttock; avoid muscle (faster absorption)"),
                KeyValueRow(key: "Storage", value: "Unopened — refrigerated (36-46°F); opened pen/vial — room temperature 28 days (most), some 14 days; AVOID freezing + extreme heat"),
                KeyValueRow(key: "Administration timing", value: "Rapid-acting — within 10-15 min of starting meal; long-acting — same time daily (consistency); short-acting (regular) — 30 min before meal")
            ]),
            .keyValueTable(title: "Hypoglycemia recognition + treatment", [
                KeyValueRow(key: "Definition", value: "BG <70 mg/dL; severe = <54 OR symptoms"),
                KeyValueRow(key: "Symptoms", value: "Adrenergic — tremor, palpitations, sweating, anxiety; neuroglycopenic — confusion, lethargy, slurred speech, blurred vision, seizure, coma"),
                KeyValueRow(key: "Conscious + alert", value: "Rule of 15 — 15g fast carb (4 oz juice, 4 glucose tabs, 1 tbsp honey, 1 cup milk) → recheck in 15 min → repeat if still low; follow with longer-acting carb if next meal >1 hr away"),
                KeyValueRow(key: "Unconscious / cannot swallow", value: "GLUCAGON 1 mg IM/SC/IN (Baqsimi nasal); D50W 25g IV push if IV access; monitor for recurrence"),
                KeyValueRow(key: "Hypoglycemia unawareness", value: "Long-standing diabetes; loss of warning symptoms; CGM strongly indicated; relax glycemic targets temporarily; reduce TDD; structured education"),
                KeyValueRow(key: "Persistent severe", value: "Continuous IV dextrose (D10W) infusion; glucagon repeat as needed; address cause (sulfonylurea, insulin overdose, alcohol, sepsis, adrenal/pituitary insufficiency)")
            ]),
            .bullets(title: "Special situations", [
                AttributedBullet("Pregnancy (gestational + Type 1 + Type 2 conception) — INSULIN preferred over oral antidiabetic agents; tighter glycemic targets; basal-bolus typical.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Steroids — significant hyperglycemia + insulin resistance; increase basal + bolus dose; consider continuous IV insulin during high-dose steroid; reduce as steroid tapers.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Renal failure (CKD) — REDUCE insulin requirements (impaired clearance); monitor closely; risk of hypoglycemia.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Sick day rules — DO NOT STOP insulin (risk DKA); continue basal; adjust bolus per blood sugar; check ketones if T1DM; hydrate; call provider if vomiting persists.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Insulin pump — continuous SC delivery; basal rate + bolus on demand; closed-loop systems with CGM (hybrid + fully automated); requires comprehensive education.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("CGM (continuous glucose monitor) — paradigm change; trends + arrows + time-in-range (TIR >70% goal); reduces hypoglycemia + A1C.", citationIDs: ["specialty_li39b"])
            ])
        ],
        citations: [openrnLI39B, cdcLI39B, specialtyLI39B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum OralDiabetesMedsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "oral-diabetes-medications-reference",
        title: "Oral diabetes medications + injectable non-insulin",
        subtitle: "Metformin first-line · GLP-1 + SGLT2 cardiovascular + renal benefit · DPP-4 + SU + TZD + meglitinide · ADA Standards of Care guidelines",
        eyebrow: "REFERENCE · DRUG CLASS",
        nclexTags: drugRefTagsR39B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Oral + injectable non-insulin diabetes medications — multiple classes targeting different pathophysiology in T2DM. Metformin remains first-line. GLP-1 receptor agonists + SGLT2 inhibitors have transformed practice with proven cardiovascular + renal benefits beyond glycemic control. ADA Standards of Care + AACE guidelines frame current treatment + complement risk-based therapy selection per primary source.",
                citationIDs: ["specialty_li39b"]
            )),
            .keyValueTable(title: "BIGUANIDE — Metformin (first-line)", [
                KeyValueRow(key: "Mechanism", value: "Decreases hepatic gluconeogenesis + improves insulin sensitivity"),
                KeyValueRow(key: "Dose", value: "500 mg PO BID-TID OR 1000 mg BID; max 2000-2500 mg/day; immediate-release vs extended-release (XR — better tolerance)"),
                KeyValueRow(key: "Benefits", value: "Effective A1C ↓ 1-2%, weight neutral or modest loss, no hypoglycemia (alone), low cost, evidence base"),
                KeyValueRow(key: "Side effects", value: "GI (diarrhea, nausea, metallic taste — most common; XR + take with food + start low); B12 deficiency (long-term); LACTIC ACIDOSIS rare but serious"),
                KeyValueRow(key: "Avoid", value: "eGFR <30 (lactic acidosis risk); HOLD with IV contrast OR planned surgery + reassess in 48 hours; severe hepatic disease; alcoholism")
            ]),
            .keyValueTable(title: "GLP-1 RECEPTOR AGONISTS (semaglutide, liraglutide, dulaglutide, exenatide, tirzepatide GIP/GLP-1)", [
                KeyValueRow(key: "Mechanism", value: "Glucose-dependent insulin secretion + decreased glucagon + delayed gastric emptying + central appetite suppression"),
                KeyValueRow(key: "Dose forms", value: "Oral semaglutide (Rybelsus), SC weekly (Ozempic, Wegovy, Trulicity, Bydureon, Mounjaro), SC daily (Victoza, Saxenda); start low + titrate slow"),
                KeyValueRow(key: "Benefits", value: "Effective A1C ↓ 1-2%, SIGNIFICANT WEIGHT LOSS (5-15%+), CARDIOVASCULAR + RENAL benefits (in MACE trials — ASCVD, HF, CKD), no hypoglycemia (alone)"),
                KeyValueRow(key: "Side effects", value: "GI (nausea — MOST common, vomiting, diarrhea; titrate slowly); injection site reactions; pancreatitis (rare); medullary thyroid carcinoma (BBW based on rodent studies — avoid in family hx MTC, MEN2); diabetic retinopathy worsening with rapid A1C reduction; gastroparesis"),
                KeyValueRow(key: "Tirzepatide (Mounjaro/Zepbound)", value: "Dual GIP + GLP-1 agonist; greater weight loss (>20%) + A1C reduction than GLP-1 alone; same class effects + safety")
            ]),
            .keyValueTable(title: "SGLT2 INHIBITORS (canagliflozin, dapagliflozin, empagliflozin, ertugliflozin)", [
                KeyValueRow(key: "Mechanism", value: "Inhibits sodium-glucose co-transporter 2 in proximal tubule → glycosuria → glucose lowering + osmotic diuresis"),
                KeyValueRow(key: "Benefits", value: "Effective A1C ↓ 0.5-1%, weight loss (2-3 kg), modest BP reduction, no hypoglycemia (alone), CARDIOVASCULAR + RENAL + HEART FAILURE benefits in trials (regardless of diabetes — empa/dapa for HFrEF)"),
                KeyValueRow(key: "Indications expanding", value: "T2DM, ASCVD, CKD (eGFR ≥20-25), HFrEF + HFpEF (without diabetes); paradigm-changing"),
                KeyValueRow(key: "Side effects", value: "Genital mycotic infections (most common, more in women + uncircumcised men), UTI, dehydration + orthostatic hypotension, increased LDL (modest), euglycemic DKA (rare but emergency — symptoms + ketones with normal-low glucose; HOLD before surgery + during illness), Fournier gangrene (very rare); amputation risk (canagliflozin — class effect debated)"),
                KeyValueRow(key: "Avoid", value: "Type 1 diabetes (DKA risk), severe renal impairment (varies — empagliflozin OK to eGFR 20)")
            ]),
            .keyValueTable(title: "DPP-4 INHIBITORS (sitagliptin, saxagliptin, linagliptin, alogliptin)", [
                KeyValueRow(key: "Mechanism", value: "Inhibits DPP-4 enzyme → ↑ endogenous GLP-1 + GIP → improved insulin secretion"),
                KeyValueRow(key: "Benefits", value: "A1C ↓ 0.5-1%, weight neutral, no hypoglycemia (alone), well-tolerated, oral, daily dosing"),
                KeyValueRow(key: "Side effects", value: "Pancreatitis (rare), joint pain, bullous pemphigoid, heart failure (saxagliptin/alogliptin — increased HF risk)"),
                KeyValueRow(key: "Renal adjustment", value: "Most need dose reduction except linagliptin (hepatically metabolized)")
            ]),
            .keyValueTable(title: "SULFONYLUREAS (glipizide, glimepiride, glyburide)", [
                KeyValueRow(key: "Mechanism", value: "Stimulates pancreatic beta cell insulin secretion (glucose-INDEPENDENT)"),
                KeyValueRow(key: "Benefits", value: "Effective A1C ↓ 1-2%, low cost, oral, daily-BID"),
                KeyValueRow(key: "Side effects", value: "HYPOGLYCEMIA (most concerning — particularly elderly + kidney disease), weight gain (2-5 kg), beta cell exhaustion over time; cardiovascular safety questioned (especially older — glyburide should be avoided in elderly)"),
                KeyValueRow(key: "Avoid", value: "Glyburide in elderly (Beers criteria — long-acting, hypoglycemia); sulfa allergy (cross-reactivity rare but possible)")
            ]),
            .keyValueTable(title: "TZD — Thiazolidinediones (pioglitazone, rosiglitazone)", [
                KeyValueRow(key: "Mechanism", value: "Improves insulin sensitivity (PPAR-gamma agonist)"),
                KeyValueRow(key: "Benefits", value: "Effective A1C ↓ 1-2%, no hypoglycemia (alone), durable, modest CV protection"),
                KeyValueRow(key: "Side effects", value: "WEIGHT GAIN (5-10 kg), FLUID RETENTION + HEART FAILURE worsening (BBW), bone loss + fractures (women), bladder cancer (pioglitazone — debated), liver enzyme elevation (require monitoring)"),
                KeyValueRow(key: "Use", value: "Less common now due to safety profile; selected use")
            ]),
            .keyValueTable(title: "MEGLITINIDES (repaglinide, nateglinide)", [
                KeyValueRow(key: "Mechanism", value: "Like sulfonylurea — stimulates insulin secretion; shorter-acting (with meals)"),
                KeyValueRow(key: "Use", value: "Pre-meal dosing for postprandial hyperglycemia; some flexibility (skip meal → skip dose); limited use"),
                KeyValueRow(key: "Side effects", value: "Hypoglycemia (less than SU), weight gain")
            ]),
            .keyValueTable(title: "Other classes (less common)", [
                KeyValueRow(key: "Alpha-glucosidase inhibitors (acarbose, miglitol)", value: "Decreases postprandial carbohydrate absorption; flatulence + diarrhea limit; modest A1C ↓ 0.5%"),
                KeyValueRow(key: "Bile acid sequestrant (colesevelam)", value: "Modest A1C + LDL benefit; constipation; multiple drug interactions"),
                KeyValueRow(key: "Bromocriptine (dopamine agonist)", value: "Modest A1C; cardiovascular benefit; nausea limits"),
                KeyValueRow(key: "Pramlintide (amylin analog)", value: "SC injection at meals; for T1DM + selected T2DM with insulin; weight loss; nausea; hypoglycemia with insulin")
            ]),
            .bullets(title: "Treatment selection (ADA 2024)", [
                AttributedBullet("FIRST-LINE — Metformin (unless contraindicated); add lifestyle therapy (diet, exercise, weight loss).", citationIDs: ["specialty_li39b"]),
                AttributedBullet("ESTABLISHED ASCVD OR HIGH risk → GLP-1 RA OR SGLT2i with proven CV benefit (independent of A1C) — paradigm shift.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("HEART FAILURE (especially HFrEF) OR CKD → SGLT2i with proven benefit.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("OBESITY (BMI ≥30) → GLP-1 RA OR dual GIP/GLP-1 (tirzepatide) preferred for weight loss.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("HYPOGLYCEMIA risk concern → GLP-1, SGLT2i, DPP-4i, TZD, metformin (low intrinsic risk).", citationIDs: ["specialty_li39b"]),
                AttributedBullet("WEIGHT GAIN concern → GLP-1, SGLT2i, DPP-4i, metformin (weight neutral or loss).", citationIDs: ["specialty_li39b"]),
                AttributedBullet("COST concern → metformin, sulfonylurea, TZD (generic + cheap); GLP-1 + SGLT2i expensive.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("INSULIN INITIATION — when oral inadequate; basal then bolus; combination with non-insulin agents (continue metformin + SGLT2i + GLP-1; stop sulfonylurea + DPP-4i typically).", citationIDs: ["specialty_li39b"])
            ])
        ],
        citations: [openrnLI39B, cdcLI39B, specialtyLI39B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LipidLoweringSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "lipid-lowering-therapy-reference",
        title: "Lipid-lowering therapy reference",
        subtitle: "Statins (high vs moderate vs low intensity) + ezetimibe + PCSK9 + bempedoic acid + fibrates + omega-3 + niacin · ASCVD risk-driven · multimodal for residual risk",
        eyebrow: "REFERENCE · DRUG CLASS",
        nclexTags: drugRefTagsR39B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Lipid-lowering therapy aims to reduce ASCVD risk + cardiovascular events. Statins are foundational; ezetimibe + PCSK9 inhibitors + bempedoic acid + icosapent ethyl provide additive LDL reduction + cardiovascular benefit when statins inadequate or not tolerated. AHA/ACC 2018 + 2022 update guideline framework drives selection per primary source.",
                citationIDs: ["specialty_li39b"]
            )),
            .keyValueTable(title: "STATINS — first-line", [
                KeyValueRow(key: "HIGH-INTENSITY (>50% LDL ↓)", value: "Atorvastatin 40-80 mg, Rosuvastatin 20-40 mg"),
                KeyValueRow(key: "MODERATE-INTENSITY (30-50% LDL ↓)", value: "Atorvastatin 10-20 mg, Rosuvastatin 5-10 mg, Simvastatin 20-40 mg, Pravastatin 40-80 mg, Lovastatin 40 mg, Pitavastatin 1-4 mg, Fluvastatin XL 80 mg"),
                KeyValueRow(key: "LOW-INTENSITY (<30%)", value: "Simvastatin 10 mg, Pravastatin 10-20 mg, Lovastatin 20 mg; rare use"),
                KeyValueRow(key: "Mechanism", value: "HMG-CoA reductase inhibition → ↓ hepatic cholesterol synthesis → ↑ LDL receptor → ↓ serum LDL"),
                KeyValueRow(key: "Pleiotropic effects", value: "Anti-inflammatory, plaque stabilization, endothelial function — beyond LDL lowering"),
                KeyValueRow(key: "Side effects", value: "MYALGIA (5-10% — usually nocebo; rechallenge with same or lower dose or different statin); MYOPATHY (CK >10× ULN); RHABDOMYOLYSIS (rare); HEPATOTOXICITY (rare; baseline LFTs OK; routine monitoring NOT needed unless symptoms); new-onset diabetes (small absolute risk vs benefit); cognitive (mixed evidence + reversible)"),
                KeyValueRow(key: "Drug interactions", value: "Strong CYP3A4 inhibitors (azoles, macrolides, protease inhibitors, grapefruit) increase simvastatin/lovastatin levels (rhabdo risk); rosuvastatin not CYP3A4 metabolized; pitavastatin has fewest interactions"),
                KeyValueRow(key: "Statin intolerance", value: "Common but often false; rechallenge with: lower dose, different statin (rosuvastatin/atorvastatin alternate days, pitavastatin), every-other-day dosing; many tolerate with CoQ10 trial (mixed evidence)")
            ]),
            .keyValueTable(title: "EZETIMIBE", [
                KeyValueRow(key: "Mechanism", value: "Inhibits intestinal cholesterol absorption (NPC1L1 transporter)"),
                KeyValueRow(key: "Dose", value: "10 mg PO daily"),
                KeyValueRow(key: "Benefits", value: "ADDITIONAL 15-20% LDL reduction when added to statin; CV benefit (IMPROVE-IT trial in post-ACS); well-tolerated; safe combination with statins; cheap (generic)"),
                KeyValueRow(key: "Use", value: "ADD to statin if LDL not at goal; alternative if statin intolerant"),
                KeyValueRow(key: "Side effects", value: "Mild GI; rare hepatic, myalgia (less than statin)")
            ]),
            .keyValueTable(title: "PCSK9 INHIBITORS (evolocumab — Repatha; alirocumab — Praluent)", [
                KeyValueRow(key: "Mechanism", value: "Monoclonal antibody to PCSK9 → prevents LDL receptor degradation → ↑ LDL clearance"),
                KeyValueRow(key: "Dose", value: "Evolocumab 140 mg SC Q2 weeks OR 420 mg monthly; Alirocumab 75-150 mg SC Q2 weeks OR 300 mg monthly"),
                KeyValueRow(key: "Benefits", value: "ADDITIONAL 50-60% LDL reduction; CV benefit (FOURIER, ODYSSEY trials); rapid LDL lowering; well-tolerated"),
                KeyValueRow(key: "Use", value: "Established ASCVD with LDL >70 despite max statin + ezetimibe (very-high-risk LDL >55); HeFH/HoFH; statin intolerance"),
                KeyValueRow(key: "Side effects", value: "Injection site reactions; allergic reactions rare; influenza-like; minimal long-term concerns"),
                KeyValueRow(key: "Cost", value: "Expensive ($14,000+/year); insurance preauthorization typical")
            ]),
            .keyValueTable(title: "INCLISIRAN (siRNA — Leqvio)", [
                KeyValueRow(key: "Mechanism", value: "siRNA targeting PCSK9 mRNA → ↓ PCSK9 protein synthesis → ↑ LDL clearance"),
                KeyValueRow(key: "Dose", value: "284 mg SC; second dose 3 months; then Q6 months"),
                KeyValueRow(key: "Benefits", value: "Convenient Q6 month dosing; 50% LDL reduction"),
                KeyValueRow(key: "Use", value: "Established ASCVD or HeFH with LDL despite max statin + ezetimibe; alternative to PCSK9 mAbs"),
                KeyValueRow(key: "Side effects", value: "Injection site reactions; otherwise well-tolerated")
            ]),
            .keyValueTable(title: "BEMPEDOIC ACID (Nexletol; combination with ezetimibe — Nexlizet)", [
                KeyValueRow(key: "Mechanism", value: "ATP-citrate lyase inhibitor — upstream of HMG-CoA in cholesterol synthesis pathway; activated only in liver (not muscle — less myalgia)"),
                KeyValueRow(key: "Dose", value: "180 mg PO daily"),
                KeyValueRow(key: "Benefits", value: "20-30% LDL reduction; effective in statin-intolerant; CV benefit (CLEAR trial); oral"),
                KeyValueRow(key: "Use", value: "Statin intolerance + secondary prevention OR severe HeFH"),
                KeyValueRow(key: "Side effects", value: "Hyperuricemia + gout, tendon rupture (rare), renal effects")
            ]),
            .keyValueTable(title: "FIBRATES (gemfibrozil, fenofibrate)", [
                KeyValueRow(key: "Mechanism", value: "PPAR-alpha agonist — ↑ lipoprotein lipase → ↓ TG; modest HDL increase"),
                KeyValueRow(key: "Use", value: "SEVERE HYPERTRIGLYCERIDEMIA (TG ≥500) for pancreatitis prevention; mixed dyslipidemia (limited CV evidence)"),
                KeyValueRow(key: "Side effects", value: "GI, hepatotoxicity, gallstones (cholesterol gallstones), myopathy (especially with statin — gemfibrozil > fenofibrate); renal adjustment"),
                KeyValueRow(key: "Combination with statin", value: "FENOFIBRATE preferred (much lower rhabdomyolysis risk than gemfibrozil)")
            ]),
            .keyValueTable(title: "OMEGA-3 / Icosapent ethyl (Vascepa)", [
                KeyValueRow(key: "Mechanism", value: "EPA + DHA omega-3 fatty acids; ↓ TG production + lipolysis"),
                KeyValueRow(key: "Icosapent ethyl 2g BID", value: "REDUCE-IT trial — significant CV event reduction in patients with established ASCVD or DM + multiple risk factors + TG 135-499 despite statin; FDA approved for this indication"),
                KeyValueRow(key: "Other omega-3 (combined EPA + DHA)", value: "STRENGTH trial NEGATIVE (no CV benefit with combination); icosapent ethyl unique"),
                KeyValueRow(key: "Side effects", value: "Atrial fibrillation (small increased risk in REDUCE-IT), bleeding, GI, fishy aftertaste"),
                KeyValueRow(key: "OTC fish oil", value: "Variable EPA/DHA content; doses much lower than therapeutic; generally not recommended for CV prevention")
            ]),
            .keyValueTable(title: "NIACIN", [
                KeyValueRow(key: "Mechanism", value: "↓ VLDL + apoB; ↑ HDL; ↓ Lp(a)"),
                KeyValueRow(key: "Use", value: "Niacin LARGELY ABANDONED for CV prevention (HPS2-THRIVE + AIM-HIGH negative); selected for severe hypertriglyceridemia or refractory low HDL"),
                KeyValueRow(key: "Side effects", value: "Flushing (most common — pretreat with aspirin), pruritus, hepatotoxicity, hyperglycemia, hyperuricemia, GI"),
                KeyValueRow(key: "Forms", value: "Immediate-release (more flushing), extended-release (less flushing, more hepatotoxicity); start low + titrate slowly")
            ]),
            .keyValueTable(title: "BILE ACID SEQUESTRANTS (cholestyramine, colesevelam, colestipol)", [
                KeyValueRow(key: "Mechanism", value: "Bind bile acids in intestine → ↑ hepatic conversion of cholesterol → ↑ LDL receptor → modest LDL reduction"),
                KeyValueRow(key: "Use", value: "Adjunct in pediatric familial hypercholesterolemia, pruritus from cholestasis (cholestyramine), bile acid diarrhea; modest LDL effect; LIMITED current use"),
                KeyValueRow(key: "Side effects", value: "Constipation, GI upset, drug interactions (separate by 4 hours from many drugs); not absorbed (safe in pregnancy)")
            ]),
            .bullets(title: "Treatment escalation framework (ASCVD prevention)", [
                AttributedBullet("STATIN appropriate intensity (high-intensity for ASCVD/very-high-risk; moderate for primary prevention based on 10-yr ASCVD risk).", citationIDs: ["specialty_li39b"]),
                AttributedBullet("If LDL not at goal — ADD EZETIMIBE 10 mg daily; cheap + safe + 15-20% additional LDL reduction.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("If LDL still not at goal AND established ASCVD OR very-high-risk — ADD PCSK9 INHIBITOR (evolocumab or alirocumab) for additional 50-60% LDL reduction.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("If statin intolerance — try lower dose, different statin, every-other-day; if true intolerance — bempedoic acid + ezetimibe + PCSK9.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("If TG persistently elevated >135 despite statin + established ASCVD or DM with risk factors — ICOSAPENT ETHYL 2g BID.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("If TG ≥500 — FIBRATE (fenofibrate preferred over gemfibrozil if combined with statin) + low-fat diet + omega-3 to prevent pancreatitis.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Lifestyle therapy ALWAYS — Mediterranean diet, exercise, weight loss, smoking cessation, alcohol moderation; foundation of treatment.", citationIDs: ["specialty_li39b"])
            ])
        ],
        citations: [openrnLI39B, cdcLI39B, specialtyLI39B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AnticoagulationReversalRound39Sample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "anticoagulation-reversal-reference",
        title: "Anticoagulation reversal reference",
        subtitle: "Warfarin (vitamin K + 4F-PCC) · UFH (protamine) · LMWH (partial protamine) · DOACs (idarucizumab + andexanet + 4F-PCC) · risk-benefit + thrombosis vigilance",
        eyebrow: "REFERENCE · DRUG CLASS",
        nclexTags: drugRefTagsR39B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Anticoagulation reversal — required for life-threatening bleeding, severe bleeding, OR urgent surgical procedures. Approach varies by anticoagulant + severity + timing of last dose. Key principle — REVERSE THROMBOSIS RISK simultaneous with reversal; resume anticoagulation when bleeding controlled. Coordinate with hematology + surgery + risk management per primary source.",
                citationIDs: ["specialty_li39b"]
            )),
            .keyValueTable(title: "WARFARIN reversal", [
                KeyValueRow(key: "Mild bleeding (INR 4.5-10) — no reversal urgent", value: "Hold warfarin 1-2 doses; restart at lower dose when INR therapeutic; oral vitamin K 1-2.5 mg PO if very high INR (>10) but no bleeding"),
                KeyValueRow(key: "Significant bleeding (any INR)", value: "Vitamin K 5-10 mg IV slow over 30 min + 4F-PCC (Kcentra) — INR 2-<4: 25 units/kg; INR 4-6: 35 units/kg; INR >6: 50 units/kg; max 5000 units; max body weight 100 kg"),
                KeyValueRow(key: "FFP (fresh frozen plasma)", value: "ALTERNATIVE if 4F-PCC unavailable; 10-15 mL/kg; LARGER VOLUME + slower correction + longer infusion time + more delayed reversal — 4F-PCC preferred"),
                KeyValueRow(key: "Mechanism", value: "Vitamin K reactivates vitamin K-dependent factors (II, VII, IX, X) — but takes 6-12 hours; PCC + FFP provide IMMEDIATE replacement of factors"),
                KeyValueRow(key: "RAPID IV vitamin K", value: "Anaphylaxis risk — slow infusion over 30 minutes; oral or SC slower onset"),
                KeyValueRow(key: "Goal INR", value: "<1.5 typically; document with serial INR every 30 min after reversal until stable"),
                KeyValueRow(key: "Resume warfarin", value: "When bleeding controlled; coordinate with hematology + risk-benefit assessment")
            ]),
            .keyValueTable(title: "HEPARINS reversal", [
                KeyValueRow(key: "UNFRACTIONATED HEPARIN (UFH) — Protamine sulfate", value: "1 mg per 100 units heparin given within last 30-60 min; 0.5 mg per 100 units 30-120 min; 0.25 mg per 100 units >120 min; max single dose 50 mg; SLOW IV over 10+ min (hypotension + anaphylaxis)"),
                KeyValueRow(key: "LMWH (enoxaparin, dalteparin) — Partial reversal", value: "1 mg protamine per 1 mg enoxaparin within 8 hours; 0.5 mg per 1 mg if >8 hours; max 50 mg single dose; PARTIAL REVERSAL only (~60-75%) — protamine binds anti-IIa more than anti-Xa"),
                KeyValueRow(key: "Fondaparinux", value: "NO specific antidote; 4F-PCC or rFVIIa for severe bleeding; very long half-life"),
                KeyValueRow(key: "Argatroban / bivalirudin", value: "NO specific antidote; supportive care + dialysis (some bivalirudin clearance) + 4F-PCC + rFVIIa for severe; short half-lives"),
                KeyValueRow(key: "Cautions", value: "Protamine — anaphylaxis (fish allergy, prior NPH insulin), severe hypotension, paradoxical anticoagulant effect at high doses, reverse heparin-like effect")
            ]),
            .keyValueTable(title: "DOAC reversal — DABIGATRAN (Pradaxa)", [
                KeyValueRow(key: "First-line — IDARUCIZUMAB (Praxbind)", value: "5 g IV (2 × 2.5g vials) — restores hemostasis within minutes; binds dabigatran with 350× affinity vs thrombin; fully reverses anticoagulant effect"),
                KeyValueRow(key: "Alternative — Hemodialysis", value: "Dabigatran is dialyzable (~60% removal in 2-3 hours); used if idarucizumab unavailable"),
                KeyValueRow(key: "Adjunct — 4F-PCC", value: "If continued bleeding despite idarucizumab + supportive care; 50 units/kg"),
                KeyValueRow(key: "Considerations", value: "Recheck dilute thrombin time (DTT) or ecarin clotting time; idarucizumab is single-use, expensive; thrombosis risk in patients with mechanical valves or recent ACS")
            ]),
            .keyValueTable(title: "DOAC reversal — Factor Xa inhibitors (apixaban, rivaroxaban, edoxaban)", [
                KeyValueRow(key: "First-line for life-threatening bleeding — ANDEXANET ALFA (Andexxa)", value: "Apixaban ≤5 mg OR rivaroxaban ≤10 mg + ≥8 hours: low dose 400 mg bolus + 480 mg infusion over 120 min; HIGH DOSE if higher dose OR <8 hours: 800 mg bolus + 960 mg over 120 min; binds + sequesters Xa inhibitor"),
                KeyValueRow(key: "Cost barrier", value: "$24,000-50,000 per course; 4F-PCC widely used as alternative given cost + supply"),
                KeyValueRow(key: "Alternative — 4F-PCC (Kcentra) 50 units/kg", value: "Off-label but widely used; significant cost advantage; no specific FDA approval for DOAC reversal but clinical evidence supports"),
                KeyValueRow(key: "Considerations", value: "Recurrent anticoagulant effect 2+ hours post-andexanet — plasma DOAC reaccumulates; coordinate with hematology; thrombosis risk")
            ]),
            .keyValueTable(title: "ANTIPLATELET reversal", [
                KeyValueRow(key: "Aspirin / clopidogrel / prasugrel / ticagrelor", value: "PLATELET TRANSFUSION ONLY for life-threatening bleeding (typical 2 units adult — 1 apheresis pack); NO specific antidote; consider DDAVP (desmopressin) for some bleeds"),
                KeyValueRow(key: "Cangrelor (IV ticagrelor)", value: "Short half-life (3-5 min); reversal generally NOT needed — discontinuation alone")
            ]),
            .keyValueTable(title: "FIBRINOLYTIC reversal (alteplase, tenecteplase, etc.)", [
                KeyValueRow(key: "Cryoprecipitate (10 units)", value: "Replaces fibrinogen + clotting factors; for severe bleeding from fibrinolysis"),
                KeyValueRow(key: "Fresh frozen plasma + platelets", value: "Adjunctive for severe bleeding"),
                KeyValueRow(key: "Tranexamic acid", value: "Antifibrinolytic; consider for ICH after tPA for stroke; controversial")
            ]),
            .bullets(title: "Pre-procedure timing of anticoagulation hold", [
                AttributedBullet("Warfarin — hold 5 days before surgery; verify INR <1.5; consider bridging with LMWH/heparin if high thrombosis risk (mechanical valve, recent VTE).", citationIDs: ["specialty_li39b"]),
                AttributedBullet("UFH — hold 4-6 hours; verify aPTT normal.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("LMWH (prophylactic) — hold 12 hours; (therapeutic) — hold 24 hours; consider anti-Xa if uncertain.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("DOACs — varies by drug + renal function — apixaban/rivaroxaban 24-48 hours; dabigatran 24-72 hours (longer with renal impairment).", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Aspirin/clopidogrel — hold 5-7 days for elective surgery; continue for low-risk procedures (cataract, dental, dermatologic).", citationIDs: ["specialty_li39b"]),
                AttributedBullet("ASRA guidelines for neuraxial procedures (spinal, epidural) — strict timing essential to prevent spinal hematoma.", citationIDs: ["specialty_li39b"])
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Coordinate emergency reversal with provider + pharmacy + lab + blood bank.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Verify last anticoagulant dose + time + dose for DOAC reversal protocol selection.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Have reversal agents available — vitamin K + 4F-PCC + protamine + idarucizumab + andexanet + cryoprecipitate.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Monitor for thrombosis — coagulation cascade reactivation; signs of MI, stroke, DVT/PE; reverse only when bleeding life-threatening.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Resume anticoagulation when bleeding controlled — risk-benefit per indication; coordinate with hematology.", citationIDs: ["specialty_li39b"]),
                AttributedBullet("Document — anticoagulant + dose + last dose + time + reversal agent + dose + INR/aPTT response + complications + plan.", citationIDs: ["openrn_li39b"]),
                AttributedBullet("Patient education — anticoagulant adherence + bleeding precautions + when to seek help + follow-up + reversal availability + medical alert ID.", citationIDs: ["openrn_li39b"])
            ])
        ],
        citations: [openrnLI39B, cdcLI39B, specialtyLI39B],
        lastSourceFidelityReview: "2026-05-13"
    )
}
