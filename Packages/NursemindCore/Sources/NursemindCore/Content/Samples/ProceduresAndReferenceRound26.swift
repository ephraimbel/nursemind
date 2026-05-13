import Foundation

// Curator-model procedures + reference (round 26 — apheresis + IV iron + liver biopsy + reversal + transfusion + cirrhosis + autoimmune liver).

private let openrnPRR26 = CitationSource(
    id: "openrn_pr_round26",
    shortName: "Open RN Nursing Skills + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-13"
)
private let cdcPRR26 = CitationSource(
    id: "cdc_pr_round26",
    shortName: "CDC + AABB + ASFA + AASLD guidance",
    publisher: "CDC · AABB · ASFA · AASLD",
    license: .publicDomain,
    url: "https://www.aabb.org/standards-accreditation",
    lastRetrieved: "2026-05-13"
)
private let specialtyPRR26 = CitationSource(
    id: "specialty_pr_round26",
    shortName: "ASH + AABB + ASFA + AASLD + ISTH concept citations",
    publisher: "ASH · AABB · ASFA · AASLD · ISTH",
    license: .factCitationOnly,
    url: "https://www.hematology.org/education/clinicians/guidelines-and-quality-care",
    lastRetrieved: "2026-05-13"
)

private let procTagsR26 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .clottingHemostasis
)
private let refTagsR26 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .clottingHemostasis
)

