import Foundation

// Curator-model procedures + reference (round 15).

private let openrnPRR15 = CitationSource(
    id: "openrn_pr_round15",
    shortName: "Open RN Health Alterations + Mental Health + Fundamentals",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-04"
)
private let specialtyPRR15 = CitationSource(
    id: "specialty_pr_round15",
    shortName: "AAO / SAMHSA / CDC / IDSA / Endocrine Society guidance (concept citation)",
    publisher: "AAO · SAMHSA · CDC · IDSA · Endocrine Society",
    license: .factCitationOnly,
    url: "https://www.cdc.gov/antibiotic-use/clinicians/index.html",
    lastRetrieved: "2026-05-04"
)

private let procTagsR15 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)
private let refTagsR15 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

public enum TonometrySample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "tonometry",
        title: "Tonometry (intraocular pressure measurement)",
        subtitle: "Goldmann applanation gold standard · normal 10–21 mmHg · glaucoma surveillance",
        nclexTags: procTagsR15,
        indications: AttributedProse(
            "Measurement of intraocular pressure (IOP) to detect, monitor, and manage glaucoma + ocular hypertension. Normal IOP 10–21 mmHg. Goldmann applanation tonometry (slit-lamp mounted) is gold standard; rebound, air-puff, and iCare alternatives per primary source.",
            citationIDs: ["specialty_pr_round15"]
        ),
        contraindications: AttributedProse(
            "Active corneal infection / ulceration / abrasion (Goldmann applanation). Use rebound tonometry as alternative. Recent eye surgery / globe rupture — defer until cleared by ophthalmology.",
            citationIDs: ["openrn_pr_round15"]
        ),
        equipment: [
            AttributedBullet("Slit-lamp + Goldmann tonometer prism (or rebound iCare device or air-puff non-contact tonometer).", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Topical anesthetic (proparacaine) + fluorescein dye for Goldmann applanation.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Disposable probes (rebound) or disinfected prism per facility infection-control policy.", citationIDs: ["specialty_pr_round15"])
        ],
        preProcedure: [
            AttributedBullet("Patient education — brief, painless touch on eye; sit at slit lamp.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Remove contact lenses before testing.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Note recent caffeine + Valsalva — can transiently increase IOP.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Document time of day — diurnal variation; IOP often higher AM.", citationIDs: ["specialty_pr_round15"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Position", body: "Patient seated at slit lamp; chin in rest, forehead against bar.", citationIDs: ["openrn_pr_round15"]),
            ProcedureStep(number: 2, title: "Anesthetize + stain", body: "Instill topical anesthetic + fluorescein dye.", citationIDs: ["openrn_pr_round15"]),
            ProcedureStep(number: 3, title: "Apply tonometer", body: "Goldmann tonometer prism gently touches cornea; clinician views fluorescein semicircles + adjusts knob until they meet — pressure reading obtained per primary source.", citationIDs: ["specialty_pr_round15"]),
            ProcedureStep(number: 4, title: "Alternative methods", body: "Rebound (iCare) — handheld, brief touch with disposable probe, no anesthetic. Air-puff non-contact — quick puff, less accurate, screening use.", citationIDs: ["specialty_pr_round15"]),
            ProcedureStep(number: 5, title: "Document", body: "Both eyes IOP, time of day, technique, central corneal thickness (CCT) if available, patient cooperation.", citationIDs: ["openrn_pr_round15"])
        ],
        postProcedure: [
            AttributedBullet("Counsel — no rubbing eyes for 30 min while anesthetic in effect (corneal abrasion risk).", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Mild blurring possible; clears in minutes.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Schedule follow-up if IOP elevated; ophthalmology referral.", citationIDs: ["openrn_pr_round15"])
        ],
        documentation: [
            AttributedBullet("IOP both eyes, technique, time of day, CCT if available, technician + provider.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Symptoms reported during procedure; ophthalmology consult if abnormal.", citationIDs: ["openrn_pr_round15"])
        ],
        watchFor: [
            AttributedBullet("Corneal abrasion if patient moves; emergent if eye pain after.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Conjunctivitis transmission — sterilize / use disposable probes.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("False elevation in patients squeezing lids; coach relaxation.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("CCT correction — thin / thick corneas can falsely change reading; use pachymetry per primary source.", citationIDs: ["specialty_pr_round15"])
        ],
        citations: [openrnPRR15, specialtyPRR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum EpleyManeuverSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "epley-maneuver",
        title: "Epley canalith repositioning maneuver",
        subtitle: "First-line for posterior canal BPPV · ~80% resolve in 1–3 sessions",
        nclexTags: procTagsR15,
        indications: AttributedProse(
            "Sequential head-position changes to reposition free-floating otoconia from posterior semicircular canal back into utricle, eliminating BPPV vertigo. First-line per AAN / Bárány Society guidelines per primary source.",
            citationIDs: ["specialty_pr_round15"]
        ),
        contraindications: AttributedProse(
            "Cervical spine instability, severe carotid disease, recent cervical surgery, retinal detachment risk — modified maneuvers exist. Not for central vertigo (use HINTS exam first to rule out stroke / MS / posterior fossa lesion).",
            citationIDs: ["openrn_pr_round15"]
        ),
        equipment: [
            AttributedBullet("Exam table with end accessible; pillow optional.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Antiemetic on hand (severe vertigo / nausea).", citationIDs: ["openrn_pr_round15"])
        ],
        preProcedure: [
            AttributedBullet("Confirm posterior canal BPPV via Dix-Hallpike — provoked vertigo + upbeat-torsional nystagmus toward affected ear.", citationIDs: ["specialty_pr_round15"]),
            AttributedBullet("Rule out red flags — focal deficits, persistent vertigo, hearing loss, severe headache (central vertigo) per primary source.", citationIDs: ["specialty_pr_round15"]),
            AttributedBullet("Counsel — vertigo + brief nausea expected; reassure transient.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Antiemetic before if prone to severe nausea.", citationIDs: ["openrn_pr_round15"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Sit + turn head", body: "Sit upright on exam table; turn head 45° toward affected ear.", citationIDs: ["specialty_pr_round15"]),
            ProcedureStep(number: 2, title: "Lay supine, head hanging", body: "Quickly lay supine with head over edge of table, hanging 20° below horizontal, head still rotated 45° to affected side; hold 30–60 seconds OR until nystagmus / vertigo resolves per primary source.", citationIDs: ["specialty_pr_round15"]),
            ProcedureStep(number: 3, title: "Rotate head 90° opposite", body: "Rotate head 90° to opposite side (now 45° toward unaffected ear), still hanging; hold 30–60 seconds.", citationIDs: ["specialty_pr_round15"]),
            ProcedureStep(number: 4, title: "Roll body onto unaffected side", body: "Roll body onto unaffected side; head tilts toward floor (now 135° rotation from start); hold 30–60 seconds.", citationIDs: ["specialty_pr_round15"]),
            ProcedureStep(number: 5, title: "Sit up", body: "Sit up slowly; head tilted forward 30°; observe for residual nystagmus.", citationIDs: ["specialty_pr_round15"]),
            ProcedureStep(number: 6, title: "Repeat", body: "Repeat sequence 1–3 times per visit; reassess Dix-Hallpike; ~80% resolve after 1–3 sessions per primary source.", citationIDs: ["specialty_pr_round15"])
        ],
        postProcedure: [
            AttributedBullet("Counsel — avoid bending forward / head extension / lying flat 24–48 hours; sleep semi-upright initially (some clinicians; evidence limited).", citationIDs: ["specialty_pr_round15"]),
            AttributedBullet("Schedule follow-up 1 week to confirm resolution; teach home Epley if recurrence.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Vestibular rehabilitation referral if multi-canal / recurrent / refractory.", citationIDs: ["specialty_pr_round15"]),
            AttributedBullet("Driving — caution while symptomatic.", citationIDs: ["openrn_pr_round15"])
        ],
        documentation: [
            AttributedBullet("Affected ear, Dix-Hallpike findings pre + post, nystagmus pattern, patient response, number of cycles, follow-up plan.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Patient education provided + home maneuver teaching if appropriate.", citationIDs: ["openrn_pr_round15"])
        ],
        watchFor: [
            AttributedBullet("Vertigo + nausea / vomiting during procedure — usually transient; antiemetic if needed.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Canal switch — repositioning otoliths into different canal (rare); recognize new nystagmus pattern + treat appropriately.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Cervical / vascular injury — rare in carefully selected patients.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Failed maneuver — refer to ENT / vestibular specialist.", citationIDs: ["specialty_pr_round15"])
        ],
        citations: [openrnPRR15, specialtyPRR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum MethotrexateRescueSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "methotrexate-rescue",
        title: "Methotrexate toxicity rescue protocol",
        subtitle: "Leucovorin + alkalinization + hydration · glucarpidase for severe AKI · MTX-level guided",
        nclexTags: procTagsR15,
        indications: AttributedProse(
            "Standardized protocol for high-dose methotrexate (HDMTX) administration + monitoring + toxicity rescue. Goal — therapeutic anti-tumor levels while preventing AKI, mucositis, myelosuppression, hepatotoxicity, neurotoxicity per primary source.",
            citationIDs: ["specialty_pr_round15"]
        ),
        contraindications: AttributedProse(
            "Severe pre-existing renal dysfunction without specialty oversight; significant third-space fluid (effusions, ascites) — reduces clearance; concurrent NSAIDs / TMP-SMX / PPIs (interactions) per primary source.",
            citationIDs: ["specialty_pr_round15"]
        ),
        equipment: [
            AttributedBullet("IV access for hydration + alkalinization; central line preferred for HDMTX administration.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Sodium bicarbonate IV for urinary alkalinization (target pH ≥7.0).", citationIDs: ["specialty_pr_round15"]),
            AttributedBullet("Leucovorin (calcium folinate) for rescue; serum MTX levels by HPLC (after glucarpidase).", citationIDs: ["openfda_round15"]),
            AttributedBullet("Glucarpidase available for severe delayed clearance + AKI per primary source.", citationIDs: ["specialty_pr_round15"])
        ],
        preProcedure: [
            AttributedBullet("Pre-treatment evaluation — renal + hepatic function, drug interactions (NSAIDs, PPIs, sulfonamides, penicillins, salicylates).", citationIDs: ["specialty_pr_round15"]),
            AttributedBullet("HOLD interacting drugs ≥48 hours; counsel about chronic NSAIDs.", citationIDs: ["specialty_pr_round15"]),
            AttributedBullet("Hydration — 3 L/m²/day IV (or PO if tolerated) starting 12 hours pre-MTX.", citationIDs: ["specialty_pr_round15"]),
            AttributedBullet("Urinary alkalinization — sodium bicarbonate IV (target urine pH ≥7.0); recheck q6–8 hr.", citationIDs: ["specialty_pr_round15"]),
            AttributedBullet("Antiemetics; counsel photosensitivity.", citationIDs: ["openrn_pr_round15"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Administer MTX", body: "Per protocol (e.g., 1–12 g/m² IV over 4–24 hours depending on regimen).", citationIDs: ["specialty_pr_round15"]),
            ProcedureStep(number: 2, title: "Initiate leucovorin rescue", body: "Start 24 hours after MTX initiation; typical 15 mg PO/IV q6h × ~10 doses; ADJUST per serum MTX levels per primary source.", citationIDs: ["specialty_pr_round15"]),
            ProcedureStep(number: 3, title: "Serum MTX monitoring", body: "Levels at 24, 48, 72 hours (and longer until <0.05–0.1 µmol/L); higher leucovorin if MTX delayed clearance.", citationIDs: ["specialty_pr_round15"]),
            ProcedureStep(number: 4, title: "Continue support", body: "IV fluids + alkalinization + monitoring of urine output (target ≥100 mL/hr) + urine pH (q6–8h) until MTX cleared.", citationIDs: ["specialty_pr_round15"]),
            ProcedureStep(number: 5, title: "Glucarpidase rescue (if indicated)", body: "When MTX >1 µmol/L at 36–42 hours due to AKI, give glucarpidase 50 units/kg IV × 1; do NOT give leucovorin within 2 hours before/after; use HPLC for MTX levels after glucarpidase per primary source.", citationIDs: ["specialty_pr_round15"]),
            ProcedureStep(number: 6, title: "Daily labs", body: "Creatinine, electrolytes (especially K + Mg), liver enzymes, CBC, urinalysis.", citationIDs: ["openrn_pr_round15"])
        ],
        postProcedure: [
            AttributedBullet("Monitor for mucositis (oral / GI), myelosuppression, transaminitis, neurotoxicity (encephalopathy, seizures), pneumonitis.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Aggressive supportive care — antiemetics, mouth care, growth factors, transfusion as needed.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Photosensitivity counseling for ~48 hours; sun protection.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Continue leucovorin until MTX cleared + symptoms resolved; AVOID concomitant TMP-SMX, NSAIDs.", citationIDs: ["specialty_pr_round15"])
        ],
        documentation: [
            AttributedBullet("MTX dose, infusion duration, hydration + alkalinization volumes, urine pH + output q-shift, MTX serum levels, leucovorin doses, complications.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Hold drug interactions; pharmacy / oncology notification.", citationIDs: ["openrn_pr_round15"])
        ],
        watchFor: [
            AttributedBullet("AKI — sustained MTX clearance delayed; dehydration / acidic urine / drug interactions; risk of multiorgan toxicity per primary source.", citationIDs: ["specialty_pr_round15"]),
            AttributedBullet("Severe mucositis / myelosuppression — managed with leucovorin + supportive care + growth factors.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("Hepatotoxicity, neurotoxicity — rarer; management supportive.", citationIDs: ["openrn_pr_round15"]),
            AttributedBullet("LIFE-THREATENING DELAYED CLEARANCE — give glucarpidase per protocol; AVOID leucovorin within 2 hours of glucarpidase.", citationIDs: ["specialty_pr_round15"]),
            AttributedBullet("Hemodialysis is NOT effective for MTX — does not replace glucarpidase per primary source.", citationIDs: ["specialty_pr_round15"])
        ],
        citations: [openrnPRR15, specialtyPRR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum TraumaInformedCareSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "trauma-informed-care",
        title: "Trauma-informed care",
        subtitle: "Realize · Recognize · Respond · Resist re-traumatization · SAMHSA framework",
        eyebrow: "REFERENCE · TRAUMA-INFORMED PRACTICE",
        nclexTags: refTagsR15,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "SAMHSA framework for delivering health care while assuming wide prevalence of trauma history. Built on six principles + four R's. Goal — minimize re-traumatization, increase trust + safety, support recovery; applies across all care settings + populations per primary source.",
                citationIDs: ["specialty_pr_round15"]
            )),
            .bullets(title: "Four R's (SAMHSA)", [
                AttributedBullet("REALIZE the prevalence + impact of trauma.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("RECOGNIZE signs in patients + colleagues.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("RESPOND with informed practice.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("RESIST re-traumatization in care delivery.", citationIDs: ["specialty_pr_round15"])
            ]),
            .bullets(title: "Six principles", [
                AttributedBullet("Safety.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Trustworthiness + transparency.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Peer support.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Collaboration + mutuality.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Empowerment, voice, choice.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Cultural / historical / gender awareness.", citationIDs: ["specialty_pr_round15"])
            ]),
            .bullets(title: "Practical clinical application", [
                AttributedBullet("Universal precautions — assume trauma history; do not require disclosure; offer choice + control wherever possible.", citationIDs: ["openrn_pr_round15"]),
                AttributedBullet("Orient patients to environment, explain procedures + ask permission, offer chaperones, allow patient pace, predictable routines.", citationIDs: ["openrn_pr_round15"]),
                AttributedBullet("Minimize restraints + seclusion; debrief after.", citationIDs: ["openrn_pr_round15"]),
                AttributedBullet("Avoid stigmatizing language — \"declined\" not \"refused\"; \"used substances\" not \"abused.\"", citationIDs: ["openrn_pr_round15"]),
                AttributedBullet("Pelvic / sensitive exams — chaperone, draping, allow pause, explain each step, ask consent throughout.", citationIDs: ["openrn_pr_round15"]),
                AttributedBullet("ACEs (Adverse Childhood Experiences) screening — strong dose-response with chronic disease, mental illness, substance use; screen + connect to support per primary source.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Self-care for clinicians — secondary traumatic stress + burnout; debriefing + supervision + boundaries.", citationIDs: ["openrn_pr_round15"]),
                AttributedBullet("Cultural humility — historical trauma in marginalized communities; community-led care models.", citationIDs: ["openrn_pr_round15"])
            ])
        ],
        citations: [openrnPRR15, specialtyPRR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum SBIRTSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "sbirt",
        title: "SBIRT — substance use screening + intervention",
        subtitle: "Screening · Brief Intervention · Referral to Treatment",
        eyebrow: "REFERENCE · SUBSTANCE USE",
        nclexTags: refTagsR15,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "SAMHSA-supported public-health approach for early identification + intervention for unhealthy substance use across alcohol + drugs + tobacco. Used in primary care, ED, hospital, OB, dental settings; evidence strong for alcohol, mixed-good for cannabis / opioids per primary source.",
                citationIDs: ["specialty_pr_round15"]
            )),
            .bullets(title: "Screening tools", [
                AttributedBullet("AUDIT-C / single-item AUDIT for alcohol — ≥4 men / ≥3 women → positive.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("DAST-10 for drugs.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("CRAFFT for adolescents.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Universal screening at primary care visits; targeted in ED + inpatient + OB + dental.", citationIDs: ["specialty_pr_round15"])
            ]),
            .bullets(title: "Brief intervention (FRAMES)", [
                AttributedBullet("Feedback — about screening result + risk.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Responsibility — patient owns the choice.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Advice — clear, brief, personalized.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Menu — options for change.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Empathy — non-judgmental stance.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Self-efficacy — affirm patient capability.", citationIDs: ["specialty_pr_round15"])
            ]),
            .bullets(title: "Referral + treatment options", [
                AttributedBullet("Warm handoff + appointment + follow-up boosts engagement.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("MAT for OUD — buprenorphine, methadone, naltrexone (strongly evidence-based).", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("MAT for AUD — naltrexone, acamprosate, disulfiram.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Co-prescribe naloxone for opioid users + family members.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Pregnancy — universal screening; non-judgmental; coordinate addiction + maternal-fetal medicine; AVOID withdrawal in pregnancy.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Adolescents — CRAFFT + brief intervention; family involvement.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Avoid stigmatizing language — person-first framing.", citationIDs: ["openrn_pr_round15"])
            ])
        ],
        citations: [openrnPRR15, specialtyPRR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum AntimicrobialStewardshipSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "antimicrobial-stewardship",
        title: "Antimicrobial stewardship",
        subtitle: "Right drug · right dose · right duration · de-escalation",
        eyebrow: "REFERENCE · STEWARDSHIP",
        nclexTags: refTagsR15,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Coordinated program to optimize antimicrobial use — improve outcomes, reduce resistance, decrease adverse events (C. difficile, organ toxicity, drug interactions), control costs. CDC + IDSA + CMS Conditions of Participation require stewardship in hospitals + nursing homes per primary source.",
                citationIDs: ["specialty_pr_round15"]
            )),
            .bullets(title: "CDC Core Elements", [
                AttributedBullet("Leadership commitment.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Accountability.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Drug expertise.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Action.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Tracking.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Reporting.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Education.", citationIDs: ["specialty_pr_round15"])
            ]),
            .bullets(title: "Right drug · dose · duration", [
                AttributedBullet("Narrowest spectrum that covers likely pathogen + local susceptibility (antibiogram); culture-directed when available.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Dose — pharmacokinetics; weight-based; renal / hepatic adjustment; therapeutic drug monitoring (vancomycin, aminoglycosides).", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Duration — shorter courses for many infections (uncomplicated UTI 3 days, pyelo 7 days, CAP 5 days, intra-abdominal 4 days post-source-control) per primary source.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("De-escalate — narrow / discontinue when culture available; \"antibiotic time-out\" at 48–72 hours.", citationIDs: ["specialty_pr_round15"])
            ]),
            .bullets(title: "Avoid + clarify", [
                AttributedBullet("Avoid — empirical abx for viral URIs / acute bronchitis / asymptomatic bacteriuria (except pregnancy / pre-urologic procedure).", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Avoid IV when oral works (PO bioavailability often equivalent).", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Procalcitonin — adjunct to differentiate bacterial vs viral; guide d/c in lower respiratory infection per primary source.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Allergy clarification — most penicillin-allergic patients can safely receive cephalosporins; allergy delabeling.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Pre-prescribing pause — \"do I have evidence of bacterial infection?\"; check culture availability.", citationIDs: ["specialty_pr_round15"])
            ]),
            .bullets(title: "Resistance + stewardship rounds", [
                AttributedBullet("Overuse drives MRSA, VRE, ESBL, CRE, MDR-TB, candida; community + nosocomial.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Stewardship rounds — pharmacy / ID partnership; daily prospective audit + feedback.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Patient counseling — \"viral, no antibiotic needed\"; symptom management; when to return.", citationIDs: ["openrn_pr_round15"]),
                AttributedBullet("Document — indication, planned duration, culture / sensitivity follow-up plan.", citationIDs: ["openrn_pr_round15"])
            ])
        ],
        citations: [openrnPRR15, specialtyPRR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum GeriatricFrailtySample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "geriatric-frailty-assessment",
        title: "Geriatric frailty assessment",
        subtitle: "Fried phenotype + Clinical Frailty Scale · CGA · prehabilitation",
        eyebrow: "REFERENCE · GERIATRICS",
        nclexTags: refTagsR15,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Frailty is a clinical syndrome of decreased physiologic reserve + vulnerability to stressors — independent predictor of falls, disability, hospitalization, mortality. Assessment guides surgical risk stratification, intensity of care decisions, prehabilitation per primary source.",
                citationIDs: ["specialty_pr_round15"]
            )),
            .bullets(title: "Frailty assessment tools", [
                AttributedBullet("FRIED PHENOTYPE — 5 criteria: weight loss, exhaustion, weakness (grip strength), slow gait, low activity; 0 robust, 1–2 prefrail, ≥3 frail per primary source.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("CLINICAL FRAILTY SCALE (CFS / Rockwood) — 9-point scale; widely used in pre-op + ED triage per primary source.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("COMPREHENSIVE GERIATRIC ASSESSMENT (CGA) — multidimensional — medical, functional (ADLs / IADLs), cognitive (MoCA), nutritional, mood (PHQ-9), social, polypharmacy.", citationIDs: ["specialty_pr_round15"])
            ]),
            .bullets(title: "Medication safety", [
                AttributedBullet("BEERS CRITERIA — potentially inappropriate medications in older adults; reduce anticholinergics, benzodiazepines, sliding-scale insulin, NSAIDs per primary source.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("STOPP/START — explicit deprescribing tool; STOPP — discontinue inappropriate; START — initiate guideline-recommended underused therapies.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Polypharmacy + medication reconciliation at every transition of care.", citationIDs: ["openrn_pr_round15"])
            ]),
            .bullets(title: "Falls + delirium prevention", [
                AttributedBullet("STEADI bundle (CDC) — medication review, vision, footwear, home safety, vestibular, vitamin D, exercise (Tai Chi).", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Delirium — CAM screening; non-pharmacologic prevention (HELP — hospital elder life program); avoid restraints + sedatives.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Sensory — hearing aids, glasses, lighting; reduces delirium, falls, isolation.", citationIDs: ["openrn_pr_round15"])
            ]),
            .bullets(title: "Prehabilitation + advance care planning", [
                AttributedBullet("PREHABILITATION — exercise, nutrition optimization, cognitive engagement, smoking cessation 4–8 weeks pre-surgery — improves outcomes per primary source.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("ADVANCE CARE PLANNING — earlier conversations, POLST / MOLST, surrogate decision-maker, code status alignment with values.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Goals of care — alignment with frailty trajectory; conservative management is often appropriate.", citationIDs: ["specialty_pr_round15"]),
                AttributedBullet("Caregiver assessment — burden + support; respite; caregiver education.", citationIDs: ["openrn_pr_round15"])
            ])
        ],
        citations: [openrnPRR15, specialtyPRR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}
