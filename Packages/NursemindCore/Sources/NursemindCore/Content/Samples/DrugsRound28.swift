import Foundation

// Curator-model drug entries (round 28 — pulmonary depth: PAH + ILD + severe asthma + CFTR + COPD).

private let openfdaR28 = CitationSource(
    id: "openfda_round28",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-05-13"
)
private let openrnPharmR28 = CitationSource(
    id: "openrn_pharm_round28",
    shortName: "Open RN Pharmacology + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-05-13"
)
private let specialtyR28 = CitationSource(
    id: "specialty_round28",
    shortName: "ATS + ERS + CHEST + GINA + GOLD + CFF concept citations",
    publisher: "ATS · ERS · CHEST · GINA · GOLD · CFF",
    license: .factCitationOnly,
    url: "https://www.thoracic.org/statements/",
    lastRetrieved: "2026-05-13"
)
private let ismpR28 = CitationSource(
    id: "ismp_round28",
    shortName: "ISMP High-Alert Medications 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-13"
)

public enum BosentanSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "bosentan",
        title: "Bosentan (Tracleer)",
        subtitle: "Dual endothelin receptor antagonist · PAH WHO Group 1 · HEPATOTOXICITY + TERATOGEN · monthly LFTs + pregnancy testing · REMS program",
        category: "Endothelin receptor antagonist (ERA) — PAH",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Dual endothelin receptor antagonist (ETA + ETB)"),
            KeyValueRow(key: "Use", value: "Pulmonary arterial hypertension (PAH) WHO Group 1, Functional Class II-IV; improves exercise capacity"),
            KeyValueRow(key: "Dose", value: "62.5 mg PO BID × 4 weeks → 125 mg PO BID (adult ≥40 kg); pediatric weight-based"),
            KeyValueRow(key: "Monitor", value: "LFTs MONTHLY + at every dose change (BOXED hepatotoxicity); CBC monthly; pregnancy test MONTHLY"),
            KeyValueRow(key: "Watch", value: "BOXED — hepatotoxicity + teratogenicity; REMS enrollment required; 2 contraception methods")
        ],
        indications: AttributedProse(
            "Pulmonary arterial hypertension (PAH) WHO Group 1 — Functional Class II-IV; improves exercise capacity + delays clinical worsening. Adult + pediatric (≥3 years) per primary source.",
            citationIDs: ["specialty_round28", "openfda_round28"]
        ),
        mechanism: AttributedProse(
            "Endothelin-1 (ET-1) is a potent vasoconstrictor + mitogen elevated in PAH causing pulmonary vasoconstriction + smooth muscle proliferation + fibrosis. Bosentan competitively binds ETA + ETB receptors → blocks ET-1 effects → pulmonary vasodilation + reduces vascular remodeling.",
            citationIDs: ["openfda_round28"]
        ),
        dosing: [
            DosingBlock(label: "Adult ≥40 kg", body: "Initial 62.5 mg PO BID × 4 weeks → maintenance 125 mg PO BID per primary source.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Adult <40 kg", body: "62.5 mg PO BID maintenance.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Pediatric (≥3 years)", body: "Weight-based: 4 mg/kg PO BID (max 125 mg BID).", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Hepatic impairment", body: "AVOID in Child-Pugh B + C (use alternatives); discontinue if AST/ALT >3× ULN.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Hepatotoxicity discontinuation", body: "ALT/AST 3-5× ULN — repeat in 2 weeks, decrease dose or stop; 5-8× ULN — stop, monthly LFTs; >8× ULN — stop permanently.", citationIDs: ["openfda_round28"])
        ],
        contraindications: AttributedProse(
            "PREGNANCY (TERATOGEN — major birth defects); cyclosporine A coadministration; glyburide coadministration; moderate-severe hepatic impairment (Child-Pugh B or C); ALT or AST >3× ULN.",
            citationIDs: ["openfda_round28"]
        ),
        warnings: [
            AttributedBullet("BOXED — HEPATOTOXICITY: dose-dependent ALT/AST elevations; monthly LFTs required; discontinue if elevated; rare hepatic failure.", citationIDs: ["openfda_round28"]),
            AttributedBullet("BOXED — TERATOGENICITY: major birth defects; REMS program enrollment for prescribers + pharmacies + patients; 2 reliable contraception methods required; monthly pregnancy testing.", citationIDs: ["openfda_round28"]),
            AttributedBullet("HEPATIC ENZYME elevations dose-related; reversible on discontinuation usually.", citationIDs: ["openfda_round28"]),
            AttributedBullet("FLUID RETENTION + EDEMA — monitor weight; consider diuretics; rule out heart failure.", citationIDs: ["openfda_round28"]),
            AttributedBullet("ANEMIA — monthly CBC; usually mild + reversible.", citationIDs: ["openfda_round28"]),
            AttributedBullet("PULMONARY VENO-OCCLUSIVE DISEASE (PVOD) — life-threatening pulmonary edema; discontinue.", citationIDs: ["openfda_round28"]),
            AttributedBullet("DECREASED SPERM COUNTS — reversible on discontinuation; counsel male patients.", citationIDs: ["openfda_round28"]),
            AttributedBullet("HYPERSENSITIVITY — rare; discontinue.", citationIDs: ["openfda_round28"]),
            AttributedBullet("REMS — REGISTER prescriber + pharmacy + patient; dispense ≤30 days at a time.", citationIDs: ["openfda_round28"])
        ],
        adverseReactions: AttributedProse(
            "Headache, peripheral edema, fluid retention, hepatic enzyme elevation, anemia, nasopharyngitis, flushing, hypotension, palpitations, dyspepsia.",
            citationIDs: ["openfda_round28"]
        ),
        drugInteractions: [
            AttributedBullet("CYP3A4 + CYP2C9 SUBSTRATE — strong CYP3A4 inducer; reduces levels of HORMONAL CONTRACEPTIVES (use non-hormonal backup), cyclosporine, sirolimus, tacrolimus, statins.", citationIDs: ["openfda_round28"]),
            AttributedBullet("CYCLOSPORINE A — CONTRAINDICATED (bosentan increases cyclosporine clearance; cyclosporine increases bosentan levels).", citationIDs: ["openfda_round28"]),
            AttributedBullet("GLYBURIDE — CONTRAINDICATED (increased hepatotoxicity risk).", citationIDs: ["openfda_round28"]),
            AttributedBullet("WARFARIN — bosentan reduces warfarin levels; monitor INR.", citationIDs: ["openfda_round28"]),
            AttributedBullet("SILDENAFIL + TADALAFIL — bosentan reduces PDE5 inhibitor levels; PAH combinations may still be used with monitoring.", citationIDs: ["specialty_round28"]),
            AttributedBullet("HORMONAL CONTRACEPTIVES — unreliable; use 2 non-hormonal contraception methods.", citationIDs: ["openfda_round28"])
        ],
        nursingImplications: [
            AttributedBullet("REMS ENROLLMENT required — prescriber + pharmacy + patient; monthly compliance documentation.", citationIDs: ["openfda_round28"]),
            AttributedBullet("BASELINE — LFTs, CBC, pregnancy test, contraception counseling (2 reliable methods for women of childbearing).", citationIDs: ["specialty_round28"]),
            AttributedBullet("MONTHLY MONITORING — LFTs, CBC, pregnancy test; lifelong vigilance per primary source.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Daily weight + edema check; rule out volume overload vs PAH worsening.", citationIDs: ["openrn_pharm_round28"]),
            AttributedBullet("Counsel — REPORT yellow skin/eyes, abdominal pain, dark urine, severe fatigue (hepatotoxicity), pregnancy concerns, new dyspnea.", citationIDs: ["openrn_pharm_round28"]),
            AttributedBullet("Avoid pregnancy — 2 reliable contraception methods (e.g., IUD + condom); MONTHLY pregnancy test.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Male patients — counsel decreased sperm; reversible; fertility planning.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Pharmacy fills monthly; 30-day supply max.", citationIDs: ["openfda_round28"])
        ],
        patientTeaching: AttributedProse(
            "This medicine relaxes blood vessels in your lungs. WOMEN — you must use TWO birth control methods and get a pregnancy test every month; this drug causes serious birth defects. Get monthly bloodwork. Call us if your eyes or skin turn yellow, urine darkens, or belly hurts. Daily weights. Carry an emergency card.",
            citationIDs: ["openrn_pharm_round28"]
        ),
        citations: [openfdaR28, openrnPharmR28, specialtyR28, ismpR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MacitentanSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "macitentan",
        title: "Macitentan (Opsumit)",
        subtitle: "Tissue-targeting ERA · PAH WHO Group 1 · once daily · TERATOGEN — REMS · less hepatotoxicity than bosentan · monthly pregnancy + Hgb",
        category: "Endothelin receptor antagonist (ERA) — PAH (newer)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Dual endothelin receptor antagonist with high tissue affinity"),
            KeyValueRow(key: "Use", value: "PAH WHO Group 1; reduces disease progression + hospitalization"),
            KeyValueRow(key: "Dose", value: "10 mg PO ONCE daily (convenient vs bosentan BID)"),
            KeyValueRow(key: "Monitor", value: "MONTHLY pregnancy test, hemoglobin q3-6 months; LFTs at baseline + as clinically indicated (less hepatotoxic than bosentan)"),
            KeyValueRow(key: "Watch", value: "REMS for teratogenicity; anemia; fluid retention; pulmonary edema (PVOD)")
        ],
        indications: AttributedProse(
            "Pulmonary arterial hypertension WHO Group 1 — reduces disease progression + hospitalization; SERAPHIN trial demonstrated benefit over placebo on composite endpoint per primary source.",
            citationIDs: ["specialty_round28", "openfda_round28"]
        ),
        mechanism: AttributedProse(
            "Tissue-targeting dual ETA + ETB endothelin receptor antagonist with sustained receptor occupancy + slower dissociation than bosentan → prolonged effect; once-daily dosing convenient.",
            citationIDs: ["openfda_round28"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "10 mg PO ONCE daily; no titration required.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Renal / hepatic", body: "Avoid in severe hepatic impairment (Child-Pugh C); no dose adjustment for renal or Child-Pugh A/B.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Pediatric", body: "Limited data; not routinely recommended.", citationIDs: ["openfda_round28"])
        ],
        contraindications: AttributedProse(
            "PREGNANCY (TERATOGEN); severe hepatic impairment (Child-Pugh C); hypersensitivity.",
            citationIDs: ["openfda_round28"]
        ),
        warnings: [
            AttributedBullet("BOXED — EMBRYO-FETAL TOXICITY: major birth defects; REMS enrollment; 2 reliable contraception methods; monthly pregnancy test for women of childbearing.", citationIDs: ["openfda_round28"]),
            AttributedBullet("HEPATOTOXICITY — less than bosentan but possible; baseline LFTs + monitor as clinically indicated; ALT >3× ULN → reduce / discontinue.", citationIDs: ["openfda_round28"]),
            AttributedBullet("ANEMIA — decreased Hgb; monitor q3-6 months.", citationIDs: ["openfda_round28"]),
            AttributedBullet("FLUID RETENTION + EDEMA — monitor weight; diuretics; rule out heart failure.", citationIDs: ["openfda_round28"]),
            AttributedBullet("PVOD — life-threatening pulmonary edema; discontinue.", citationIDs: ["openfda_round28"]),
            AttributedBullet("DECREASED SPERM COUNTS — class effect; counsel male patients about fertility.", citationIDs: ["openfda_round28"]),
            AttributedBullet("STRONG CYP3A4 INDUCERS / INHIBITORS — avoid; reduces / increases macitentan levels.", citationIDs: ["openfda_round28"]),
            AttributedBullet("REMS — register prescriber + pharmacy + patient.", citationIDs: ["openfda_round28"])
        ],
        adverseReactions: AttributedProse(
            "Anemia, nasopharyngitis, bronchitis, headache, urinary tract infection, hypotension, peripheral edema, decreased hemoglobin.",
            citationIDs: ["openfda_round28"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 inducers (rifampin, carbamazepine, phenytoin) — avoid; significantly reduce macitentan levels.", citationIDs: ["openfda_round28"]),
            AttributedBullet("STRONG CYP3A4 inhibitors (ritonavir, ketoconazole, itraconazole, clarithromycin) — avoid; significantly increase macitentan levels.", citationIDs: ["openfda_round28"]),
            AttributedBullet("HORMONAL CONTRACEPTIVES — use 2 non-hormonal methods due to class effect.", citationIDs: ["openfda_round28"]),
            AttributedBullet("WARFARIN — minimal interaction.", citationIDs: ["openfda_round28"])
        ],
        nursingImplications: [
            AttributedBullet("REMS ENROLLMENT required; education + documentation; pharmacy 30-day fill.", citationIDs: ["openfda_round28"]),
            AttributedBullet("BASELINE — LFTs, Hgb, pregnancy test, contraception counseling.", citationIDs: ["specialty_round28"]),
            AttributedBullet("MONTHLY pregnancy testing; Hgb q3-6 months; LFTs as clinically indicated.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Daily weight + edema; report unexplained gain.", citationIDs: ["openrn_pharm_round28"]),
            AttributedBullet("Counsel — daily dosing simplifies; report yellow skin, fatigue, breathlessness, new edema.", citationIDs: ["openrn_pharm_round28"]),
            AttributedBullet("Pregnancy avoidance non-negotiable; 2 contraception methods; tracking; pregnancy test monthly.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Less hepatotoxicity than bosentan — but ALT/AST elevations still occur; vigilance.", citationIDs: ["openfda_round28"])
        ],
        patientTeaching: AttributedProse(
            "Once-daily pill that helps your lungs. Get monthly pregnancy tests — this drug causes birth defects. Use TWO birth control methods. Tell us about belly pain, yellow eyes/skin, dark urine. Daily weights — call if rising. Get bloodwork every few months.",
            citationIDs: ["openrn_pharm_round28"]
        ),
        citations: [openfdaR28, openrnPharmR28, specialtyR28, ismpR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum RiociguatSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "riociguat",
        title: "Riociguat (Adempas)",
        subtitle: "Soluble guanylate cyclase stimulator · PAH + CTEPH (only approved drug for CTEPH) · TERATOGEN — REMS · NEVER with PDE5 inhibitors or nitrates",
        category: "Soluble guanylate cyclase (sGC) stimulator — PAH + CTEPH",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Soluble guanylate cyclase (sGC) stimulator — increases cGMP independent of NO + sensitizes sGC to endogenous NO"),
            KeyValueRow(key: "Use", value: "PAH WHO Group 1; INOPERABLE OR persistent/recurrent CTEPH after pulmonary endarterectomy (ONLY drug FDA-approved for CTEPH)"),
            KeyValueRow(key: "Dose", value: "Start 1 mg PO TID × 2 weeks; titrate +0.5 mg increments q2 weeks to max 2.5 mg TID"),
            KeyValueRow(key: "Monitor", value: "BP at each titration; pregnancy testing MONTHLY; CBC; PFTs; signs of bleeding"),
            KeyValueRow(key: "Watch", value: "BOXED — embryo-fetal toxicity REMS; NEVER with PDE5 inhibitors (sildenafil, tadalafil) — severe hypotension; NEVER with nitrates")
        ],
        indications: AttributedProse(
            "PAH WHO Group 1 + chronic thromboembolic pulmonary hypertension (CTEPH) — INOPERABLE OR persistent/recurrent after pulmonary endarterectomy. Improves exercise capacity + WHO functional class per primary source.",
            citationIDs: ["specialty_round28", "openfda_round28"]
        ),
        mechanism: AttributedProse(
            "Direct + indirect activation of soluble guanylate cyclase (sGC) — direct stimulation increases cGMP independent of NO; indirect sensitizes sGC to endogenous NO. Increased cGMP → smooth muscle relaxation + pulmonary vasodilation + antifibrotic effects.",
            citationIDs: ["openfda_round28"]
        ),
        dosing: [
            DosingBlock(label: "Initial titration", body: "1 mg PO TID × 2 weeks; if SBP >95 mm Hg + tolerated, increase by 0.5 mg q2 weeks to max 2.5 mg TID per primary source.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Hypotension management", body: "Reduce dose by 0.5 mg TID if SBP <95 mm Hg + symptomatic.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Renal / hepatic", body: "Severe renal (CrCl <15 mL/min) or hepatic (Child-Pugh C) impairment — limited data; caution.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Smoking", body: "Smokers have ~50% lower riociguat levels; consider dose at upper end; counsel smoking cessation.", citationIDs: ["openfda_round28"])
        ],
        contraindications: AttributedProse(
            "PREGNANCY (TERATOGEN); CONCURRENT PDE5 INHIBITORS (sildenafil, tadalafil, vardenafil); CONCURRENT NITRATES OR NO DONORS (severe hypotension); pulmonary hypertension associated with idiopathic interstitial pneumonia (PH-IIP — increased mortality).",
            citationIDs: ["openfda_round28"]
        ),
        warnings: [
            AttributedBullet("BOXED — EMBRYO-FETAL TOXICITY: REMS enrollment; 2 reliable contraception methods; monthly pregnancy testing.", citationIDs: ["openfda_round28"]),
            AttributedBullet("BOXED — PDE5 INHIBITOR COMBINATION: contraindicated (severe hypotension); separation by 24 hours minimum.", citationIDs: ["openfda_round28"]),
            AttributedBullet("HYPOTENSION — common; titrate carefully; reduce dose if SBP <95.", citationIDs: ["openfda_round28"]),
            AttributedBullet("BLEEDING — increased risk of serious bleeding (incl. fatal hemoptysis); discontinue with massive bleed.", citationIDs: ["openfda_round28"]),
            AttributedBullet("PULMONARY EDEMA in PVOD — discontinue.", citationIDs: ["openfda_round28"]),
            AttributedBullet("NITRATES + NO DONORS — contraindicated.", citationIDs: ["openfda_round28"]),
            AttributedBullet("REMS — enrollment required; pharmacy + prescriber + patient.", citationIDs: ["openfda_round28"]),
            AttributedBullet("PREGNANCY — abortion / spontaneous abortion + serious birth defects.", citationIDs: ["openfda_round28"])
        ],
        adverseReactions: AttributedProse(
            "Headache, dyspepsia, peripheral edema, nausea, dizziness, hypotension, vomiting, anemia, gastroenteritis.",
            citationIDs: ["openfda_round28"]
        ),
        drugInteractions: [
            AttributedBullet("PDE5 INHIBITORS — CONTRAINDICATED.", citationIDs: ["openfda_round28"]),
            AttributedBullet("NITRATES + NO DONORS — CONTRAINDICATED.", citationIDs: ["openfda_round28"]),
            AttributedBullet("ANTACIDS (Mg + Al) — separate by 1 hour; reduces riociguat absorption.", citationIDs: ["openfda_round28"]),
            AttributedBullet("STRONG CYP / P-gp inhibitors — increase riociguat; reduce dose 0.5 mg TID initially.", citationIDs: ["openfda_round28"]),
            AttributedBullet("SMOKING — significantly reduces levels; cessation counseling.", citationIDs: ["openfda_round28"]),
            AttributedBullet("WARFARIN — no significant interaction.", citationIDs: ["openfda_round28"])
        ],
        nursingImplications: [
            AttributedBullet("REMS ENROLLMENT — prescriber + pharmacy + patient.", citationIDs: ["openfda_round28"]),
            AttributedBullet("BASELINE — pregnancy test, blood pressure, CBC, PFTs.", citationIDs: ["specialty_round28"]),
            AttributedBullet("TITRATION — BP at every visit; reduce if SBP <95 + symptoms.", citationIDs: ["openfda_round28"]),
            AttributedBullet("MONTHLY pregnancy testing; education on contraception (2 methods).", citationIDs: ["openfda_round28"]),
            AttributedBullet("MEDICATION RECONCILIATION — flag PDE5 inhibitors (sildenafil/tadalafil), nitrates; emergency providers must know.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Counsel — REPORT bleeding (hemoptysis, GI), severe dizziness, dyspnea worsening.", citationIDs: ["openrn_pharm_round28"]),
            AttributedBullet("Smoking cessation counseling — significantly affects levels.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Medical alert bracelet — PAH + riociguat; emergency providers must know to avoid contraindications.", citationIDs: ["specialty_round28"])
        ],
        patientTeaching: AttributedProse(
            "This medicine helps blood vessels in your lungs relax. NEVER take sildenafil, tadalafil, or nitrates — they can cause severe drops in blood pressure. Tell every doctor you're on this. Stop smoking — it lowers the medicine's effect. Women — use 2 birth control methods + monthly pregnancy test. Get up slowly to avoid dizziness.",
            citationIDs: ["openrn_pharm_round28"]
        ),
        citations: [openfdaR28, openrnPharmR28, specialtyR28, ismpR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SelexipagSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "selexipag",
        title: "Selexipag (Uptravi)",
        subtitle: "Oral prostacyclin receptor (IP) agonist · PAH WHO Group 1 · twice daily · slow titration · GI side effects + flushing common",
        category: "Prostacyclin receptor (IP) agonist — PAH oral",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective oral non-prostanoid prostacyclin receptor (IP) agonist"),
            KeyValueRow(key: "Use", value: "PAH WHO Group 1; reduces disease progression + hospitalization (GRIPHON trial)"),
            KeyValueRow(key: "Dose", value: "Start 200 mcg PO BID; titrate +200 mcg BID weekly to max 1,600 mcg BID based on tolerability"),
            KeyValueRow(key: "Monitor", value: "GI side effects (HA, nausea, diarrhea, jaw pain), BP, exercise capacity"),
            KeyValueRow(key: "Watch", value: "Slow titration essential; tolerability dose-limiting; PVOD risk")
        ],
        indications: AttributedProse(
            "PAH WHO Group 1 — adults; reduces disease progression + hospitalization based on GRIPHON trial per primary source.",
            citationIDs: ["specialty_round28", "openfda_round28"]
        ),
        mechanism: AttributedProse(
            "Selective oral non-prostanoid agonist of prostacyclin (IP) receptor → activates same downstream signaling as endogenous prostacyclin → smooth muscle relaxation + pulmonary vasodilation + antiplatelet effects + antiproliferative.",
            citationIDs: ["openfda_round28"]
        ),
        dosing: [
            DosingBlock(label: "Initial", body: "200 mcg PO BID; titrate +200 mcg BID weekly based on tolerability to max 1,600 mcg BID per primary source.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Hepatic", body: "Moderate (Child-Pugh B) — start 200 mcg ONCE daily; titrate to max 1,600 mcg ONCE daily; severe (Child-Pugh C) avoid.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Maintenance", body: "Continue at maximum tolerated dose; if interrupted >3 days, restart titration.", citationIDs: ["openfda_round28"])
        ],
        contraindications: AttributedProse(
            "Severe hepatic impairment (Child-Pugh C); hypersensitivity.",
            citationIDs: ["openfda_round28"]
        ),
        warnings: [
            AttributedBullet("PVOD — pulmonary edema; discontinue.", citationIDs: ["openfda_round28"]),
            AttributedBullet("HYPOTENSION — uncommon but possible.", citationIDs: ["openfda_round28"]),
            AttributedBullet("GI side effects — HA, nausea, vomiting, diarrhea, jaw pain (prostacyclin class effect); dose-limiting in many patients.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Hyperthyroidism reported in PAH patients on selexipag.", citationIDs: ["openfda_round28"]),
            AttributedBullet("STRONG CYP2C8 inhibitors (gemfibrozil) — contraindicated; significantly increase selexipag levels.", citationIDs: ["openfda_round28"])
        ],
        adverseReactions: AttributedProse(
            "Headache, nausea, vomiting, diarrhea, jaw pain, myalgia, hot flush, arthralgia, anemia, decreased appetite, nasopharyngitis.",
            citationIDs: ["openfda_round28"]
        ),
        drugInteractions: [
            AttributedBullet("GEMFIBROZIL (strong CYP2C8 inhibitor) — CONTRAINDICATED.", citationIDs: ["openfda_round28"]),
            AttributedBullet("STRONG CYP2C8 inducers (rifampin) — reduce levels; may require dose adjustment.", citationIDs: ["openfda_round28"]),
            AttributedBullet("OTHER PAH therapies (ERAs, PDE5 inhibitors) — synergistic; combination therapy common; titrate carefully.", citationIDs: ["specialty_round28"])
        ],
        nursingImplications: [
            AttributedBullet("Slow weekly titration; patient counseled on tolerability vs benefit; max dose ≠ universal goal.", citationIDs: ["openfda_round28"]),
            AttributedBullet("BASELINE — BP, weight, PAH severity, hepatic function.", citationIDs: ["specialty_round28"]),
            AttributedBullet("GI side effect management — antiemetics, antidiarrheals, NSAIDs for jaw pain, acetaminophen for HA.", citationIDs: ["openrn_pharm_round28"]),
            AttributedBullet("Take with food may reduce GI symptoms.", citationIDs: ["openfda_round28"]),
            AttributedBullet("BP monitoring during titration; report symptomatic hypotension.", citationIDs: ["openrn_pharm_round28"]),
            AttributedBullet("Drug interaction screening — flag gemfibrozil + strong CYP2C8 inducers.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Hold + reduce dose if intolerable side effects.", citationIDs: ["openfda_round28"])
        ],
        patientTeaching: AttributedProse(
            "This pill helps PAH by acting like a natural blood vessel relaxer. Side effects (headache, nausea, jaw pain) are common — we'll start slow + work up to highest dose you can tolerate. Take with food. Tell us if side effects are too much; we can adjust. Carry list of all medications.",
            citationIDs: ["openrn_pharm_round28"]
        ),
        citations: [openfdaR28, openrnPharmR28, specialtyR28, ismpR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TreprostinilSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "treprostinil",
        title: "Treprostinil (Remodulin / Tyvaso / Orenitram)",
        subtitle: "Prostacyclin analog · SC/IV/inhaled/oral · PAH WHO Group 1 · SC pump infusion site reactions · NEVER abruptly stop (rebound)",
        category: "Prostacyclin analog — PAH (SC + IV + inhaled + oral)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Stable prostacyclin (PGI2) analog"),
            KeyValueRow(key: "Formulations", value: "Remodulin (SC + IV continuous infusion), Tyvaso (inhaled 4× daily), Orenitram (oral ER TID)"),
            KeyValueRow(key: "Use", value: "PAH WHO Group 1; severe / progressive disease; reduces NYHA functional class"),
            KeyValueRow(key: "Dose", value: "SC/IV start 1.25 ng/kg/min, titrate; inhaled start 18 mcg 4× daily, max 72 mcg; oral start 0.25 mg TID, max ~21 mg TID"),
            KeyValueRow(key: "Watch", value: "INFUSION SITE pain (SC) common; NEVER abrupt stop (rebound PH crisis); pump malfunction is emergency; bleeding risk; tachyphylaxis")
        ],
        indications: AttributedProse(
            "PAH WHO Group 1 — moderate to severe disease; reduces NYHA functional class + improves exercise capacity. SC + IV continuous infusion for severe; inhaled or oral for less severe per primary source.",
            citationIDs: ["specialty_round28", "openfda_round28"]
        ),
        mechanism: AttributedProse(
            "Stable analog of prostacyclin (PGI2) → direct pulmonary + systemic vasodilation + inhibition of platelet aggregation + antiproliferative effects on vascular smooth muscle. Acts via IP receptor → cAMP → smooth muscle relaxation.",
            citationIDs: ["openfda_round28"]
        ),
        dosing: [
            DosingBlock(label: "SC continuous (Remodulin)", body: "Start 1.25 ng/kg/min; if intolerable site reactions reduce to 0.625 ng/kg/min; titrate by 1.25 ng/kg/min weekly × 4 weeks, then 2.5 ng/kg/min weekly to clinical effect.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "IV continuous (Remodulin)", body: "Same dose as SC; preferred if SC site intolerable; requires central line + dedicated pump + infection risk.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Inhaled (Tyvaso)", body: "Initial 3 breaths (18 mcg) 4× during waking hours; titrate +3 breaths q1-2 weeks to max 9 breaths (54 mcg) 4× daily.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Oral ER (Orenitram)", body: "Initial 0.25 mg PO TID; titrate +0.25-0.5 mg TID q3-4 days as tolerated; max dose individualized (~21 mg TID).", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Hepatic", body: "Moderate-severe — start lower dose; severe — caution.", citationIDs: ["openfda_round28"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Oral Orenitram — severe hepatic impairment (Child-Pugh C).",
            citationIDs: ["openfda_round28"]
        ),
        warnings: [
            AttributedBullet("ABRUPT DISCONTINUATION — rebound PAH crisis; LIFE-THREATENING; transition / overlap with another therapy + slow taper.", citationIDs: ["specialty_round28"]),
            AttributedBullet("INFUSION PUMP MALFUNCTION — abrupt interruption can cause crisis; always have backup pump + medication.", citationIDs: ["specialty_round28"]),
            AttributedBullet("CENTRAL LINE INFECTIONS (IV) — bloodstream infection; sterile technique; line care education.", citationIDs: ["specialty_round28"]),
            AttributedBullet("SC INJECTION SITE REACTIONS — pain, erythema, induration; common dose-limiting; site rotation; topical lidocaine.", citationIDs: ["openfda_round28"]),
            AttributedBullet("BLEEDING — antiplatelet effect; caution with anticoagulants.", citationIDs: ["openfda_round28"]),
            AttributedBullet("HYPOTENSION — particularly during titration.", citationIDs: ["openfda_round28"]),
            AttributedBullet("PULMONARY EDEMA in PVOD — discontinue.", citationIDs: ["openfda_round28"]),
            AttributedBullet("GI side effects oral — nausea, diarrhea, jaw pain, headache.", citationIDs: ["openfda_round28"])
        ],
        adverseReactions: AttributedProse(
            "Injection site pain (SC), infusion site infection (IV), headache, diarrhea, nausea, jaw pain, hypotension, flushing, edema, dizziness, cough (inhaled), throat irritation (inhaled).",
            citationIDs: ["openfda_round28"]
        ),
        drugInteractions: [
            AttributedBullet("Hypotensive agents — additive; titrate.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Anticoagulants + antiplatelets — increased bleeding risk; monitor.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Diuretics + ACE-I/ARBs — additive hypotension.", citationIDs: ["openfda_round28"]),
            AttributedBullet("OTHER PAH therapies — synergistic; combination strategy.", citationIDs: ["specialty_round28"])
        ],
        nursingImplications: [
            AttributedBullet("HOME pump education ESSENTIAL — patient + family demo + return-demo; pump troubleshooting; backup supplies.", citationIDs: ["specialty_round28"]),
            AttributedBullet("SC site rotation — abdomen, thigh, upper arm; topical lidocaine; warm compresses for pain.", citationIDs: ["openrn_pharm_round28"]),
            AttributedBullet("IV CENTRAL LINE — sterile technique + dedicated lumen + chlorhexidine; bloodstream infection workup if fever.", citationIDs: ["specialty_round28"]),
            AttributedBullet("PUMP MALFUNCTION emergency plan — backup medication, backup pump, emergency contact 24/7, ED education card.", citationIDs: ["specialty_round28"]),
            AttributedBullet("NEVER interrupt abruptly — rebound PH crisis; if planned change, overlap with another therapy.", citationIDs: ["specialty_round28"]),
            AttributedBullet("Inhaled (Tyvaso) — nebulizer education; clean device; QID dosing schedule.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Oral (Orenitram) — TID dosing; food may reduce GI; counsel pill burden.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Daily weight + symptom log; report worsening dyspnea, syncope, bleeding.", citationIDs: ["openrn_pharm_round28"])
        ],
        patientTeaching: AttributedProse(
            "This medicine treats severe lung blood pressure. Never let your pump run out or stop — it can cause emergency. Carry backup pump + medication everywhere. SC site soreness — rotate sites, use lidocaine cream. IV line — keep clean, no fever-cause goes uninvestigated. Inhaled — 4 times daily, clean device. Tell every provider on this medicine.",
            citationIDs: ["openrn_pharm_round28"]
        ),
        citations: [openfdaR28, openrnPharmR28, specialtyR28, ismpR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum EpoprostenolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "epoprostenol",
        title: "Epoprostenol (Flolan / Veletri)",
        subtitle: "IV prostacyclin · gold standard for severe PAH · CONTINUOUS INFUSION ONLY · NEVER stop · central line + pump · short half-life",
        category: "Prostacyclin (PGI2) IV continuous — PAH severe",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic prostacyclin (PGI2) — vasodilator + antiplatelet"),
            KeyValueRow(key: "Use", value: "PAH WHO Group 1 — severe (NYHA III-IV); preferred for advanced PAH despite ERAs + PDE5 inhibitors"),
            KeyValueRow(key: "Dose", value: "Continuous IV via central line; initial 2 ng/kg/min; titrate by 2 ng/kg/min q15 min to clinical effect (usually 25-40 ng/kg/min)"),
            KeyValueRow(key: "Half-life", value: "3-5 minutes — ABRUPT interruption = rebound PH crisis + death; backup pump + medication essential"),
            KeyValueRow(key: "Watch", value: "Bloodstream infection from central line; abrupt discontinuation rebound; pump malfunction emergency; flushing + jaw pain dose-limiting")
        ],
        indications: AttributedProse(
            "PAH WHO Group 1 — severe (NYHA III-IV); used after maximally tolerated oral therapy fails OR as first-line for advanced disease; preferred parenteral for advanced PAH per primary source.",
            citationIDs: ["specialty_round28", "openfda_round28"]
        ),
        mechanism: AttributedProse(
            "Synthetic prostacyclin (PGI2) — endogenous lipid mediator; potent pulmonary + systemic vasodilator + platelet inhibitor + antiproliferative on vascular smooth muscle.",
            citationIDs: ["openfda_round28"]
        ),
        dosing: [
            DosingBlock(label: "Initial IV", body: "2 ng/kg/min continuous via central line; titrate +2 ng/kg/min q15 min based on clinical + hemodynamic response.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Maintenance", body: "Typically 25-40 ng/kg/min; titrate over weeks-months; individualized; chronic use 6+ months expected.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Reconstitution", body: "Flolan — reconstitute with diluent; thermal stability 8 hours room temperature OR 24 hours with cold packs; Veletri — thermal stability 8 hours at body temperature without cooling.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Discontinuation", body: "NEVER abrupt; overlap with another therapy; slow taper if discontinuing; coordinate with PAH center.", citationIDs: ["specialty_round28"])
        ],
        contraindications: AttributedProse(
            "Pulmonary veno-occlusive disease (severe pulmonary edema); chronic decompensated heart failure due to severe LV systolic dysfunction; hypersensitivity.",
            citationIDs: ["openfda_round28"]
        ),
        warnings: [
            AttributedBullet("ABRUPT DISCONTINUATION — life-threatening REBOUND PAH crisis; half-life only 3-5 minutes; coordinate transitions; backup pump + medication.", citationIDs: ["specialty_round28"]),
            AttributedBullet("CENTRAL LINE BLOODSTREAM INFECTION — major cause of death; sterile technique; chlorhexidine; education + line care; fever workup.", citationIDs: ["specialty_round28"]),
            AttributedBullet("PUMP MALFUNCTION emergency — backup pump + medication + emergency plan; family training.", citationIDs: ["specialty_round28"]),
            AttributedBullet("BLEEDING — antiplatelet effect; caution with anticoagulants.", citationIDs: ["openfda_round28"]),
            AttributedBullet("HYPOTENSION — particularly during titration.", citationIDs: ["openfda_round28"]),
            AttributedBullet("FLUSHING + JAW PAIN — dose-limiting for many patients.", citationIDs: ["openfda_round28"]),
            AttributedBullet("PVOD pulmonary edema — discontinue.", citationIDs: ["openfda_round28"]),
            AttributedBullet("DRUG INTERACTIONS — concurrent vasodilators / antihypertensives / anticoagulants additive.", citationIDs: ["openfda_round28"])
        ],
        adverseReactions: AttributedProse(
            "Flushing, headache, jaw pain, nausea, vomiting, diarrhea, hypotension, anxiety, chills, fever, bleeding, infection at line site, dizziness.",
            citationIDs: ["openfda_round28"]
        ),
        drugInteractions: [
            AttributedBullet("Hypotensive agents — additive.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Anticoagulants + antiplatelets — bleeding risk.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Diuretics + ACE-I/ARBs — additive hypotension.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Digoxin — increased levels reported.", citationIDs: ["openfda_round28"])
        ],
        nursingImplications: [
            AttributedBullet("PAH SPECIALTY CENTER initiation — refer; experienced team; education essential.", citationIDs: ["specialty_round28"]),
            AttributedBullet("CENTRAL LINE — sterile insertion; chlorhexidine site care; dedicated lumen NO other infusions; sterile technique for pump connections.", citationIDs: ["specialty_round28"]),
            AttributedBullet("HOME pump education — patient + 1 family/caregiver fully trained; demo + return-demo; troubleshooting; pump alarms.", citationIDs: ["specialty_round28"]),
            AttributedBullet("BACKUP equipment — pump, medication, infusion bag, alcohol pads always present.", citationIDs: ["specialty_round28"]),
            AttributedBullet("Emergency plan — pump malfunction → switch to backup pump within minutes; ED transport with patient's medication.", citationIDs: ["specialty_round28"]),
            AttributedBullet("Bloodstream infection workup — fever / chills emergent; blood cultures + line removal if catheter-related.", citationIDs: ["specialty_round28"]),
            AttributedBullet("Titration — hospital admission usually; q15 min increases; hemodynamic monitoring; right heart cath assessment.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Multidisciplinary — PAH specialist, pharmacist, nurse navigator, social worker; insurance + financial coordination.", citationIDs: ["specialty_round28"])
        ],
        patientTeaching: AttributedProse(
            "This is a life-saving continuous medicine for severe PAH. Your pump CANNOT stop — it has only minutes to keep working. Backup pump + medication + ice always with you. NEVER pull your central line. Tell every provider this is essential. Fever or chills are emergencies — call us. Sterile hand washing before all line care.",
            citationIDs: ["openrn_pharm_round28"]
        ),
        citations: [openfdaR28, openrnPharmR28, specialtyR28, ismpR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NintedanibSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "nintedanib",
        title: "Nintedanib (Ofev)",
        subtitle: "Tyrosine kinase inhibitor · IPF + chronic fibrosing ILD + scleroderma-ILD · slows FVC decline · DIARRHEA + LFTs · TERATOGEN",
        category: "Tyrosine kinase inhibitor — IPF + progressive ILD",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Tyrosine kinase inhibitor (TKI) — VEGFR + PDGFR + FGFR; antifibrotic"),
            KeyValueRow(key: "Use", value: "IPF (idiopathic pulmonary fibrosis); chronic fibrosing ILD with progressive phenotype (NSIP, fibrotic HP, sarcoidosis); scleroderma-associated ILD"),
            KeyValueRow(key: "Dose", value: "150 mg PO BID with food; reduce 100 mg BID for tolerability"),
            KeyValueRow(key: "Monitor", value: "LFTs baseline + monthly × 3 months → q3 months; weight, GI symptoms, pregnancy testing"),
            KeyValueRow(key: "Watch", value: "DIARRHEA most common (>60%) + dose-limiting; hepatotoxicity; teratogen; bleeding; cardiovascular events")
        ],
        indications: AttributedProse(
            "Idiopathic pulmonary fibrosis (IPF) — first-line antifibrotic; reduces rate of FVC decline. Chronic fibrosing interstitial lung disease with progressive phenotype (incl. fibrotic NSIP, HP, sarcoidosis-ILD). Scleroderma-associated ILD per primary source.",
            citationIDs: ["specialty_round28", "openfda_round28"]
        ),
        mechanism: AttributedProse(
            "Intracellular tyrosine kinase inhibitor — blocks vascular endothelial growth factor receptor (VEGFR), platelet-derived growth factor receptor (PDGFR), and fibroblast growth factor receptor (FGFR) signaling → reduces fibroblast proliferation + migration + differentiation → antifibrotic effect.",
            citationIDs: ["openfda_round28"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "150 mg PO BID with food; max 300 mg/day per primary source.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Tolerability", body: "Reduce to 100 mg BID for adverse effects; consider symptomatic management (loperamide for diarrhea); pause if needed.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Hepatic", body: "Mild (Child-Pugh A) — reduce to 100 mg BID; moderate-severe (Child-Pugh B-C) — avoid.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "ALT/AST elevation", body: "3-5× ULN — hold + monitor weekly; >5× ULN — discontinue.", citationIDs: ["openfda_round28"])
        ],
        contraindications: AttributedProse(
            "PREGNANCY (TERATOGEN); hypersensitivity. Caution — moderate-severe hepatic impairment; bleeding diathesis; recent MI; anticoagulant therapy.",
            citationIDs: ["openfda_round28"]
        ),
        warnings: [
            AttributedBullet("HEPATOTOXICITY — ALT/AST elevations common; baseline + monthly × 3 months → q3 months; reduce / discontinue for elevations.", citationIDs: ["openfda_round28"]),
            AttributedBullet("DIARRHEA — most common adverse effect (>60% of patients); dose-limiting; loperamide + hydration + dose reduction.", citationIDs: ["openfda_round28"]),
            AttributedBullet("EMBRYO-FETAL TOXICITY — major birth defects; contraception × 3 months after stopping.", citationIDs: ["openfda_round28"]),
            AttributedBullet("ARTERIAL THROMBOEMBOLISM — increased MI + stroke risk; caution with CV history.", citationIDs: ["openfda_round28"]),
            AttributedBullet("BLEEDING — increased risk; caution with anticoagulants + antiplatelets.", citationIDs: ["openfda_round28"]),
            AttributedBullet("GI perforation — uncommon; immediate eval for severe abdominal pain.", citationIDs: ["openfda_round28"]),
            AttributedBullet("HORMONAL CONTRACEPTIVES — possible decreased efficacy; non-hormonal preferred.", citationIDs: ["openfda_round28"]),
            AttributedBullet("STRONG CYP3A4 / P-gp inhibitors / inducers — adjust dose.", citationIDs: ["openfda_round28"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea (>60%), nausea, vomiting, decreased appetite, weight loss, abdominal pain, hepatic enzyme elevation, headache, dyspnea, fatigue, bleeding events.",
            citationIDs: ["openfda_round28"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 / P-gp inducers (rifampin, carbamazepine, phenytoin, St. John's wort) — avoid; significantly reduce nintedanib levels.", citationIDs: ["openfda_round28"]),
            AttributedBullet("STRONG CYP3A4 / P-gp inhibitors (ketoconazole, erythromycin) — caution; may increase nintedanib levels.", citationIDs: ["openfda_round28"]),
            AttributedBullet("ANTICOAGULANTS + ANTIPLATELETS — additive bleeding risk; monitor.", citationIDs: ["openfda_round28"]),
            AttributedBullet("PIRFENIDONE — antifibrotic combinations not recommended; ongoing studies.", citationIDs: ["specialty_round28"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — LFTs, weight, CBC, pregnancy test, contraception counseling.", citationIDs: ["specialty_round28"]),
            AttributedBullet("LFTs monthly × 3 months → q3 months; weight, GI symptoms, blood pressure at each visit.", citationIDs: ["openfda_round28"]),
            AttributedBullet("GI side effect management — TAKE WITH FOOD; loperamide PRN; small frequent meals; hydration; antiemetics; dose reduction if intolerable.", citationIDs: ["openrn_pharm_round28"]),
            AttributedBullet("Counsel — report yellow skin / eyes, dark urine, abdominal pain (hepatotoxicity); severe diarrhea; new bruising / bleeding.", citationIDs: ["openrn_pharm_round28"]),
            AttributedBullet("Contraception — non-hormonal preferred; continue × 3 months after stopping.", citationIDs: ["openfda_round28"]),
            AttributedBullet("CV history review — MI, stroke, anticoagulation; risk-benefit discussion.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Pulmonary follow-up — PFTs (FVC, DLCO) q3-6 months; 6-minute walk; SpO2; sx of progression.", citationIDs: ["specialty_round28"]),
            AttributedBullet("Drug interaction screening — flag CYP3A4 + P-gp affecters; medication reconciliation each visit.", citationIDs: ["openfda_round28"])
        ],
        patientTeaching: AttributedProse(
            "This medicine slows the scarring in your lungs. Take with food twice daily. Diarrhea is common — drink fluids, use Imodium, eat small meals. Watch for yellow eyes / dark urine — call us. Use non-hormonal birth control + 3 months after stopping. Get bloodwork checked monthly to start. Continue PAH center follow-up.",
            citationIDs: ["openrn_pharm_round28"]
        ),
        citations: [openfdaR28, openrnPharmR28, specialtyR28, ismpR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum RoflumilastSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "roflumilast",
        title: "Roflumilast (Daliresp)",
        subtitle: "Selective PDE-4 inhibitor · severe COPD with chronic bronchitis + exacerbations · NOT a bronchodilator · weight loss + psych warnings",
        category: "Phosphodiesterase-4 (PDE4) inhibitor — COPD",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective phosphodiesterase-4 (PDE4) inhibitor — anti-inflammatory"),
            KeyValueRow(key: "Use", value: "Severe COPD with chronic bronchitis + history of exacerbations to REDUCE exacerbation risk (NOT a bronchodilator; not for acute relief)"),
            KeyValueRow(key: "Dose", value: "Start 250 mcg PO daily × 4 weeks → 500 mcg PO daily; max 500 mcg/day"),
            KeyValueRow(key: "Monitor", value: "Weight, mood, GI side effects, sleep"),
            KeyValueRow(key: "Watch", value: "WEIGHT LOSS (uncomplicated 6-9 lbs avg); psychiatric — depression + suicidality; NOT for acute bronchospasm")
        ],
        indications: AttributedProse(
            "Severe COPD with chronic bronchitis + history of exacerbations — to reduce risk of exacerbations; ADJUNCT to inhaled bronchodilators. Not for acute relief per primary source.",
            citationIDs: ["specialty_round28", "openfda_round28"]
        ),
        mechanism: AttributedProse(
            "Selective inhibitor of phosphodiesterase-4 (PDE4) → increases intracellular cAMP in inflammatory cells (neutrophils, eosinophils, T cells, fibroblasts) → reduces inflammatory mediators + oxidative stress + smooth muscle proliferation → anti-inflammatory effect (not bronchodilator).",
            citationIDs: ["openfda_round28"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "Initial 250 mcg PO daily × 4 weeks (reduces tolerability issues) → 500 mcg PO daily maintenance per primary source.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Hepatic", body: "Moderate-severe (Child-Pugh B + C) — avoid.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Renal", body: "No adjustment.", citationIDs: ["openfda_round28"])
        ],
        contraindications: AttributedProse(
            "Moderate-severe hepatic impairment (Child-Pugh B + C); hypersensitivity.",
            citationIDs: ["openfda_round28"]
        ),
        warnings: [
            AttributedBullet("PSYCHIATRIC effects — insomnia, anxiety, depression, suicidal thoughts + behavior; counsel + monitor; discontinue if severe.", citationIDs: ["openfda_round28"]),
            AttributedBullet("WEIGHT LOSS — common (6-9 lbs average); monitor weight; consider nutrition support; discontinue if severe.", citationIDs: ["openfda_round28"]),
            AttributedBullet("GI side effects — diarrhea, nausea, abdominal pain, headache; typically resolve in 4-12 weeks; dose-limiting.", citationIDs: ["openfda_round28"]),
            AttributedBullet("NOT a bronchodilator + NOT for acute bronchospasm; ADD-ON only.", citationIDs: ["specialty_round28"]),
            AttributedBullet("STRONG CYP3A4 INDUCERS reduce roflumilast levels; STRONG CYP3A4 inhibitors increase levels.", citationIDs: ["openfda_round28"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, weight loss, nausea, headache, back pain, influenza, insomnia, dizziness, depressive symptoms, decreased appetite.",
            citationIDs: ["openfda_round28"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 inducers (rifampin, carbamazepine, phenytoin, phenobarbital) — avoid concurrent; significantly reduce roflumilast.", citationIDs: ["openfda_round28"]),
            AttributedBullet("STRONG CYP1A2 + CYP3A4 inhibitors (fluvoxamine, cimetidine, ciprofloxacin, enoxacin) — increase roflumilast levels; monitor for ADRs.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Albuterol + ipratropium + ICS — compatible (used together for COPD).", citationIDs: ["openfda_round28"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — weight, BMI, mental health screening, current COPD therapy.", citationIDs: ["specialty_round28"]),
            AttributedBullet("FOLLOW-UP — weight q month × 3 months → q3 months; PHQ-2 / PHQ-9 mood screen; functional status.", citationIDs: ["specialty_round28"]),
            AttributedBullet("Counsel — start 250 mcg × 4 weeks improves tolerability; GI symptoms typically improve.", citationIDs: ["openrn_pharm_round28"]),
            AttributedBullet("Take with or without food; consistent timing.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Mood + suicidality — counsel patient + family to monitor + report; emergent contact for severe.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Continue inhalers — roflumilast is ADD-ON; emergency albuterol always.", citationIDs: ["specialty_round28"]),
            AttributedBullet("Smoking cessation paramount; pulmonary rehab; vaccinations.", citationIDs: ["specialty_round28"])
        ],
        patientTeaching: AttributedProse(
            "This pill reduces flare-ups in severe COPD. NOT for sudden breathing — keep your rescue inhaler. Take daily; we start low for 4 weeks. Some weight loss is common. Tell us if you feel depressed, have thoughts of self-harm, or sleep problems. Continue smoking cessation + flu/pneumonia shots.",
            citationIDs: ["openrn_pharm_round28"]
        ),
        citations: [openfdaR28, openrnPharmR28, specialtyR28, ismpR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TezepelumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tezepelumab",
        title: "Tezepelumab (Tezspire)",
        subtitle: "Anti-TSLP monoclonal · severe asthma regardless of phenotype · SC q4 weeks · BROAD asthma biologic · adolescent + adult",
        category: "Anti-TSLP biologic — severe asthma (any phenotype)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Human monoclonal antibody against thymic stromal lymphopoietin (TSLP) — upstream alarmin"),
            KeyValueRow(key: "Use", value: "Severe asthma in patients ≥12 years; reduces exacerbations regardless of phenotype (eosinophilic OR non-eosinophilic, allergic OR non-allergic)"),
            KeyValueRow(key: "Dose", value: "210 mg SC every 4 weeks (adult + adolescent ≥12 years)"),
            KeyValueRow(key: "Monitor", value: "Symptoms, FEV1, exacerbation frequency, hypersensitivity reactions"),
            KeyValueRow(key: "Watch", value: "Broadest biologic — works in all phenotypes; injection site reactions; rare hypersensitivity; parasitic infection screening (helminthiasis)")
        ],
        indications: AttributedProse(
            "Add-on maintenance treatment for severe asthma in patients ≥12 years — uncontrolled despite ICS + LABA / long-acting bronchodilator therapy; first asthma biologic effective REGARDLESS of phenotype (eosinophilic OR non-eosinophilic, allergic OR non-allergic) per NAVIGATOR trial per primary source.",
            citationIDs: ["specialty_round28", "openfda_round28"]
        ),
        mechanism: AttributedProse(
            "Human monoclonal IgG2λ antibody against thymic stromal lymphopoietin (TSLP) — an epithelial-derived 'alarmin' upstream of multiple inflammatory pathways (Th2, Th17, eosinophilic, mast cells). Blocks TSLP → broad suppression of asthma inflammation across phenotypes.",
            citationIDs: ["openfda_round28"]
        ),
        dosing: [
            DosingBlock(label: "Adult + adolescent (≥12 years)", body: "210 mg SC every 4 weeks; subcutaneous administration in thigh, abdomen, or upper arm per primary source.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Self-administration", body: "Pre-filled syringe + auto-injector approved; patient training + return-demo.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Renal / hepatic", body: "No dose adjustment.", citationIDs: ["openfda_round28"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to tezepelumab or any component.",
            citationIDs: ["openfda_round28"]
        ),
        warnings: [
            AttributedBullet("HYPERSENSITIVITY — rare but possible; anaphylaxis; discontinue if severe.", citationIDs: ["openfda_round28"]),
            AttributedBullet("INJECTION site reactions — local erythema, swelling, pain; rotate sites.", citationIDs: ["openfda_round28"]),
            AttributedBullet("NOT for acute bronchospasm or status asthmaticus.", citationIDs: ["openfda_round28"]),
            AttributedBullet("DO NOT abruptly stop ICS + LABA — tezepelumab is add-on; continue maintenance therapy.", citationIDs: ["openfda_round28"]),
            AttributedBullet("PARASITIC INFECTIONS (helminth) — treat pre-existing before initiation; screen high-risk patients.", citationIDs: ["openfda_round28"]),
            AttributedBullet("LIVE VACCINES — avoid during therapy; data limited.", citationIDs: ["specialty_round28"]),
            AttributedBullet("PREGNANCY — limited data; risk-benefit; pregnancy registry encouraged.", citationIDs: ["openfda_round28"])
        ],
        adverseReactions: AttributedProse(
            "Pharyngitis, arthralgia, back pain, injection site reactions, hypersensitivity reactions (rare).",
            citationIDs: ["openfda_round28"]
        ),
        drugInteractions: [
            AttributedBullet("LIVE VACCINES — avoid during therapy.", citationIDs: ["openfda_round28"]),
            AttributedBullet("OTHER asthma biologics — limited data; generally not combined.", citationIDs: ["specialty_round28"]),
            AttributedBullet("ICS + LABA + LAMA — compatible; continue maintenance.", citationIDs: ["openfda_round28"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — asthma severity (FEV1, exacerbation history), allergies, vaccination status, parasitic screening if at-risk.", citationIDs: ["specialty_round28"]),
            AttributedBullet("First few doses in clinic — observe for hypersensitivity; subsequent home administration after training.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Patient education — SC technique; site rotation; refrigeration (2-8°C); allow 30 min to warm to room temperature before injection.", citationIDs: ["openrn_pharm_round28"]),
            AttributedBullet("CONTINUE ICS + LABA + LAMA + rescue albuterol; tezepelumab is ADD-ON.", citationIDs: ["specialty_round28"]),
            AttributedBullet("Track exacerbations + ED visits + steroid bursts; FEV1 q3-6 months; benefit takes weeks-months.", citationIDs: ["specialty_round28"]),
            AttributedBullet("Discard if frozen or expired; protect from light.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Counsel — not for acute attacks; emergency albuterol always.", citationIDs: ["openrn_pharm_round28"])
        ],
        patientTeaching: AttributedProse(
            "This shot helps severe asthma by blocking a chemical that triggers inflammation. Take every 4 weeks. Keep using your daily inhaler + rescue inhaler — this is an addition. Tell us about reactions at the shot site, breathing problems, or allergic reactions. Store in fridge; warm up before injecting. Skip live vaccines during treatment.",
            citationIDs: ["openrn_pharm_round28"]
        ),
        citations: [openfdaR28, openrnPharmR28, specialtyR28, ismpR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BenralizumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "benralizumab",
        title: "Benralizumab (Fasenra)",
        subtitle: "Anti-IL5R · eosinophilic asthma · q8 weeks dosing · depletes eosinophils via ADCC · EGPA + HES indications",
        category: "Anti-IL-5 receptor biologic — eosinophilic asthma + EGPA + HES",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Humanized monoclonal antibody against IL-5 receptor α (IL-5Rα) on eosinophils + basophils"),
            KeyValueRow(key: "Use", value: "Severe eosinophilic asthma (≥150 cells/μL); eosinophilic granulomatosis with polyangiitis (EGPA); hypereosinophilic syndrome (HES)"),
            KeyValueRow(key: "Dose", value: "Asthma: 30 mg SC at weeks 0, 4, 8 → q8 weeks thereafter; EGPA: 30 mg SC monthly"),
            KeyValueRow(key: "Monitor", value: "Eosinophil count, asthma exacerbations, hypersensitivity"),
            KeyValueRow(key: "Watch", value: "Depletes eosinophils via ADCC (antibody-dependent cellular cytotoxicity); hypersensitivity; q8 weeks (less frequent than mepolizumab)")
        ],
        indications: AttributedProse(
            "Severe eosinophilic asthma (≥12 years) with peripheral eosinophilia ≥150 cells/μL — add-on to high-dose ICS + LABA. EGPA + hypereosinophilic syndrome (HES). Q8 weeks maintenance dosing per primary source.",
            citationIDs: ["specialty_round28", "openfda_round28"]
        ),
        mechanism: AttributedProse(
            "Humanized monoclonal IgG1κ antibody against IL-5 receptor α (IL-5Rα) on eosinophils + basophils. Direct binding → antibody-dependent cellular cytotoxicity (ADCC) via NK cells → rapid eosinophil depletion (within hours; sustained for months). Reduces eosinophilic inflammation in asthma.",
            citationIDs: ["openfda_round28"]
        ),
        dosing: [
            DosingBlock(label: "Asthma maintenance", body: "30 mg SC at weeks 0, 4, 8 (loading) → 30 mg SC every 8 weeks thereafter per primary source.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "EGPA", body: "30 mg SC monthly (every 4 weeks).", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "HES", body: "30 mg SC monthly.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Self-administration", body: "Pre-filled syringe + auto-injector approved; patient training.", citationIDs: ["openfda_round28"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to benralizumab.",
            citationIDs: ["openfda_round28"]
        ),
        warnings: [
            AttributedBullet("HYPERSENSITIVITY — anaphylaxis rare; discontinue.", citationIDs: ["openfda_round28"]),
            AttributedBullet("INJECTION site reactions — common; rotate sites.", citationIDs: ["openfda_round28"]),
            AttributedBullet("NOT for acute bronchospasm or status asthmaticus.", citationIDs: ["openfda_round28"]),
            AttributedBullet("PARASITIC infections (helminth) — eosinophils mediate immunity; treat pre-existing; screen high-risk.", citationIDs: ["openfda_round28"]),
            AttributedBullet("ICS WEAN — do not abruptly discontinue ICS; gradual taper after asthma control.", citationIDs: ["openfda_round28"]),
            AttributedBullet("PREGNANCY — limited data; risk-benefit.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Vaccinations — live vaccines avoided during therapy.", citationIDs: ["specialty_round28"])
        ],
        adverseReactions: AttributedProse(
            "Headache, pharyngitis, fever, hypersensitivity reactions, injection site reactions.",
            citationIDs: ["openfda_round28"]
        ),
        drugInteractions: [
            AttributedBullet("LIVE VACCINES — avoid; data limited.", citationIDs: ["openfda_round28"]),
            AttributedBullet("OTHER asthma biologics (mepolizumab, omalizumab, tezepelumab) — limited combination data; usually not combined.", citationIDs: ["specialty_round28"]),
            AttributedBullet("ICS + LABA + LAMA — compatible add-on.", citationIDs: ["openfda_round28"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — peripheral eosinophil count, asthma severity, vaccination status, parasitic screening.", citationIDs: ["specialty_round28"]),
            AttributedBullet("First doses in clinic — observe hypersensitivity; subsequent home administration if appropriate.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Q8 WEEK convenient dosing (asthma maintenance) — track schedule.", citationIDs: ["specialty_round28"]),
            AttributedBullet("CONTINUE asthma maintenance — ICS, LABA, LAMA, rescue albuterol.", citationIDs: ["specialty_round28"]),
            AttributedBullet("Track exacerbations + ED visits + steroid bursts; eosinophil depletion within hours; clinical response over weeks-months.", citationIDs: ["specialty_round28"]),
            AttributedBullet("Storage — refrigerate 2-8°C; protect from light; bring to room temperature before injection.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Patient education — SC technique; site rotation.", citationIDs: ["openrn_pharm_round28"]),
            AttributedBullet("Counsel — not for acute attacks; rescue inhaler always.", citationIDs: ["openrn_pharm_round28"])
        ],
        patientTeaching: AttributedProse(
            "This shot treats severe asthma + EGPA by removing the inflammation cells. Take every 8 weeks once stable. Keep your daily + rescue inhalers. Tell us about allergic reactions, breathing problems, new infections. Store in fridge; warm before injecting.",
            citationIDs: ["openrn_pharm_round28"]
        ),
        citations: [openfdaR28, openrnPharmR28, specialtyR28, ismpR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TrikaftaSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "elexacaftor-tezacaftor-ivacaftor",
        title: "Elexacaftor / tezacaftor / ivacaftor (Trikafta / Kaftrio)",
        subtitle: "CFTR triple modulator · revolutionary for CF · ≥80% of CF patients (≥1 F508del) · LFTs + cataracts · transformative outcomes",
        category: "CFTR modulator triple combination — cystic fibrosis",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Triple CFTR modulator: elexacaftor (CFTR corrector type 3) + tezacaftor (CFTR corrector type 1) + ivacaftor (CFTR potentiator)"),
            KeyValueRow(key: "Use", value: "Cystic fibrosis in patients ≥2 years with ≥1 F508del mutation OR responsive mutations (~80%+ of CF patients)"),
            KeyValueRow(key: "Dose", value: "Adult: 2 tablets PO morning (elexacaftor 100/tezacaftor 50/ivacaftor 75) + ivacaftor 150 PO evening; pediatric weight-based"),
            KeyValueRow(key: "Monitor", value: "LFTs at baseline + monthly × 3 months → q3 months; ophthalmologic exam in pediatric (cataracts); BP"),
            KeyValueRow(key: "Watch", value: "TRANSFORMATIVE outcomes — FEV1 ↑10-15%, exacerbations ↓~70%; LFTs; cataracts in peds; CYP3A4 interactions")
        ],
        indications: AttributedProse(
            "Cystic fibrosis in patients ≥2 years with at least one F508del CFTR mutation OR responsive mutations per FDA labeling. Improves FEV1, reduces sweat chloride, decreases exacerbations + improves BMI + transforms long-term outcomes per primary source.",
            citationIDs: ["specialty_round28", "openfda_round28"]
        ),
        mechanism: AttributedProse(
            "Triple combination — elexacaftor + tezacaftor (correctors) facilitate CFTR protein folding + trafficking to cell surface; ivacaftor (potentiator) increases CFTR channel open probability. Restores chloride + bicarbonate transport → improved mucociliary clearance + sweat chloride reduction.",
            citationIDs: ["openfda_round28"]
        ),
        dosing: [
            DosingBlock(label: "Adult + pediatric ≥12 years", body: "2 fixed-dose combination tablets (elexacaftor 100 mg / tezacaftor 50 mg / ivacaftor 75 mg) PO morning WITH FAT-CONTAINING FOOD + 1 ivacaftor 150 mg PO ~12 hours later (evening).", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Pediatric 6-12 years", body: "Weight-based ≥30 kg = same as adult; <30 kg = smaller combination tablets.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Pediatric 2-5 years", body: "Granule formulation weight-based per FDA labeling.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Hepatic", body: "Mild (Child-Pugh A) — no adjustment; moderate (Child-Pugh B) — reduce dose + interval; severe (Child-Pugh C) — avoid.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Concurrent CYP3A inducers / inhibitors", body: "Adjust dose / frequency per FDA labeling (e.g., once daily ½ dose with strong inhibitors).", citationIDs: ["openfda_round28"])
        ],
        contraindications: AttributedProse(
            "Severe hepatic impairment (Child-Pugh C); hypersensitivity to components.",
            citationIDs: ["openfda_round28"]
        ),
        warnings: [
            AttributedBullet("HEPATOTOXICITY — ALT/AST elevations common; baseline + monthly × 3 months → q3 months × first year → annual; reduce / hold for elevations >3-5× ULN.", citationIDs: ["openfda_round28"]),
            AttributedBullet("CATARACTS — pediatric population; baseline + annual ophthalmologic exam.", citationIDs: ["openfda_round28"]),
            AttributedBullet("HYPERSENSITIVITY — rash, angioedema, anaphylaxis rare; discontinue.", citationIDs: ["openfda_round28"]),
            AttributedBullet("HYPOGLYCEMIA — anecdotal in CF-related diabetes (CFRD) patients; monitor glucose.", citationIDs: ["openfda_round28"]),
            AttributedBullet("CYP3A INDUCERS — significantly reduce levels; avoid strong inducers (rifampin, St. John's wort).", citationIDs: ["openfda_round28"]),
            AttributedBullet("CYP3A INHIBITORS — significantly increase levels; reduce dose / frequency.", citationIDs: ["openfda_round28"]),
            AttributedBullet("PREGNANCY — limited data; ongoing pregnancy registry; outcomes generally favorable.", citationIDs: ["specialty_round28"]),
            AttributedBullet("CONTINUE CF MAINTENANCE — airway clearance, pancreatic enzymes, vitamins, mucolytics; CFTR modulator does NOT replace.", citationIDs: ["specialty_round28"])
        ],
        adverseReactions: AttributedProse(
            "Headache, upper respiratory tract infection, abdominal pain, diarrhea, nausea, increased liver enzymes, hypersensitivity, rash.",
            citationIDs: ["openfda_round28"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A INDUCERS (rifampin, carbamazepine, phenytoin, phenobarbital, St. John's wort) — AVOID; significantly reduce levels.", citationIDs: ["openfda_round28"]),
            AttributedBullet("STRONG CYP3A INHIBITORS (ketoconazole, itraconazole, posaconazole, voriconazole, clarithromycin, ritonavir) — reduce dose to 2 tablets twice weekly + skip evening ivacaftor per FDA labeling.", citationIDs: ["openfda_round28"]),
            AttributedBullet("MODERATE CYP3A INHIBITORS (fluconazole, erythromycin) — once daily morning combination; skip evening ivacaftor.", citationIDs: ["openfda_round28"]),
            AttributedBullet("GRAPEFRUIT — moderate CYP3A inhibitor; avoid.", citationIDs: ["openfda_round28"]),
            AttributedBullet("DIGOXIN + warfarin + other CYP3A substrates — may need monitoring.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Other CFTR modulators (lumacaftor, ivacaftor monotherapy) — not combined.", citationIDs: ["specialty_round28"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — LFTs, ophthalmologic (peds), pulmonary function (FEV1), sweat chloride, BMI, mutation analysis.", citationIDs: ["specialty_round28"]),
            AttributedBullet("LFTs monthly × first 3 months → q3 months × first year → annual; reduce / hold for elevations.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Pediatric — baseline + annual eye exams (cataract surveillance).", citationIDs: ["openfda_round28"]),
            AttributedBullet("Dosing — MUST take with FAT-containing food (eggs, butter, whole milk, peanut butter); separate AM + PM doses ~12 hours.", citationIDs: ["openrn_pharm_round28"]),
            AttributedBullet("Drug interaction screening — extensive CYP3A interactions; medication reconciliation each visit.", citationIDs: ["openfda_round28"]),
            AttributedBullet("CONTINUE CF MAINTENANCE — airway clearance, dornase alfa, hypertonic saline, pancreatic enzymes, ADEK vitamins, salt/calories.", citationIDs: ["specialty_round28"]),
            AttributedBullet("Track outcomes — FEV1, BMI, exacerbations, hospitalizations; benefit dramatic within months.", citationIDs: ["specialty_round28"]),
            AttributedBullet("Multidisciplinary CF center care; insurance coordination; ongoing CFTR mutation testing for eligibility.", citationIDs: ["specialty_round28"])
        ],
        patientTeaching: AttributedProse(
            "This is a transformative medicine for cystic fibrosis. Take 2 morning pills with a fatty meal + 1 evening pill 12 hours later. KEEP doing your airway clearance, enzymes, vitamins, hypertonic saline — this doesn't replace them. Tell us about yellow eyes/skin, stomach pain. Get bloodwork every month at first. Kids need eye exams. Avoid grapefruit.",
            citationIDs: ["openrn_pharm_round28"]
        ),
        citations: [openfdaR28, openrnPharmR28, specialtyR28, ismpR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TheophyllineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "theophylline",
        title: "Theophylline",
        subtitle: "Methylxanthine · narrow therapeutic index 10-20 mcg/mL · COPD third-line · INTERACTIONS + toxicity · monitor levels",
        category: "Methylxanthine bronchodilator + anti-inflammatory — narrow therapeutic index",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Methylxanthine — phosphodiesterase inhibitor + adenosine receptor antagonist + anti-inflammatory"),
            KeyValueRow(key: "Use", value: "COPD third-line / chronic asthma adjunct (largely replaced by inhaled therapies); rarely used now"),
            KeyValueRow(key: "Dose", value: "300-600 mg PO daily; titrate to therapeutic level 10-20 mcg/mL; lower for elderly + comorbidities"),
            KeyValueRow(key: "Monitor", value: "Theophylline level 5 days post initiation + after dose changes; LFTs; HR + rhythm"),
            KeyValueRow(key: "Watch", value: "NARROW therapeutic index; toxicity arrhythmias + seizures; many drug interactions; smoking + cirrhosis affect clearance")
        ],
        indications: AttributedProse(
            "COPD third-line treatment (after inhaled therapies); chronic asthma adjunct in some cases; bradyarrhythmias in some critical care. Largely replaced by inhaled bronchodilators + biologics per primary source.",
            citationIDs: ["specialty_round28", "openfda_round28"]
        ),
        mechanism: AttributedProse(
            "Methylxanthine — nonselective phosphodiesterase inhibitor → increased cAMP → bronchodilation + anti-inflammatory effects. Adenosine receptor antagonist (A1 + A2) → CNS stimulation + bronchodilation + diuresis. Histone deacetylase activator → anti-inflammatory.",
            citationIDs: ["openfda_round28"]
        ),
        dosing: [
            DosingBlock(label: "Adult oral", body: "Initial 300 mg PO daily divided BID; titrate based on theophylline level + clinical response; max 600 mg/day per primary source.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Therapeutic level", body: "10-20 mcg/mL (some sources 5-15); narrow therapeutic index; toxicity ≥20 mcg/mL.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Renal / hepatic", body: "Hepatic impairment — reduce dose; CrCl <10 mL/min — caution; smokers clear faster (need higher dose); cirrhosis + CHF clear slower.", citationIDs: ["openfda_round28"]),
            DosingBlock(label: "Loading", body: "5-6 mg/kg IV bolus (over 30 min) followed by infusion 0.5-0.7 mg/kg/hr in critical care (rare).", citationIDs: ["openfda_round28"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; seizure disorders; cardiac arrhythmias requiring caution; severe hepatic impairment.",
            citationIDs: ["openfda_round28"]
        ),
        warnings: [
            AttributedBullet("BLACK BOX — narrow therapeutic index; ARRHYTHMIAS + SEIZURES with toxicity.", citationIDs: ["openfda_round28"]),
            AttributedBullet("LEVELS >20 mcg/mL — nausea, vomiting, HA, tachyarrhythmias.", citationIDs: ["openfda_round28"]),
            AttributedBullet("LEVELS >30 mcg/mL — life-threatening — seizures, ventricular arrhythmias, hypotension.", citationIDs: ["openfda_round28"]),
            AttributedBullet("DRUG INTERACTIONS — extensive CYP1A2 + CYP3A4 substrate; many drugs affect clearance.", citationIDs: ["openfda_round28"]),
            AttributedBullet("SMOKING — increases clearance by ~50%; cessation increases levels rapidly.", citationIDs: ["openfda_round28"]),
            AttributedBullet("CIRRHOSIS + CHF + sepsis + fever + viral illness — decrease clearance; reduce dose.", citationIDs: ["openfda_round28"]),
            AttributedBullet("PREGNANCY — Category C; risk-benefit.", citationIDs: ["openfda_round28"]),
            AttributedBullet("ELDERLY + critically ill — increased toxicity risk; lower doses; closer monitoring.", citationIDs: ["openfda_round28"]),
            AttributedBullet("HYPOKALEMIA + hyperglycemia + hypomagnesemia — risk in toxicity.", citationIDs: ["openfda_round28"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting, headache, tremor, insomnia, tachycardia, supraventricular tachycardia, atrial fibrillation, palpitations, hypokalemia, hyperglycemia, seizures (toxicity).",
            citationIDs: ["openfda_round28"]
        ),
        drugInteractions: [
            AttributedBullet("INCREASE LEVELS (decrease clearance) — cimetidine, ciprofloxacin, erythromycin, clarithromycin, fluconazole, allopurinol, propranolol, oral contraceptives — DOSE REDUCE.", citationIDs: ["openfda_round28"]),
            AttributedBullet("DECREASE LEVELS (increase clearance) — rifampin, carbamazepine, phenytoin, phenobarbital, ritonavir, smoking, charcoal-broiled meats — DOSE INCREASE.", citationIDs: ["openfda_round28"]),
            AttributedBullet("CAFFEINE additive stimulation; counsel reduction.", citationIDs: ["openfda_round28"]),
            AttributedBullet("ADENOSINE — theophylline antagonizes adenosine (counteracts effects in SVT cardioversion).", citationIDs: ["openfda_round28"]),
            AttributedBullet("DIGOXIN + lithium + warfarin — monitor for altered levels.", citationIDs: ["openfda_round28"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — LFTs, weight, smoking status, comorbidities, medications, theophylline level if reinstating.", citationIDs: ["specialty_round28"]),
            AttributedBullet("LEVEL monitoring — 5 days after starting / dose change; trough 30 min before next dose; symptomatic levels.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Toxicity SIGNS — nausea, vomiting, HA, tremor, palpitations, tachycardia, agitation.", citationIDs: ["openfda_round28"]),
            AttributedBullet("DRUG INTERACTION screening — extensive; pharmacy review at every change.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Smoking history + cessation — IMPORTANT to adjust dose.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Toxicity TREATMENT — activated charcoal, supportive, anticonvulsants for seizures, beta-blockers for arrhythmias, charcoal hemoperfusion for severe.", citationIDs: ["openfda_round28"]),
            AttributedBullet("Counsel — consistent timing, no double doses, missed dose if soon; report nausea / palpitations.", citationIDs: ["openrn_pharm_round28"]),
            AttributedBullet("LARGELY REPLACED by inhaled bronchodilators + biologics; reserved for refractory.", citationIDs: ["specialty_round28"])
        ],
        patientTeaching: AttributedProse(
            "This medicine treats your COPD by relaxing airways. We check blood levels — too high causes problems. Take consistently; tell us about all medications + smoking changes. Watch for nausea, fast heartbeat, tremor, anxiety — call us. Don't drink lots of caffeine. Get bloodwork as ordered.",
            citationIDs: ["openrn_pharm_round28"]
        ),
        citations: [openfdaR28, openrnPharmR28, specialtyR28, ismpR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}