public enum PlasmapheresisTPESample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "plasmapheresis-tpe",
        title: "Therapeutic plasma exchange (TPE / plasmapheresis)",
        subtitle: "Removes circulating autoantibodies / cryoglobulins / paraproteins · TTP / GBS / MG / aHUS · 1-1.5 plasma volume daily · central line · citrate toxicity",
        nclexTags: procTagsR26,
        indications: AttributedProse(
            "Therapeutic apheresis procedure — removes plasma containing pathogenic substances (autoantibodies, immune complexes, cryoglobulins, paraproteins) + replaces with donor plasma or albumin. ASFA category I-II indications include — TTP, severe acute Guillain-Barré, myasthenic crisis, anti-GBM disease (Goodpasture), severe lupus / cryoglobulinemic vasculitis, hyperviscosity syndrome (Waldenström), severe atypical HUS (pre-eculizumab), neuromyelitis optica, severe ABO-incompatible transplant per primary source.",
            citationIDs: ["specialty_pr_round26"]
        ),
        contraindications: AttributedProse(
            "Absolute — hemodynamic instability not amenable to support; severe coagulopathy (relative — can be exchanged); active uncontrolled bleeding; severe hypocalcemia from prior citrate exposure. Relative — pediatric small body weight requiring careful volume management.",
            citationIDs: ["specialty_pr_round26"]
        ),
        equipment: [
            AttributedBullet("Apheresis machine — centrifugal (Spectra Optia, COBE) OR membrane separation; specialty trained apheresis nurse / technician.", citationIDs: ["openrn_pr_round26"]),
            AttributedBullet("CENTRAL VENOUS ACCESS — large-bore double-lumen catheter (Vortex, Hemodialysis catheter, Tesio); IJ or femoral; sometimes peripheral arterial line.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Replacement fluid — FFP (TTP, severe coag), 5% albumin (most indications), saline.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Anticoagulant — citrate (most common; ACD-A or ACD-B) OR heparin.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Calcium replacement — IV calcium gluconate / chloride for citrate-induced hypocalcemia.", citationIDs: ["specialty_pr_round26"])
        ],
        preProcedure: [
            AttributedBullet("Verify indication + apheresis nephrology / hematology consultation.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Central access placement — sometimes femoral if urgent; tunneled catheter for chronic.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Baseline — CBC, coag, CMP, calcium, magnesium, fibrinogen; type + crossmatch if FFP replacement.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Replacement fluid — FFP if TTP; 5% albumin for most others; balance hemodynamics + coagulation.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Patient + family education — purpose, expected duration, sensations, complications.", citationIDs: ["specialty_pr_round26"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Calculate plasma volume", body: "Total blood volume × (1 - hematocrit) = plasma volume; typically exchange 1-1.5 plasma volumes (3-4 L for adult) per session.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 2, title: "Vascular access", body: "Central catheter or large peripheral access; arterial line + venous return.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 3, title: "Initiate apheresis", body: "Centrifugal device separates plasma from RBCs; plasma diverted to waste; replacement fluid administered; usually 2-4 hours per session.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 4, title: "Monitor during procedure", body: "Continuous BP + HR + ECG; calcium replacement for tetany / paresthesias (citrate chelation); fluid balance; bleeding from catheter site.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 5, title: "Replacement fluid choice", body: "FFP for TTP (replaces ADAMTS13); 5% ALBUMIN for most others (cheaper + safer; supplement coag factors if needed); SALINE limited use.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 6, title: "Anticoagulation", body: "CITRATE most common — binds calcium → anticoagulation; risk of citrate toxicity (hypocalcemia, alkalosis, hypomagnesemia); HEPARIN alternative — bleeding risk.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 7, title: "Frequency", body: "Daily initially for TTP × until platelet response; q1-3 days for other indications; tapering as clinical response.", citationIDs: ["specialty_pr_round26"])
        ],
        postProcedure: [
            AttributedBullet("VITAL SIGNS + central line site assessment q15 min × 2 hrs.", citationIDs: ["openrn_pr_round26"]),
            AttributedBullet("LABS post-exchange — CBC, calcium, magnesium, fibrinogen, BUN/Cr.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("FIBRINOGEN replacement — cryoprecipitate or FFP if <100 mg/dL (depleted by exchange).", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Document — volume exchanged, replacement fluid, anticoagulant, complications, response.", citationIDs: ["openrn_pr_round26"]),
            AttributedBullet("Schedule next session per protocol; daily for TTP until platelet response.", citationIDs: ["specialty_pr_round26"])
        ],
        documentation: [
            AttributedBullet("Plasma volume calculated + exchanged, replacement fluid + volume, anticoagulant, hemodynamics, calcium replacements, complications.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Pre + post labs; symptom response; patient tolerance.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Plan for next session + monitoring.", citationIDs: ["specialty_pr_round26"])
        ],
        watchFor: [
            AttributedBullet("CITRATE TOXICITY — hypocalcemia (paresthesias, tetany, prolonged QT, arrhythmias); IV calcium gluconate 1-2 g during procedure; common per primary source.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("METABOLIC ALKALOSIS — citrate metabolized to bicarbonate; usually mild.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("HYPOMAGNESEMIA — also chelated by citrate; supplement.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("HYPOTHERMIA — exchanged fluid cold; warm replacement fluid.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("ALLERGIC REACTIONS to FFP — pre-medication (diphenhydramine + steroid) for prior reactions; switch to albumin if severe.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("CATHETER COMPLICATIONS — bleeding, infection, thrombosis, pneumothorax (subclavian); central line care.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("HYPOTENSION — pre-procedure hydration; vasopressor if persistent.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("COAGULATION DEPLETION — fibrinogen, factor depletion; supplement; risk of bleeding in chronic exchanges.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("INFECTION — bloodstream, catheter-related; vigilant.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("LARGE-VOLUME shifts — fluid balance + hemodynamic monitoring essential.", citationIDs: ["specialty_pr_round26"])
        ],
        citations: [openrnPRR26, cdcPRR26, specialtyPRR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IronIVAdministrationSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "iron-iv-administration",
        title: "Intravenous iron administration",
        subtitle: "Test dose for some formulations · pre-medicate selected · hypersensitivity precautions · large vein · skin staining risk · observation × 30 min",
        nclexTags: procTagsR26,
        indications: AttributedProse(
            "Iron deficiency anemia when oral iron is inadequate / not tolerated / contraindicated — CKD on dialysis, CKD non-dialysis, chronic GI loss / malabsorption (IBD, post-bariatric), refractory oral iron intolerance, postpartum severe anemia per primary source.",
            citationIDs: ["specialty_pr_round26"]
        ),
        contraindications: AttributedProse(
            "Hypersensitivity to specific iron formulation; iron overload; non-iron deficiency anemia. Caution — multiple drug allergies (cross-reactivity), severe asthma, autoimmune disease (increased reactions), active infection (theoretical iron-related microbial nutrient).",
            citationIDs: ["specialty_pr_round26"]
        ),
        equipment: [
            AttributedBullet("Selected iron formulation — iron sucrose (Venofer), ferric carboxymaltose (Injectafer), iron isomaltoside (Monoferric), ferumoxytol (Feraheme), iron dextran (rarely used now).", citationIDs: ["openrn_pr_round26"]),
            AttributedBullet("Large-bore IV access — peripheral OK for short administration.", citationIDs: ["openrn_pr_round26"]),
            AttributedBullet("Pre-medications (selected high-risk) — diphenhydramine + corticosteroid + acetaminophen.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Anaphylaxis kit — epinephrine + corticosteroid + diphenhydramine + airway equipment readily available.", citationIDs: ["openrn_pr_round26"]),
            AttributedBullet("Documentation tools — pre + during + post observation; vital sign monitoring.", citationIDs: ["openrn_pr_round26"])
        ],
        preProcedure: [
            AttributedBullet("Verify iron deficiency — ferritin <30 (or <100 in inflammation), transferrin saturation <20%, microcytic anemia.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Confirm oral iron intolerance / inadequate response / contraindication.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("ALLERGY history — particularly previous iron reactions; cross-reactivity.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("CALCULATE total iron deficit — Ganzoni formula: deficit (mg) = weight × (target Hb − current Hb) × 2.4 + 500 mg storage.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Choose formulation based on — patient tolerability, desired dosing schedule (single high-dose vs multiple smaller), cost, comorbidities.", citationIDs: ["specialty_pr_round26"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Choose formulation + dose", body: "IRON SUCROSE (Venofer) — 100-200 mg × 5-10 sessions; FERRIC CARBOXYMALTOSE (Injectafer) — 750 mg × 1; IRON ISOMALTOSIDE (Monoferric) — 1000 mg single dose; FERUMOXYTOL (Feraheme) — 510 mg × 2.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 2, title: "TEST DOSE (iron dextran ONLY)", body: "25 mg IV over 5 min; observe 30 min; if no reaction → proceed with full dose; modern iron formulations DON'T require test dose.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 3, title: "Pre-medication (selected)", body: "For history of mild reactions OR high-risk (multiple allergies, asthma) — diphenhydramine 25-50 mg IV + corticosteroid + acetaminophen 30 min before; NOT routine.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 4, title: "Establish IV access", body: "Large vein; AVOID hand / small distal veins (extravasation skin staining); ensure good flow.", citationIDs: ["openrn_pr_round26"]),
            ProcedureStep(number: 5, title: "Administer slowly", body: "Per manufacturer rate; iron sucrose 100 mg over 5-10 min; ferric carboxymaltose 750 mg over 7.5 min push OR 250 mL NS over 15-30 min; do NOT exceed.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 6, title: "Monitor during infusion", body: "Continuous observation; VS at start + during + at completion; assess for flushing, urticaria, dyspnea, hypotension, chest tightness, hypertension.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 7, title: "Observation × 30 min after", body: "Most reactions occur within first dose + within 30 minutes; have anaphylaxis kit ready.", citationIDs: ["specialty_pr_round26"])
        ],
        postProcedure: [
            AttributedBullet("Document — formulation, dose, infusion rate, vital signs, reactions, patient tolerance.", citationIDs: ["openrn_pr_round26"]),
            AttributedBullet("Schedule next session per total cumulative dose plan.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("RECHECK Hgb + ferritin at 4-6 weeks after completion of course.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("FERRIC CARBOXYMALTOSE — check phosphorus at 2-4 weeks (hypophosphatemia common).", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Counsel — possible mild myalgia / arthralgia 1-3 days after (\"flu-like\"); dark stools normal; brown skin staining at extravasation site.", citationIDs: ["openrn_pr_round26"])
        ],
        documentation: [
            AttributedBullet("Formulation + dose + infusion rate, pre + during + post vital signs, complications, response, follow-up plan.", citationIDs: ["openrn_pr_round26"]),
            AttributedBullet("Total cumulative iron given + planned remaining.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Hgb + ferritin trends.", citationIDs: ["specialty_pr_round26"])
        ],
        watchFor: [
            AttributedBullet("ANAPHYLAXIS / HYPERSENSITIVITY — RARE with modern iron sucrose / carboxymaltose / isomaltoside; epinephrine + steroids ready; iron dextran higher risk per primary source.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("HYPOTENSION — rapid infusion; reduce rate; rare with slow infusion.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("HYPOPHOSPHATEMIA — common with ferric carboxymaltose (~50%); check P + replace if symptomatic / <2.0 mg/dL per primary source.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("EXTRAVASATION — skin staining brown / black; cosmetic concern; large vein + careful insertion + monitoring.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("MILD INFUSION REACTIONS — Fishbane reaction (urticaria, mild dyspnea); typically self-limited; pause infusion + reassess; can usually complete.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("LATE REACTIONS — myalgia, arthralgia 1-3 days after; usually self-limited; supportive care.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("PREGNANCY — Category B-C depending on formulation; reserved for 2nd-3rd trimester; oral preferred 1st trimester.", citationIDs: ["specialty_pr_round26"])
        ],
        citations: [openrnPRR26, cdcPRR26, specialtyPRR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LiverBiopsySample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "liver-biopsy",
        title: "Liver biopsy (percutaneous + transjugular)",
        subtitle: "Histologic diagnosis · staging fibrosis · pre-biopsy coag + platelets · POST-PROCEDURE BLEEDING risk · positioning supine right lateral × 2-4 hrs",
        nclexTags: procTagsR26,
        indications: AttributedProse(
            "Histologic diagnosis + fibrosis staging in liver disease — unexplained chronic liver disease, autoimmune hepatitis suspected, PBC AMA-negative, PSC suspected, hereditary disease workup (HFE, Wilson, alpha-1 antitrypsin), drug-induced liver injury, transplant rejection, hepatic mass characterization per primary source.",
            citationIDs: ["specialty_pr_round26"]
        ),
        contraindications: AttributedProse(
            "Severe coagulopathy uncorrected (INR >1.5, platelets <60K, severe vWD); marked ascites (relative — drain first); morbid obesity (difficult landmarks); uncooperative patient; vascular tumor with bleeding risk; cholangitis active; allergic to local anesthetic.",
            citationIDs: ["specialty_pr_round26"]
        ),
        equipment: [
            AttributedBullet("PERCUTANEOUS biopsy — Tru-Cut, Menghini, or core biopsy needles; ultrasound or CT guidance.", citationIDs: ["openrn_pr_round26"]),
            AttributedBullet("TRANSJUGULAR biopsy — Quick-Core needle through jugular access; IR procedure; for ascites / coagulopathy.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("Pre-procedure — coag panel + platelets + type + screen.", citationIDs: ["openrn_pr_round26"]),
            AttributedBullet("Pain management — IV moderate sedation OR local lidocaine.", citationIDs: ["openrn_pr_round26"]),
            AttributedBullet("Post-procedure positioning support — right side, sandbag, vital signs monitoring.", citationIDs: ["openrn_pr_round26"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders + indication.", citationIDs: ["openrn_pr_round26"]),
            AttributedBullet("LABS — CBC (platelets >60K), coag (PT/PTT, INR; INR <1.5), type + screen, CMP, LFTs.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("HOLD ANTICOAGULANTS — warfarin 5-7 days; DOACs 24-48 hrs; antiplatelets often held 5-7 days; bridge if high VTE risk.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("CONSENT — explain risks (bleeding ~0.5%, pneumothorax / hemothorax, biliary leak, infection, death rare ~0.01-0.1%).", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("NPO 6-8 hours per sedation protocol.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("IV access × 2; vital signs baseline.", citationIDs: ["openrn_pr_round26"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Position + landmark", body: "Supine OR slight left lateral decubitus; right arm above head; mark midaxillary line + intercostal space using ultrasound guidance.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 2, title: "Sterile prep + local anesthesia", body: "Chlorhexidine prep + sterile drape; lidocaine 1-2% infiltration of skin + subcutaneous + intercostal muscles + liver capsule.", citationIDs: ["openrn_pr_round26"]),
            ProcedureStep(number: 3, title: "Pre-procedure ultrasound", body: "Confirm safe needle path; identify vessels + biliary structures + lesions to target.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 4, title: "Needle insertion + biopsy", body: "Trocar through intercostal space at end-expiration (most common); 1-2 quick passes; multiple cores for adequate sample.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 5, title: "Post-needle removal", body: "Direct manual pressure × 5-10 minutes; observe for bleeding signs.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 6, title: "Patient positioning", body: "RIGHT LATERAL DECUBITUS × 2-4 hours; tamponades biopsy tract; reduces bleeding.", citationIDs: ["specialty_pr_round26"]),
            ProcedureStep(number: 7, title: "Specimen preservation", body: "Specimen in formalin; ensure adequate length (>1.5 cm preferred); send to pathology with clinical info.", citationIDs: ["specialty_pr_round26"])
        ],
        postProcedure: [
            AttributedBullet("RIGHT LATERAL DECUBITUS × 2-4 hours.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("VITAL SIGNS — q15 min × 2 hours, q30 min × 2 hours, q1 hour × remainder; monitor for tachycardia, hypotension (bleeding).", citationIDs: ["openrn_pr_round26"]),
            AttributedBullet("PAIN ASSESSMENT — shoulder pain (referred from diaphragm irritation) is COMMON + benign; severe abdominal pain or distension = concerning for bleeding.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("RECHECK Hgb at 2-4 hours; CT abdomen if symptoms / signs of hemorrhage.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("OBSERVE 4-6 hours minimum; can discharge if stable.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("RESTRICT ACTIVITY × 1-2 weeks — no heavy lifting, contact sports; gentle ambulation OK.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("RESUME anticoagulation per surgeon — typically 24-48 hours if stable + no bleeding.", citationIDs: ["specialty_pr_round26"])
        ],
        documentation: [
            AttributedBullet("Indication, needle type, biopsy number + length, complications, sample sent for pathology.", citationIDs: ["openrn_pr_round26"]),
            AttributedBullet("Pre + post labs, vital signs, pain, positioning, discharge criteria.", citationIDs: ["specialty_pr_round26"])
        ],
        watchFor: [
            AttributedBullet("BLEEDING — most common serious complication; intraperitoneal (severe — abdominal pain + hypotension), intrahepatic (more subtle), subcapsular hematoma; emergent CT + IR embolization OR surgery; ~0.5% incidence per primary source.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("PNEUMOTHORAX / HEMOTHORAX — intercostal approach; ~0.1%; chest X-ray if dyspnea / chest pain.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("BILIARY PERITONITIS / leak — rare; severe abdominal pain + sepsis features; ERCP + drainage.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("REFERRED SHOULDER PAIN — common, benign; from diaphragmatic irritation; reassure + analgesia.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("INFECTION — rare; abx as needed.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("DEATH — very rare (~0.01-0.1%); mostly from bleeding.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("TRANSJUGULAR alternative — for ascites, severe coagulopathy, morbid obesity; less bleeding risk; IR procedure.", citationIDs: ["specialty_pr_round26"]),
            AttributedBullet("FAILED BIOPSY (inadequate specimen) — repeat OR alternative imaging-guided.", citationIDs: ["specialty_pr_round26"])
        ],
        citations: [openrnPRR26, cdcPRR26, specialtyPRR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AnticoagulationReversalSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "anticoagulation-reversal-strategies",
        title: "Anticoagulation reversal strategies",
        subtitle: "By anticoagulant · warfarin (vitamin K + 4F-PCC) · dabigatran (idarucizumab) · Xa inhibitors (andexanet + 4F-PCC) · heparin (protamine)",
        eyebrow: "REFERENCE · HEMATOLOGY",
        nclexTags: refTagsR26,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Anticoagulation reversal indicated for life-threatening bleeding OR urgent surgery / procedure. Strategy depends on specific anticoagulant + clinical urgency + bleed severity. Resume anticoagulation as soon as medically appropriate after reversal — patient was on anticoagulant for a reason per primary source.",
                citationIDs: ["specialty_pr_round26"]
            )),
            .keyValueTable(title: "Warfarin reversal", [
                KeyValueRow(key: "INR 4.5-10, NO bleeding", value: "Hold warfarin; vitamin K 1-2.5 mg PO (or 1 mg IV slow); recheck INR in 12-24 hrs"),
                KeyValueRow(key: "INR >10, NO bleeding", value: "Hold warfarin; vitamin K 2.5-5 mg PO; recheck INR in 12-24 hrs; consider PCC if INR not declining"),
                KeyValueRow(key: "Any INR with MAJOR bleeding", value: "5-10 mg vitamin K IV slow + 4-FACTOR PCC (Kcentra) 25-50 units/kg IV (INR-based dosing); recheck INR at 30 min, 6 hrs, 24 hrs"),
                KeyValueRow(key: "Pre-emergent surgery", value: "4F-PCC 25-50 units/kg + vitamin K 5 mg IV OR 10 mg PO; goal INR <1.5 within 30 min"),
                KeyValueRow(key: "FFP alternative", value: "10-15 mL/kg IF PCC unavailable; less reliable + larger volume + slower")
            ]),
            .keyValueTable(title: "Dabigatran (Pradaxa) reversal", [
                KeyValueRow(key: "Specific antidote", value: "IDARUCIZUMAB (Praxbind) 5 g IV × 1 dose (2 consecutive 2.5 g infusions); works within minutes; for life-threatening bleeding OR urgent surgery"),
                KeyValueRow(key: "Alternative", value: "4F-PCC 25-50 units/kg (off-label) IF idarucizumab unavailable"),
                KeyValueRow(key: "Hemodialysis", value: "Dabigatran is dialyzable; consider for refractory bleeding OR renal failure; remove ~50%"),
                KeyValueRow(key: "Activated charcoal", value: "Within 2-4 hrs of ingestion; ineffective for established absorption")
            ]),
            .keyValueTable(title: "Apixaban + Rivaroxaban reversal", [
                KeyValueRow(key: "Specific antidote", value: "ANDEXANET ALFA (Andexxa) — low dose (400 mg bolus + 4 mg/min × 120 min OR high dose 800 mg + 8 mg/min × 120 min); FDA-approved 2018; expensive"),
                KeyValueRow(key: "Alternative", value: "4F-PCC (Kcentra) 25-50 units/kg (off-label) — common in many institutions due to andexanet cost"),
                KeyValueRow(key: "Edoxaban + Betrixaban", value: "Off-label andexanet OR 4F-PCC; limited data; specialty"),
                KeyValueRow(key: "Activated charcoal", value: "Within 2-4 hrs of ingestion")
            ]),
            .keyValueTable(title: "Heparin / LMWH reversal", [
                KeyValueRow(key: "Unfractionated heparin", value: "PROTAMINE SULFATE 1 mg per 100 units heparin within prior 30 min; max 50 mg per dose; slow IV ≥10 min (anaphylaxis + hypotension)"),
                KeyValueRow(key: "LMWH (enoxaparin, dalteparin)", value: "Partial reversal only (anti-Xa); protamine 1 mg per 1 mg enoxaparin within 8 hrs; 0.5 mg per 1 mg between 8-12 hrs; not effective >12 hrs"),
                KeyValueRow(key: "Fondaparinux", value: "NO specific reversal; supportive care + recombinant Factor VIIa controversial")
            ]),
            .keyValueTable(title: "Antiplatelet reversal (less established)", [
                KeyValueRow(key: "Aspirin / clopidogrel / ticagrelor", value: "PLATELET TRANSFUSION (limited evidence); DDAVP 0.3 mcg/kg IV; for emergent procedures + life-threatening bleeding"),
                KeyValueRow(key: "Specific reversals", value: "Bentracimab (reverses ticagrelor) emerging; not yet FDA-approved"),
                KeyValueRow(key: "Hold pre-op", value: "Aspirin 5-7 days; clopidogrel + prasugrel 5-7 days; ticagrelor 3-5 days")
            ]),
            .bullets(title: "General reversal principles", [
                AttributedBullet("ASSESS severity of bleeding + need for emergent procedure — vs balance of continued anticoagulation indication.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("STOP anticoagulant immediately.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("SUPPORTIVE measures — pressure, packing, surgical / endoscopic hemostasis as appropriate.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("BLOOD products — pRBC for symptomatic anemia; platelets if <50K + bleeding OR <100K + intracranial; FFP / cryoprecipitate for coagulopathy.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("MASSIVE TRANSFUSION PROTOCOL for severe hemorrhage — 1:1:1 RBC:FFP:platelets ratio.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("MONITOR specific labs — INR for warfarin; thrombin time / dTT for dabigatran; anti-Xa for heparin / LMWH.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("RESUME anticoagulation when bleeding controlled + thrombotic risk justifies — typically 24-48 hours; bridge with parenteral if needed.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("THROMBOPROPHYLAXIS — mechanical (SCDs, IPC) until pharmacological can be resumed.", citationIDs: ["specialty_pr_round26"])
            ]),
            .bullets(title: "Emerging therapies", [
                AttributedBullet("CIRAPARANTAG (PER977) — universal reversal agent for heparin + DOACs + LMWH; emerging.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("BENTRACIMAB — specific ticagrelor reversal; in development.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Activated PCC (FEIBA) — for inhibitors in hemophilia; off-label for some DOAC reversal.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Hemodialysis for selected (dabigatran, fondaparinux).", citationIDs: ["specialty_pr_round26"])
            ]),
            .bullets(title: "Clinical decision points", [
                AttributedBullet("ANTIDOTE vs PCC — antidote (idarucizumab, andexanet) faster + specific but more expensive; PCC slower but cheaper + cross-coverage.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("INSTITUTIONAL PROTOCOL — most hospitals have anticoagulation reversal protocols + access to medications.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("HEMATOLOGY + PHARMACY consultation — for complex cases + cost considerations.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("THROMBOPHILIC condition — high VTE / stroke risk; balance reversal vs thrombosis; resume anticoagulation early.", citationIDs: ["specialty_pr_round26"])
            ])
        ],
        citations: [openrnPRR26, cdcPRR26, specialtyPRR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TransfusionReactionTypesSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "transfusion-reaction-types-management",
        title: "Transfusion reactions — types + management",
        subtitle: "Acute hemolytic · febrile non-hemolytic · allergic · TRALI · TACO · sepsis · delayed hemolytic · iron overload",
        eyebrow: "REFERENCE · TRANSFUSION MEDICINE",
        nclexTags: refTagsR26,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Transfusion reactions classified by mechanism + timing — acute (during or within 24 hrs) vs delayed (>24 hrs - weeks-months). Despite improved blood banking, reactions still occur. Universal blood product safety practices + vigilant monitoring + rapid recognition + appropriate response are essential per primary source.",
                citationIDs: ["specialty_pr_round26"]
            )),
            .keyValueTable(title: "Acute transfusion reactions (<24 hrs)", [
                KeyValueRow(key: "ACUTE HEMOLYTIC (ABO incompatibility)", value: "Major mismatch; intravascular hemolysis; mortality ~10%; PRESENTATION: fever, chills, flank pain, hemoglobinuria, hypotension, DIC, AKI"),
                KeyValueRow(key: "FEBRILE NON-HEMOLYTIC", value: "Cytokines from white cells; ~1% of transfusions; PRESENTATION: temp >1°C rise, chills, nausea"),
                KeyValueRow(key: "ALLERGIC / urticarial", value: "Donor plasma proteins → recipient IgE; PRESENTATION: hives, pruritus; mild — slow + diphenhydramine; severe → anaphylaxis"),
                KeyValueRow(key: "ANAPHYLAXIS", value: "IgA-deficient recipient + anti-IgA antibodies; can be fatal; PRESENTATION: hypotension, bronchospasm, angioedema"),
                KeyValueRow(key: "TRALI (transfusion-related acute lung injury)", value: "Donor anti-leukocyte antibodies; ARDS within 6 hrs; leading cause of transfusion-related mortality; PRESENTATION: ARDS, hypoxemia, pulmonary edema NOT due to volume"),
                KeyValueRow(key: "TACO (transfusion-associated circulatory overload)", value: "Volume overload; especially elderly + CHF + renal failure; PRESENTATION: dyspnea, BP elevation, hypoxemia, pulmonary edema"),
                KeyValueRow(key: "BACTERIAL CONTAMINATION", value: "Particularly platelets (room temp); GBS, Yersinia in RBC; PRESENTATION: fever + hypotension + tachycardia + shock"),
                KeyValueRow(key: "HYPOCALCEMIA from citrate", value: "Massive transfusion; PRESENTATION: paresthesias, tetany, prolonged QT")
            ]),
            .keyValueTable(title: "Delayed transfusion reactions (>24 hrs)", [
                KeyValueRow(key: "DELAYED HEMOLYTIC", value: "Anamnestic response to minor antigens (Rh, Kell, Duffy, Kidd); 3-14 days post-transfusion; PRESENTATION: falling Hgb, mild jaundice, positive DAT"),
                KeyValueRow(key: "GRAFT-VS-HOST DISEASE", value: "Donor lymphocytes attack recipient; immunocompromised recipients; PREVENTION: irradiation of blood products; PRESENTATION: pancytopenia, hepatitis, rash, fever 7-21 days"),
                KeyValueRow(key: "TRANSFUSION-TRANSMITTED INFECTION", value: "HIV, HBV, HCV, syphilis, Zika, malaria, CMV, HTLV; modern screening rare; CMV-negative blood for CMV-seronegative patients"),
                KeyValueRow(key: "IRON OVERLOAD", value: "Chronic transfusion (thalassemia, sickle cell, MDS); deferoxamine / deferasirox chelation indicated; cardiac + hepatic damage"),
                KeyValueRow(key: "ALLOIMMUNIZATION", value: "Antibodies to donor RBC antigens; future transfusion challenges; HLA antibodies → platelet refractoriness")
            ]),
            .bullets(title: "Acute transfusion reaction — management protocol", [
                AttributedBullet("STOP TRANSFUSION IMMEDIATELY — maintain IV access with NS.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("VERIFY PATIENT IDENTIFICATION + blood product label — most acute hemolytic reactions are CLERICAL ERRORS at bedside.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("VITAL SIGNS + assess airway, breathing, circulation; ECG; pulse oximetry.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("NOTIFY PROVIDER + BLOOD BANK immediately; suspend issuing additional units.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("INVESTIGATION samples — return blood unit to blood bank; new specimens — DAT (direct antiglobulin / Coombs), hemolysis panel (LDH, haptoglobin, bilirubin, urinalysis for free hemoglobin), CBC, coag, electrolytes.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("SUPPORTIVE — IV fluids, vasopressors for hypotension, oxygen, treat hyperkalemia, monitor renal function.", citationIDs: ["specialty_pr_round26"])
            ]),
            .bullets(title: "Specific reaction management", [
                AttributedBullet("ACUTE HEMOLYTIC — large-volume fluid resuscitation, vasopressors, treat hyperkalemia, DIC management, dialysis for AKI; mortality high.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("FEBRILE NON-HEMOLYTIC — acetaminophen; pre-medicate future with diphenhydramine + acetaminophen; LEUKOREDUCED blood for chronic transfusion patients.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("MILD ALLERGIC — slow infusion + diphenhydramine 25-50 mg IV; can usually complete; WASHED RBC for chronic.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("ANAPHYLAXIS — STOP, epinephrine 0.3 mg IM, IV fluids, steroids, airway support; IgA-deficient + recurrent → washed RBC + IgA-deficient FFP.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("TRALI — STOP transfusion + supportive ARDS care; ventilation, diuretics ONLY if concurrent TACO; mortality 5-10%.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("TACO — STOP, IV furosemide 20-40 mg, oxygen, sit up; prevent with slower rates + smaller volumes in at-risk patients.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("BACTERIAL CONTAMINATION — broad-spectrum antibiotics; blood culture + sepsis management.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("HYPOCALCEMIA — IV calcium gluconate 1-2 g; common in massive transfusion.", citationIDs: ["specialty_pr_round26"])
            ]),
            .bullets(title: "Prevention", [
                AttributedBullet("Two-person check at bedside + blood product label — prevent clerical errors → acute hemolytic.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Pre-transfusion vitals + ongoing monitoring during.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("LEUKOREDUCED RBC standard — reduces febrile non-hemolytic + CMV transmission + alloimmunization.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("IRRADIATED blood for IMMUNOCOMPROMISED — prevents GVHD.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("WASHED RBC for IgA-deficient or severe allergic reactions.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("CMV-NEGATIVE blood for transplant + immunocompromised + neonates.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("RESTRICTIVE transfusion thresholds — Hgb <7 (or <8 in cardiac); platelets <10K (prophylactic), <20K (febrile), <50K (procedure / bleeding).", citationIDs: ["specialty_pr_round26"])
            ])
        ],
        citations: [openrnPRR26, cdcPRR26, specialtyPRR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CirrhosisComplicationsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "cirrhosis-complications-management",
        title: "Cirrhosis complications management",
        subtitle: "Varices + ascites + SBP + hepatic encephalopathy + hepatorenal syndrome · MELD score · HCC surveillance · transplant evaluation",
        eyebrow: "REFERENCE · HEPATOLOGY",
        nclexTags: refTagsR26,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Decompensated cirrhosis manifests as variceal bleeding, ascites, spontaneous bacterial peritonitis (SBP), hepatic encephalopathy (HE), hepatorenal syndrome (HRS), hepatopulmonary syndrome (HPS), portopulmonary hypertension, hepatocellular carcinoma (HCC). Aggressive prevention + treatment + transplant evaluation in eligible patients per primary source.",
                citationIDs: ["specialty_pr_round26"]
            )),
            .keyValueTable(title: "Esophageal varices", [
                KeyValueRow(key: "Screening", value: "ENDOSCOPY at cirrhosis diagnosis; surveillance every 1-2 years"),
                KeyValueRow(key: "Primary prophylaxis", value: "Non-selective β-BLOCKER (propranolol, nadolol, carvedilol) titrated to HR 55-60; OR endoscopic VARICEAL LIGATION for high-risk varices"),
                KeyValueRow(key: "Active bleeding", value: "Hemodynamic resuscitation (RBC, FFP, platelets); IV octreotide 50 mcg bolus + 50 mcg/hr × 3-5 days; prophylactic antibiotics (ceftriaxone × 7 days); EMERGENT ENDOSCOPIC VARICEAL LIGATION ± sclerotherapy"),
                KeyValueRow(key: "Refractory bleeding", value: "TIPS (transjugular intrahepatic portosystemic shunt) — for failed endoscopic therapy"),
                KeyValueRow(key: "Secondary prophylaxis", value: "β-blocker + endoscopic banding (combined effective) after first variceal bleed")
            ]),
            .keyValueTable(title: "Ascites", [
                KeyValueRow(key: "Diagnosis", value: "Physical exam (shifting dullness, fluid wave); ultrasound; PARACENTESIS for SAAG (serum-ascites albumin gradient) — >1.1 = portal hypertension; <1.1 = other cause"),
                KeyValueRow(key: "Management", value: "Sodium restriction <2 g/day; diuretics (SPIRONOLACTONE 100 mg + furosemide 40 mg PO daily; titrate to weight loss 0.5 kg/day without edema, 1 kg/day with peripheral edema)"),
                KeyValueRow(key: "Refractory ascites", value: "Therapeutic paracentesis (with albumin replacement 6-8 g/L removed); TIPS; transplant evaluation"),
                KeyValueRow(key: "Large-volume paracentesis", value: "Albumin replacement for removal >5 L — prevents post-paracentesis circulatory dysfunction")
            ]),
            .keyValueTable(title: "Spontaneous bacterial peritonitis (SBP)", [
                KeyValueRow(key: "Definition", value: "Ascitic fluid neutrophil count ≥250/µL OR positive culture without secondary source"),
                KeyValueRow(key: "Treatment", value: "CEFTRIAXONE 2 g IV daily × 5-7 days OR cefotaxime 2 g IV q8h"),
                KeyValueRow(key: "Albumin", value: "1.5 g/kg day 1 + 1 g/kg day 3 — reduces hepatorenal syndrome + mortality per primary source"),
                KeyValueRow(key: "Prophylaxis", value: "TMP-SMX, ciprofloxacin, or norfloxacin daily — for prior SBP OR low-protein ascites (<1 g/dL) + child-Pugh C")
            ]),
            .keyValueTable(title: "Hepatic encephalopathy (HE)", [
                KeyValueRow(key: "Grading", value: "Grade 0 (normal); 1 (mild confusion); 2 (lethargy + asterixis); 3 (somnolent + arousable); 4 (coma)"),
                KeyValueRow(key: "Triggers", value: "GI bleeding, infection, dehydration, electrolyte imbalance, constipation, sedatives, dietary protein excess, TIPS, renal failure"),
                KeyValueRow(key: "LACTULOSE", value: "First-line; 30-45 mL PO TID-QID titrated to 2-3 soft BMs daily; reduces gut ammonia absorption"),
                KeyValueRow(key: "RIFAXIMIN", value: "Second-line + add-on; 550 mg PO BID; non-absorbable antibiotic; reduces ammonia-producing bacteria"),
                KeyValueRow(key: "AMMONIA testing", value: "Limited utility; clinical diagnosis primary; useful for trending in some")
            ]),
            .keyValueTable(title: "Hepatorenal syndrome (HRS)", [
                KeyValueRow(key: "Definition", value: "Renal failure in advanced cirrhosis + no other identifiable cause; functional; vasoconstriction of renal arteries from splanchnic vasodilation"),
                KeyValueRow(key: "TYPE 1", value: "Acute, doubling of Cr to >2.5 mg/dL within 2 weeks; high mortality without transplant"),
                KeyValueRow(key: "TYPE 2", value: "Chronic, Cr 1.5-2.5 mg/dL; insidious"),
                KeyValueRow(key: "Treatment", value: "TERLIPRESSIN (Type 1) + IV ALBUMIN; norepinephrine alternative; bridge to transplant"),
                KeyValueRow(key: "Renal transplant alone", value: "NOT for HRS — liver transplant cures HRS; combined liver-kidney transplant for severe")
            ]),
            .keyValueTable(title: "Hepatocellular carcinoma (HCC) surveillance", [
                KeyValueRow(key: "All cirrhotic patients", value: "Abdominal ULTRASOUND + AFP every 6 months"),
                KeyValueRow(key: "Diagnostic", value: "Triple-phase CT or MRI with HCC contrast washout; AFP >200 + characteristic imaging diagnostic"),
                KeyValueRow(key: "Treatment", value: "Resection, transplant, RFA, TACE, sorafenib / lenvatinib / atezolizumab + bevacizumab; depends on stage + liver function (BCLC staging)")
            ]),
            .bullets(title: "Other complications", [
                AttributedBullet("HEPATOPULMONARY SYNDROME — intrapulmonary vasodilation + hypoxemia + platypnea-orthodeoxia (worse standing); liver transplant cures.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("PORTOPULMONARY HYPERTENSION — pulmonary vascular constriction; mean PAP >25 mmHg + portal HTN; pulmonary vasodilators + transplant.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("CIRRHOTIC CARDIOMYOPATHY — subclinical cardiac dysfunction; reversible with transplant.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("VTE — increased risk despite coagulopathy; prophylaxis with LMWH in selected.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("INFECTIONS — high risk; pneumonia, urinary, SBP, skin; vaccinations + early treatment.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("OSTEOPOROSIS + bone disease — vitamin D, calcium, bisphosphonates.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("MUSCLE WASTING + SARCOPENIA — protein supplementation 1.2-1.5 g/kg/day; exercise.", citationIDs: ["specialty_pr_round26"])
            ]),
            .bullets(title: "MELD score + transplant evaluation", [
                AttributedBullet("MELD (Model for End-Stage Liver Disease) — bilirubin + INR + creatinine + sodium; range 6-40; predicts 3-month mortality + transplant priority.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("MELD ≥15 — transplant evaluation indicated.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("CHILD-PUGH classification — A (compensated), B (variable decompensation), C (decompensated); prognosis indicator.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("HCC exception points — added to MELD for transplant priority within Milan criteria.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Multidisciplinary transplant evaluation — hepatology, transplant surgery, social work, psychiatry, financial counseling.", citationIDs: ["specialty_pr_round26"])
            ])
        ],
        citations: [openrnPRR26, cdcPRR26, specialtyPRR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AutoimmuneHepatobiliarySample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "autoimmune-hepatobiliary",
        title: "Autoimmune hepatobiliary disease overview",
        subtitle: "AIH + PBC + PSC + IgG4 cholangiopathy + overlap syndromes · distinct serologies · UDCA / immunosuppression / endoscopy · transplant for refractory",
        eyebrow: "REFERENCE · HEPATOLOGY",
        nclexTags: refTagsR26,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Autoimmune hepatobiliary diseases — autoimmune hepatitis (AIH), primary biliary cholangitis (PBC), primary sclerosing cholangitis (PSC), IgG4-related cholangiopathy, overlap syndromes. Distinct presentations, serologies, treatment + prognosis. Multidisciplinary specialty care per primary source.",
                citationIDs: ["specialty_pr_round26"]
            )),
            .keyValueTable(title: "Comparison of major autoimmune hepatobiliary diseases", [
                KeyValueRow(key: "AUTOIMMUNE HEPATITIS (AIH)", value: "Hepatocellular; female 4:1; ANA + SMA (type 1) OR anti-LKM-1 (type 2); high IgG; steroids + azathioprine; transplant for refractory"),
                KeyValueRow(key: "PRIMARY BILIARY CHOLANGITIS (PBC)", value: "Cholestatic; female 9:1; AMA + (90%); high IgM; UDCA + obeticholic acid; transplant for intractable"),
                KeyValueRow(key: "PRIMARY SCLEROSING CHOLANGITIS (PSC)", value: "Cholestatic; male 2:1; pANCA+; MRCP \"beading\"; UDCA controversial; transplant only curative; IBD association"),
                KeyValueRow(key: "IgG4-related cholangiopathy", value: "Mimics PSC + cholangiocarcinoma; elevated IgG4; steroid responsive; multi-organ disease (pancreatitis, sialadenitis, retroperitoneal fibrosis)"),
                KeyValueRow(key: "AIH-PBC OVERLAP", value: "5-15% of AIH or PBC patients; both serologies + features; combined UDCA + immunosuppression"),
                KeyValueRow(key: "AIH-PSC OVERLAP", value: "Rare; cholestatic + hepatocellular; combined therapies; transplant for end-stage")
            ]),
            .bullets(title: "Diagnostic distinguishing features", [
                AttributedBullet("HEPATOCELLULAR pattern — high AST/ALT (≥2-10× ULN) with mild alkaline phosphatase elevation = AIH.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("CHOLESTATIC pattern — high alkaline phosphatase + GGT (>1.5× ULN) with mild AST/ALT = PBC or PSC.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("IgG elevation — AIH.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("IgM elevation — PBC.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("IgG4 elevation — IgG4-related cholangiopathy.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("ANA + SMA — AIH type 1 (most common).", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Anti-LKM-1 — AIH type 2 (more pediatric + severe).", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("AMA — PBC (~90% positive); M2 subtype pathognomonic.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("MRCP — diagnostic for PSC (multifocal strictures + beading).", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Liver biopsy — interface hepatitis (AIH); florid duct lesion + granulomas (PBC); onion-skin fibrosis (PSC).", citationIDs: ["specialty_pr_round26"])
            ]),
            .bullets(title: "AIH management principles", [
                AttributedBullet("Prednisone 30-60 mg/day → taper to 5-10 mg/day maintenance OR budesonide 9 mg/day (non-cirrhotic, fewer side effects).", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Azathioprine 1-2 mg/kg/day — steroid-sparing; TPMT testing before; CBC + LFTs monitoring.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Mycophenolate mofetil — alternative when azathioprine-intolerant.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Relapse common after discontinuation — consider lifelong maintenance.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Pregnancy — possible with monitored disease; avoid mycophenolate.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Transplant for refractory + ESLD.", citationIDs: ["specialty_pr_round26"])
            ]),
            .bullets(title: "PBC management principles", [
                AttributedBullet("UDCA 13-15 mg/kg/day — first-line; reduces progression + improves survival.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Obeticholic acid (Ocaliva) — for UDCA inadequate response or intolerance; titrate; PRURITUS worsening.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Pruritus management — cholestyramine first-line; rifampin; naltrexone; IBAT inhibitors emerging.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Bone health — calcium + vitamin D + DEXA + bisphosphonate.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Associated diseases — Sjögren, scleroderma, thyroid disease; comprehensive evaluation.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("HCC surveillance if cirrhotic.", citationIDs: ["specialty_pr_round26"])
            ]),
            .bullets(title: "PSC management principles", [
                AttributedBullet("NO PROVEN MEDICAL therapy slows progression — UDCA not effective in PSC.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Endoscopic management — ERCP + stricture dilation + stenting for symptomatic dominant strictures.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Antibiotics for cholangitis episodes — broad-spectrum + drainage.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("CHOLANGIOCARCINOMA surveillance — annual MRI/MRCP + CA 19-9.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("COLORECTAL CANCER surveillance in PSC + IBD — annual colonoscopy + biopsies.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("IBD coordination — concurrent ulcerative colitis common; combined hepatology + gastroenterology.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Liver transplant only curative; PSC can recur in transplant.", citationIDs: ["specialty_pr_round26"])
            ]),
            .bullets(title: "Common to all autoimmune hepatobiliary", [
                AttributedBullet("Vaccinations — HAV, HBV, pneumococcal, influenza; live vaccines avoid on immunosuppression.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Avoid hepatotoxic medications + alcohol abstinence.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("HCC surveillance if cirrhotic — ultrasound + AFP every 6 months.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Fat-soluble vitamin deficiency screening (A, D, E, K).", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Multidisciplinary care — hepatology, GI (PSC), rheumatology (associated autoimmune), ophthalmology, psychiatry.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Transplant evaluation as decompensation progresses; specific criteria per disease.", citationIDs: ["specialty_pr_round26"]),
                AttributedBullet("Patient education + support groups (American Liver Foundation, PBC Foundation, PSC Partners).", citationIDs: ["specialty_pr_round26"])
            ])
        ],
        citations: [openrnPRR26, cdcPRR26, specialtyPRR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}
