import Foundation

// Curator-model drug entries (round 24 — geriatric / palliative / chronic pain / wound).

private let openfdaR24 = CitationSource(
    id: "openfda_round24",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-05-12"
)
private let openrnPharmR24 = CitationSource(
    id: "openrn_pharm_round24",
    shortName: "Open RN Pharmacology + Gerontology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-05-12"
)
private let cdcR24 = CitationSource(
    id: "cdc_round24",
    shortName: "CDC + AGS + AAHPM concept citations",
    publisher: "CDC · AGS · AAHPM",
    license: .factCitationOnly,
    url: "https://www.americangeriatrics.org/publications-tools/clinical-practice-guidelines",
    lastRetrieved: "2026-05-12"
)
private let specialtyR24 = CitationSource(
    id: "specialty_round24",
    shortName: "AGS Beers + AAHPM + WOCN + AAFP geriatric / pain / wound",
    publisher: "AGS · AAHPM · WOCN · AAFP",
    license: .factCitationOnly,
    url: "https://www.guideline.gov/",
    lastRetrieved: "2026-05-12"
)

public enum MethylnaltrexoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "methylnaltrexone",
        title: "Methylnaltrexone (Relistor)",
        subtitle: "Peripherally acting μ-opioid antagonist · OIC in palliative + chronic non-cancer pain · doesn't cross BBB · GI perforation risk",
        category: "Peripherally acting μ-opioid receptor antagonist (PAMORA)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Peripherally acting μ-opioid receptor antagonist (PAMORA) — quaternary derivative of naltrexone"),
            KeyValueRow(key: "Use", value: "Opioid-induced constipation in palliative care + advanced illness; chronic non-cancer pain on opioids"),
            KeyValueRow(key: "Dose (SC)", value: "Body weight-based: 38-61 kg = 8 mg SC; 62-114 kg = 12 mg SC; q1-2 days PRN"),
            KeyValueRow(key: "Dose (PO)", value: "450 mg PO daily for chronic non-cancer pain"),
            KeyValueRow(key: "Watch", value: "GI perforation in patients with GI lesions / cancer; opioid analgesia preserved (peripheral action only)")
        ],
        indications: AttributedProse(
            "Opioid-induced constipation (OIC) in adults with chronic non-cancer pain or in palliative care / advanced illness when laxative response inadequate. Provides constipation relief WITHOUT reversing central opioid analgesia (does not cross blood-brain barrier) per primary source.",
            citationIDs: ["specialty_round24", "openfda_round24"]
        ),
        mechanism: AttributedProse(
            "Quaternary amine derivative of naltrexone — peripheral μ-opioid receptor antagonist that does NOT cross blood-brain barrier (unlike naloxone / naltrexone). Blocks GI μ-receptors → reverses opioid-induced reduction in motility + secretion → laxation; preserves CNS analgesic effect.",
            citationIDs: ["openfda_round24"]
        ),
        dosing: [
            DosingBlock(label: "OIC palliative care (SC)", body: "Body-weight dose — 38-61 kg = 8 mg SC; 62-114 kg = 12 mg SC; >114 kg = 0.15 mg/kg SC; q1-2 days PRN no more than once per 24 hrs per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "OIC chronic non-cancer pain (PO)", body: "450 mg PO daily on empty stomach × 4 weeks; assess response per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "OIC chronic non-cancer pain (SC)", body: "12 mg SC daily per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Severe renal impairment (CrCl <30)", body: "Reduce SC dose by 50%; oral dose decrease per primary source.", citationIDs: ["openfda_round24"])
        ],
        contraindications: AttributedProse(
            "KNOWN OR SUSPECTED MECHANICAL GI OBSTRUCTION; advanced metastatic disease in GI tract; conditions increasing GI perforation risk (Ogilvie syndrome, peptic ulcer, diverticular disease, GI graft-vs-host disease, cancer with GI involvement); hypersensitivity per primary source.",
            citationIDs: ["openfda_round24"]
        ),
        warnings: [
            AttributedBullet("GI PERFORATION — reported in patients with advanced cancer + GI lesions, peptic ulcer, diverticular disease; counsel + monitor; STOP if severe abdominal pain.", citationIDs: ["openfda_round24"]),
            AttributedBullet("OPIOID WITHDRAWAL — RARE if opioid-naive or recent opioid initiation; minimal at therapeutic doses.", citationIDs: ["openfda_round24"]),
            AttributedBullet("ABDOMINAL PAIN — common; usually transient + accompanies bowel movement.", citationIDs: ["openfda_round24"]),
            AttributedBullet("DIARRHEA — common; reduce dose if persistent.", citationIDs: ["openfda_round24"]),
            AttributedBullet("HYPERHIDROSIS, FLATULENCE, NAUSEA — common.", citationIDs: ["openfda_round24"]),
            AttributedBullet("HEPATIC IMPAIRMENT — no dose adjustment for mild-moderate; severe (Child-Pugh C) caution.", citationIDs: ["openfda_round24"]),
            AttributedBullet("PREGNANCY Category C — limited data; generally avoid.", citationIDs: ["openfda_round24"])
        ],
        adverseReactions: AttributedProse(
            "Abdominal pain (common), flatulence, nausea, diarrhea, hyperhidrosis, vomiting, dizziness, hot flushes; rare GI perforation, anaphylaxis.",
            citationIDs: ["openfda_round24"]
        ),
        drugInteractions: [
            AttributedBullet("Other OPIOID ANTAGONISTS (naltrexone, naloxone) — additive antagonism + risk of opioid withdrawal + reversed analgesia.", citationIDs: ["openfda_round24"]),
            AttributedBullet("Other LAXATIVES — can use concurrently; methylnaltrexone is rescue when laxatives fail.", citationIDs: ["specialty_round24"]),
            AttributedBullet("Strong CYP3A4 inhibitors / inducers — minimal effect.", citationIDs: ["openfda_round24"]),
            AttributedBullet("CNS-acting opioid antagonists / agonist-antagonists (buprenorphine) — generally safe but limited data.", citationIDs: ["openfda_round24"])
        ],
        nursingImplications: [
            AttributedBullet("INDICATED for OPIOID-INDUCED CONSTIPATION specifically — not first-line for general constipation.", citationIDs: ["specialty_round24"]),
            AttributedBullet("USE AFTER laxative trial — start with senna + osmotic (PEG, lactulose) before methylnaltrexone per primary source.", citationIDs: ["specialty_round24"]),
            AttributedBullet("ASSESS GI history — peptic ulcer, diverticular disease, cancer = perforation risk; weigh benefit vs risk.", citationIDs: ["specialty_round24"]),
            AttributedBullet("SC injection — abdomen, thigh, upper arm; rotate sites.", citationIDs: ["openrn_pharm_round24"]),
            AttributedBullet("ONSET — typically within 30 min - 4 hours post-dose; counsel.", citationIDs: ["openrn_pharm_round24"]),
            AttributedBullet("MONITOR — bowel function, abdominal pain, opioid analgesia maintained.", citationIDs: ["specialty_round24"]),
            AttributedBullet("DISCONTINUE if severe abdominal pain (perforation concern) — emergent eval.", citationIDs: ["specialty_round24"]),
            AttributedBullet("Counsel — maintain other laxatives + hydration + activity if possible.", citationIDs: ["specialty_round24"])
        ],
        patientTeaching: AttributedProse(
            "This medicine helps with constipation from your pain medicine without affecting how well your pain medicine works. Use after senna + stool softeners + Miralax aren't enough. Take on empty stomach if oral. Tell us about severe stomach pain — emergency. Some belly cramping with bowel movements is normal.",
            citationIDs: ["openrn_pharm_round24"]
        ),
        citations: [openfdaR24, openrnPharmR24, cdcR24, specialtyR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum GalantamineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "galantamine",
        title: "Galantamine (Razadyne)",
        subtitle: "AChE inhibitor + nicotinic modulator · mild-moderate Alzheimer · slow titration · GI + bradycardia · hold for syncope",
        category: "Acetylcholinesterase (AChE) inhibitor + allosteric nicotinic modulator",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "AChE inhibitor + allosteric nicotinic receptor potentiator"),
            KeyValueRow(key: "Use", value: "Mild-moderate Alzheimer dementia; off-label vascular + mixed dementia"),
            KeyValueRow(key: "Dose", value: "Start 4 mg PO BID with meals × 4 weeks → titrate to 8 mg BID → 12 mg BID; ER 8 mg → 16 mg → 24 mg daily"),
            KeyValueRow(key: "Watch", value: "GI side effects (nausea, vomiting, anorexia, weight loss); bradycardia, syncope, AV block; hold if HR <50")
        ],
        indications: AttributedProse(
            "Mild-to-moderate dementia of the Alzheimer type. Off-label use for vascular + mixed dementia. NOT effective for severe dementia (FDA approved for mild-moderate only) per primary source.",
            citationIDs: ["specialty_round24", "openfda_round24"]
        ),
        mechanism: AttributedProse(
            "Reversible AChE inhibitor — increases synaptic ACh in cerebral cortex → enhances cholinergic neurotransmission. Also allosteric potentiator at presynaptic nicotinic receptors → augmenting ACh release. Modest symptomatic improvement; does NOT alter underlying disease progression.",
            citationIDs: ["openfda_round24"]
        ),
        dosing: [
            DosingBlock(label: "Immediate-release (IR)", body: "Start 4 mg PO BID with meals × 4 weeks → 8 mg BID × 4 weeks → 12 mg BID maintenance per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Extended-release (ER)", body: "Start 8 mg PO daily AM with food × 4 weeks → 16 mg daily × 4 weeks → 24 mg daily maintenance per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Renal adjustment (CrCl 9-59)", body: "Maximum 16 mg/day; severe (CrCl <9) — not recommended.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Hepatic adjustment (Child-Pugh B)", body: "Maximum 16 mg/day; severe — not recommended.", citationIDs: ["openfda_round24"])
        ],
        contraindications: AttributedProse(
            "Severe hepatic impairment (Child-Pugh C); severe renal impairment (CrCl <9); hypersensitivity. Caution — bradycardia, sick sinus, AV block, asthma / COPD, peptic ulcer, urinary obstruction, seizure history per primary source.",
            citationIDs: ["openfda_round24"]
        ),
        warnings: [
            AttributedBullet("BRADYCARDIA + AV BLOCK — cholinergic effect; HR + ECG monitoring; HOLD if HR <50; permanent pacemaker if symptomatic.", citationIDs: ["specialty_round24"]),
            AttributedBullet("SYNCOPE — falls + injury risk in elderly; counsel; concomitant β-blocker / digoxin / non-DHP CCB increase risk.", citationIDs: ["specialty_round24"]),
            AttributedBullet("GI ADVERSE EFFECTS — nausea, vomiting, anorexia, weight loss (5-15%); SLOW titration + take with meals minimizes.", citationIDs: ["specialty_round24"]),
            AttributedBullet("PEPTIC ULCER / GI BLEED — increased risk; caution with concurrent NSAIDs; H. pylori test + treat.", citationIDs: ["specialty_round24"]),
            AttributedBullet("BRONCHOSPASM — caution in severe asthma / COPD.", citationIDs: ["openfda_round24"]),
            AttributedBullet("URINARY RETENTION — caution in BPH.", citationIDs: ["openfda_round24"]),
            AttributedBullet("SEIZURES — rare; cholinergic; caution with seizure history.", citationIDs: ["openfda_round24"]),
            AttributedBullet("ANESTHESIA — succinylcholine effects prolonged; alert anesthesia.", citationIDs: ["openfda_round24"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting, diarrhea, anorexia, weight loss, dizziness, headache, fatigue, syncope, bradycardia, AV block, urinary frequency, vivid dreams, agitation, depression.",
            citationIDs: ["openfda_round24"]
        ),
        drugInteractions: [
            AttributedBullet("β-BLOCKERS, DIGOXIN, NON-DHP CCBs (verapamil, diltiazem) — additive bradycardia + AV block.", citationIDs: ["openfda_round24"]),
            AttributedBullet("Other CHOLINERGICS (bethanechol, donepezil, rivastigmine) — additive cholinergic effects; do not combine.", citationIDs: ["openfda_round24"]),
            AttributedBullet("ANTICHOLINERGICS — antagonize benefit; counsel for OTC + Rx (diphenhydramine, oxybutynin, TCAs).", citationIDs: ["specialty_round24"]),
            AttributedBullet("CYP2D6 / CYP3A4 inhibitors (paroxetine, ketoconazole) — increase galantamine levels.", citationIDs: ["openfda_round24"]),
            AttributedBullet("SUCCINYLCHOLINE — exaggerated neuromuscular blockade; alert anesthesia.", citationIDs: ["openfda_round24"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — HR + ECG; pulmonary status; renal + hepatic function; weight; medication review (anticholinergics).", citationIDs: ["specialty_round24"]),
            AttributedBullet("TAKE WITH MEALS — reduces GI side effects.", citationIDs: ["openrn_pharm_round24"]),
            AttributedBullet("SLOW TITRATION (4-week intervals) — allows tolerance; rapid titration → severe nausea / vomiting.", citationIDs: ["specialty_round24"]),
            AttributedBullet("MONITOR — cognitive function (MMSE / MoCA periodically); functional status (ADLs); HR; weight; GI symptoms.", citationIDs: ["specialty_round24"]),
            AttributedBullet("HOLD if HR <50, syncope, severe vomiting, peptic ulcer signs.", citationIDs: ["specialty_round24"]),
            AttributedBullet("AVOID concurrent ANTICHOLINERGIC drugs (oxybutynin, diphenhydramine, etc.) — antagonizes effect.", citationIDs: ["specialty_round24"]),
            AttributedBullet("DISCONTINUATION — taper gradually; abrupt withdrawal can cause cognitive decline rebound.", citationIDs: ["specialty_round24"]),
            AttributedBullet("MEMORY CARE — combination with non-pharm interventions (cognitive stimulation, exercise, social engagement).", citationIDs: ["specialty_round24"])
        ],
        patientTeaching: AttributedProse(
            "This medicine helps with memory + thinking in mild-moderate Alzheimer's. It doesn't reverse the disease but can help symptoms. Take with meals. Tell us about slow heartbeat, fainting, severe nausea, weight loss, or stomach bleeding. We start at a low dose and increase slowly to reduce side effects.",
            citationIDs: ["openrn_pharm_round24"]
        ),
        citations: [openfdaR24, openrnPharmR24, cdcR24, specialtyR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum RivastigmineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "rivastigmine",
        title: "Rivastigmine (Exelon, patch)",
        subtitle: "AChE + butyrylcholinesterase inhibitor · Alzheimer + Parkinson dementia · PATCH preferred (less GI) · pulmonary toxicity",
        category: "Acetylcholinesterase + butyrylcholinesterase inhibitor",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Dual AChE + butyrylcholinesterase inhibitor"),
            KeyValueRow(key: "Use", value: "Mild-moderate Alzheimer dementia; mild-moderate Parkinson disease dementia (FDA-approved); off-label DLB"),
            KeyValueRow(key: "Dose (oral)", value: "Start 1.5 mg PO BID; titrate q2 weeks to 3 mg BID → 4.5 mg BID → 6 mg BID maximum"),
            KeyValueRow(key: "Dose (patch)", value: "4.6 mg/24h × 4 weeks → 9.5 mg/24h maintenance; large dose 13.3 mg/24h for severe"),
            KeyValueRow(key: "Watch", value: "Severe GI side effects (worse than donepezil); patch reduces GI; prone GI = stop + restart at lower dose")
        ],
        indications: AttributedProse(
            "Mild-to-moderate dementia of the Alzheimer type. Mild-to-moderate dementia associated with Parkinson disease. Off-label dementia with Lewy bodies (DLB). NOT for severe dementia (most evidence in mild-moderate) per primary source.",
            citationIDs: ["specialty_round24", "openfda_round24"]
        ),
        mechanism: AttributedProse(
            "Pseudo-irreversible AChE inhibitor + butyrylcholinesterase inhibitor — increases synaptic ACh in cortex + hippocampus. Dual cholinesterase inhibition theoretical advantage in dementia. Modest symptomatic improvement; does not alter underlying neurodegeneration.",
            citationIDs: ["openfda_round24"]
        ),
        dosing: [
            DosingBlock(label: "Oral (capsule)", body: "Start 1.5 mg PO BID with meals × 2-4 weeks → 3 mg BID × 2-4 weeks → 4.5 mg BID × 2-4 weeks → 6 mg BID maximum per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Transdermal patch (preferred)", body: "Start 4.6 mg/24h × 4 weeks → 9.5 mg/24h maintenance; severe Alzheimer's may use 13.3 mg/24h per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Switch from oral to patch", body: "Patient on ≤6 mg/day oral → 4.6 mg/24h patch; on >6 mg/day oral → 9.5 mg/24h patch.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Hepatic / renal", body: "Caution in moderate-severe; reduce dose; severe = avoid.", citationIDs: ["openfda_round24"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to rivastigmine / carbamates; history of severe allergic reaction. Caution — bradycardia, sick sinus, AV block, asthma / COPD, peptic ulcer, urinary obstruction, seizure history.",
            citationIDs: ["openfda_round24"]
        ),
        warnings: [
            AttributedBullet("SEVERE GI ADVERSE EFFECTS — nausea, vomiting, anorexia, diarrhea, weight loss; SIGNIFICANTLY worse than donepezil (oral); PATCH reduces GI dramatically — strong reason to prefer patch per primary source.", citationIDs: ["specialty_round24"]),
            AttributedBullet("DOSING ERRORS / WITHDRAWAL — interruptions >3 days require RESTART at lowest dose + re-titrate; risk of severe vomiting if resume at previous dose per primary source.", citationIDs: ["specialty_round24"]),
            AttributedBullet("BRADYCARDIA + SYNCOPE — falls + injury risk; caution with β-blockers / digoxin / non-DHP CCBs.", citationIDs: ["specialty_round24"]),
            AttributedBullet("PATCH application — rotate sites (chest, back, upper arm); apply to clean dry hairless intact skin; remove old patch before new; ROTATE sites at 14-day intervals to avoid contact dermatitis.", citationIDs: ["openfda_round24"]),
            AttributedBullet("PEPTIC ULCER / GI BLEED — caution; H. pylori test + treat; concurrent NSAIDs additive risk.", citationIDs: ["specialty_round24"]),
            AttributedBullet("BRONCHOSPASM — caution in severe asthma / COPD.", citationIDs: ["openfda_round24"]),
            AttributedBullet("URINARY RETENTION — caution in BPH.", citationIDs: ["openfda_round24"]),
            AttributedBullet("SEIZURES — rare; counsel.", citationIDs: ["openfda_round24"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting, diarrhea, anorexia, weight loss, dizziness, headache, syncope, bradycardia, contact dermatitis (patch), tremor (Parkinson dementia), agitation, somnolence.",
            citationIDs: ["openfda_round24"]
        ),
        drugInteractions: [
            AttributedBullet("Other CHOLINERGICS — additive cholinergic effects.", citationIDs: ["openfda_round24"]),
            AttributedBullet("ANTICHOLINERGICS — antagonize benefit.", citationIDs: ["specialty_round24"]),
            AttributedBullet("β-BLOCKERS, DIGOXIN, NON-DHP CCBs — additive bradycardia.", citationIDs: ["openfda_round24"]),
            AttributedBullet("SUCCINYLCHOLINE — exaggerated effect; alert anesthesia.", citationIDs: ["openfda_round24"]),
            AttributedBullet("Smoking — induces metabolism; smokers may need higher doses.", citationIDs: ["openfda_round24"])
        ],
        nursingImplications: [
            AttributedBullet("PATCH STRONGLY PREFERRED over oral — much better GI tolerability; same efficacy.", citationIDs: ["specialty_round24"]),
            AttributedBullet("APPLY patch to intact dry hairless upper back / upper arm / chest; ROTATE sites at each dose change (do not reapply to same area within 14 days).", citationIDs: ["openfda_round24"]),
            AttributedBullet("REMOVE OLD PATCH before applying new — overdose risk.", citationIDs: ["openfda_round24"]),
            AttributedBullet("INTERRUPTIONS >3 days = restart at LOWEST dose + re-titrate per primary source.", citationIDs: ["specialty_round24"]),
            AttributedBullet("MONITOR — cognitive + functional + HR + GI symptoms + weight + skin (patch).", citationIDs: ["specialty_round24"]),
            AttributedBullet("PARKINSON DEMENTIA — caution + monitor for worsened motor symptoms; tremor common; usually tolerable.", citationIDs: ["specialty_round24"]),
            AttributedBullet("DISCONTINUATION taper — gradual reduction.", citationIDs: ["specialty_round24"])
        ],
        patientTeaching: AttributedProse(
            "This patch goes on clean, dry, hairless skin on your back, upper arm, or chest. Take the OLD patch OFF before putting a new one on — wearing two is dangerous. Move the patch to a NEW spot each day. Tell us about severe nausea, vomiting, or weight loss. If you miss doses for more than 3 days, call us — we'll restart at a low dose.",
            citationIDs: ["openrn_pharm_round24"]
        ),
        citations: [openfdaR24, openrnPharmR24, cdcR24, specialtyR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum SennaSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "senna",
        title: "Senna / sennosides (Senokot)",
        subtitle: "Stimulant laxative · OTC · first-line for opioid + immobility constipation · combine with stool softener · 6-12h onset",
        category: "Stimulant laxative (anthraquinone)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Stimulant laxative — anthraquinone"),
            KeyValueRow(key: "Use", value: "Constipation (occasional + chronic); opioid-induced; bowel prep adjunct; chronic disease constipation"),
            KeyValueRow(key: "Dose", value: "8.6-17.2 mg sennosides PO QHS or BID; max 100 mg/day"),
            KeyValueRow(key: "Watch", value: "Onset 6-12 hours (overnight typical); cramping common; safe in pregnancy + lactation"),
            KeyValueRow(key: "OTC", value: "Senokot, Ex-Lax, Senna-Lax — many forms")
        ],
        indications: AttributedProse(
            "Occasional constipation; chronic functional constipation; opioid-induced constipation (combine with stool softener); pre-procedure bowel preparation; constipation in chronic disease + immobility per primary source.",
            citationIDs: ["specialty_round24", "openfda_round24"]
        ),
        mechanism: AttributedProse(
            "Anthraquinone glycoside — converted by colonic bacteria to active form rhein → stimulates myenteric plexus → enhances colonic peristalsis + increases water + electrolyte secretion into colon. Onset 6-12 hours after oral dose.",
            citationIDs: ["openfda_round24"]
        ),
        dosing: [
            DosingBlock(label: "Adult occasional constipation", body: "8.6-17.2 mg sennosides PO QHS or BID; tablets typically 8.6 mg; max 100 mg/day per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Opioid-induced constipation", body: "Senna 17.2 mg PO BID + docusate 100 mg PO BID PRN per primary source.", citationIDs: ["specialty_round24"]),
            DosingBlock(label: "Chronic palliative use", body: "Senna 17.2-34.4 mg PO BID standing + PRN; with PEG 17 g daily; lactulose / methylnaltrexone for refractory.", citationIDs: ["specialty_round24"]),
            DosingBlock(label: "Pediatric (≥6 yrs)", body: "5-7.5 mg sennosides PO QHS; lower doses for younger children per primary source.", citationIDs: ["specialty_round24"]),
            DosingBlock(label: "Pregnancy", body: "Generally safe; preferred over castor oil, anthraquinones excreted in breast milk in low quantities.", citationIDs: ["specialty_round24"])
        ],
        contraindications: AttributedProse(
            "Acute abdomen, intestinal obstruction (suspected or confirmed), undiagnosed abdominal pain, severe diarrhea, IBD flare, hypersensitivity per primary source.",
            citationIDs: ["openfda_round24"]
        ),
        warnings: [
            AttributedBullet("CRAMPING — common; reduce dose if severe; usually tolerable + transient.", citationIDs: ["openfda_round24"]),
            AttributedBullet("DIARRHEA / DEHYDRATION — overuse / overdose; reduce dose; replete fluids + electrolytes.", citationIDs: ["openfda_round24"]),
            AttributedBullet("MELANOSIS COLI — chronic use causes brown pigmentation of colonic mucosa; cosmetic / endoscopic finding; reverses on discontinuation; controversial historical concern about colon cancer NOT supported.", citationIDs: ["specialty_round24"]),
            AttributedBullet("TOLERANCE / dependence — possible with very chronic use; combine with other agents + avoid prolonged solo use.", citationIDs: ["specialty_round24"]),
            AttributedBullet("PSEUDO-MEMBRANOUS COLITIS — rare; consider if persistent diarrhea + fever.", citationIDs: ["openfda_round24"]),
            AttributedBullet("ELECTROLYTE imbalance — hypokalemia from chronic overuse; counsel.", citationIDs: ["openfda_round24"])
        ],
        adverseReactions: AttributedProse(
            "Abdominal cramping, diarrhea, electrolyte imbalance (chronic overuse), urine discoloration (yellow-brown), allergic reactions (rare), melanosis coli (chronic use).",
            citationIDs: ["openfda_round24"]
        ),
        drugInteractions: [
            AttributedBullet("DIGOXIN — hypokalemia from chronic overuse increases digoxin toxicity risk.", citationIDs: ["openfda_round24"]),
            AttributedBullet("DIURETICS — additive hypokalemia.", citationIDs: ["openfda_round24"]),
            AttributedBullet("WARFARIN — diarrhea may alter vitamin K absorption + warfarin response.", citationIDs: ["openfda_round24"])
        ],
        nursingImplications: [
            AttributedBullet("STANDING DOSE for chronic opioid users — combine with stool softener (docusate); add osmotic (PEG / lactulose) PRN.", citationIDs: ["specialty_round24"]),
            AttributedBullet("BEDTIME DOSING — 6-12 hour onset; bowel movement next morning typical.", citationIDs: ["openrn_pharm_round24"]),
            AttributedBullet("HYDRATION + FIBER + ACTIVITY — non-pharm complement.", citationIDs: ["specialty_round24"]),
            AttributedBullet("PALLIATIVE / OPIOID prescribing — coprescribe senna prophylactically with opioids per primary source.", citationIDs: ["specialty_round24"]),
            AttributedBullet("Counsel — yellow-brown urine normal; cramping common + tolerable.", citationIDs: ["openfda_round24"]),
            AttributedBullet("MONITOR — bowel function, electrolytes (chronic high-dose), abdominal pain.", citationIDs: ["openfda_round24"]),
            AttributedBullet("ESCALATION — if senna + softener inadequate, add osmotic; methylnaltrexone for refractory OIC.", citationIDs: ["specialty_round24"])
        ],
        patientTeaching: AttributedProse(
            "Take this at bedtime — it works overnight (you'll have a bowel movement in the morning). It can cause some cramping. If you're on a strong pain medicine, take this regularly to prevent constipation. Drink lots of water. Tell us if you have severe pain, no bowel movement for several days despite this, or diarrhea.",
            citationIDs: ["openrn_pharm_round24"]
        ),
        citations: [openfdaR24, openrnPharmR24, cdcR24, specialtyR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum BisacodylSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "bisacodyl",
        title: "Bisacodyl (Dulcolax)",
        subtitle: "Stimulant laxative · oral 5-15 mg or suppository 10 mg · onset 6-12h oral / 15-60 min suppository · cramping",
        category: "Stimulant laxative (diphenylmethane)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Stimulant laxative — diphenylmethane derivative"),
            KeyValueRow(key: "Use", value: "Constipation (occasional + chronic); bowel preparation; opioid-induced constipation; suppository for refractory"),
            KeyValueRow(key: "Oral dose", value: "5-15 mg PO QHS; enteric-coated tablets"),
            KeyValueRow(key: "Suppository dose", value: "10 mg PR; onset 15-60 min"),
            KeyValueRow(key: "Watch", value: "Cramping common; abdominal pain; allergic reactions; AVOID enteric coating with antacids / dairy / PPIs (premature dissolution)")
        ],
        indications: AttributedProse(
            "Occasional + chronic constipation; bowel preparation pre-colonoscopy + surgery; opioid-induced constipation; obstipation; chronic immobility constipation per primary source.",
            citationIDs: ["specialty_round24", "openfda_round24"]
        ),
        mechanism: AttributedProse(
            "Diphenylmethane stimulant — directly stimulates intestinal mucosa + enteric nerves → enhanced colonic peristalsis + water + electrolyte secretion. Onset 6-12 hours oral (enteric coating dissolves in colon); 15-60 min suppository (direct rectal stimulation).",
            citationIDs: ["openfda_round24"]
        ),
        dosing: [
            DosingBlock(label: "Oral", body: "5-15 mg PO QHS for next-day BM; 10-30 mg for bowel prep per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Suppository", body: "10 mg PR — rapid onset 15-60 min; for fecal impaction or rapid relief.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Bowel prep", body: "20 mg PO at 4 PM day before procedure (with PEG-electrolyte solution) per primary source.", citationIDs: ["specialty_round24"]),
            DosingBlock(label: "Pediatric (>6 years)", body: "5-10 mg PO QHS or 10 mg suppository per primary source.", citationIDs: ["specialty_round24"]),
            DosingBlock(label: "Pregnancy", body: "Generally OK in occasional use; cramping may stimulate uterine contractions in late pregnancy.", citationIDs: ["specialty_round24"])
        ],
        contraindications: AttributedProse(
            "Intestinal obstruction (suspected or confirmed), acute abdomen, undiagnosed abdominal pain, severe diarrhea, IBD flare, severe dehydration / electrolyte disturbance, hypersensitivity per primary source.",
            citationIDs: ["openfda_round24"]
        ),
        warnings: [
            AttributedBullet("ENTERIC COATING — DO NOT crush; do NOT take with antacids / dairy / PPI / H2 blocker (premature dissolution → severe gastric pain).", citationIDs: ["specialty_round24"]),
            AttributedBullet("CRAMPING — common; reduce dose if severe.", citationIDs: ["openfda_round24"]),
            AttributedBullet("DIARRHEA / dehydration — overuse; counsel + dose adjustment.", citationIDs: ["openfda_round24"]),
            AttributedBullet("ALLERGIC REACTIONS (rare) — anaphylaxis, urticaria, dyspnea reported in case reports per primary source.", citationIDs: ["openfda_round24"]),
            AttributedBullet("LONG-TERM use — limited data; usually combined with other agents in chronic conditions.", citationIDs: ["specialty_round24"]),
            AttributedBullet("ELECTROLYTE disturbances (hypokalemia) with chronic overuse.", citationIDs: ["openfda_round24"])
        ],
        adverseReactions: AttributedProse(
            "Abdominal cramping, diarrhea, abdominal pain, electrolyte disturbance, allergic reactions (rare anaphylaxis), suppository — proctitis / rectal burning.",
            citationIDs: ["openfda_round24"]
        ),
        drugInteractions: [
            AttributedBullet("ANTACIDS, dairy products, PPIs, H2 blockers — degrade enteric coating; SEPARATE by 1+ hour or AVOID combined per primary source.", citationIDs: ["openfda_round24"]),
            AttributedBullet("DIGOXIN — hypokalemia from chronic overuse → digoxin toxicity.", citationIDs: ["openfda_round24"]),
            AttributedBullet("DIURETICS — additive hypokalemia.", citationIDs: ["openfda_round24"])
        ],
        nursingImplications: [
            AttributedBullet("DO NOT crush enteric tablets; swallow whole.", citationIDs: ["specialty_round24"]),
            AttributedBullet("AVOID with antacids / dairy / PPIs within 1 hour.", citationIDs: ["openrn_pharm_round24"]),
            AttributedBullet("BEDTIME oral dosing for next-morning bowel movement.", citationIDs: ["openrn_pharm_round24"]),
            AttributedBullet("SUPPOSITORY — use for rapid relief or when oral cannot be tolerated; refrigerate; insert + retain 15-30 min.", citationIDs: ["openrn_pharm_round24"]),
            AttributedBullet("CHRONIC use — combine with osmotic (PEG); avoid as solo agent for chronic constipation.", citationIDs: ["specialty_round24"]),
            AttributedBullet("MONITOR — bowel function, electrolytes (chronic), hydration.", citationIDs: ["openfda_round24"]),
            AttributedBullet("OPIOID PROPHYLAXIS — start senna + softener as first-line; bisacodyl as escalation.", citationIDs: ["specialty_round24"])
        ],
        patientTeaching: AttributedProse(
            "Take this at bedtime to have a bowel movement in the morning. Don't crush the tablet — swallow whole. Don't take it within an hour of milk, antacids, or stomach medicines (they break the coating + cause stomach pain). Cramping is common. Tell us about severe pain or no bowel movement.",
            citationIDs: ["openrn_pharm_round24"]
        ),
        citations: [openfdaR24, openrnPharmR24, cdcR24, specialtyR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum MelatoninSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "melatonin",
        title: "Melatonin (Pineal hormone supplement)",
        subtitle: "Sleep onset + circadian rhythm · 0.3-3 mg 30 min before bed · OTC supplement · jet lag + delirium prevention · NOT regulated FDA-strict",
        category: "Endogenous pineal hormone supplement",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Endogenous indoleamine; melatonin receptor agonist"),
            KeyValueRow(key: "Use", value: "Sleep onset insomnia; jet lag; circadian rhythm disorders; ICU delirium prevention; pediatric ASD sleep"),
            KeyValueRow(key: "Dose", value: "0.3-3 mg PO 30-60 min before desired sleep; doses >3 mg have no added benefit + may worsen"),
            KeyValueRow(key: "Status", value: "Dietary supplement (US — not FDA-regulated for safety / potency); OTC"),
            KeyValueRow(key: "Watch", value: "Quality varies by brand; pediatric dosing concerns; daytime sedation if too high; vivid dreams")
        ],
        indications: AttributedProse(
            "Sleep onset insomnia (especially elderly with reduced endogenous melatonin); jet lag; delayed sleep phase syndrome; non-24-hour sleep-wake disorder (FDA-approved for blind patients); ICU delirium prevention (some evidence); pediatric autism spectrum sleep difficulties; shift work disorder per primary source.",
            citationIDs: ["specialty_round24", "openfda_round24"]
        ),
        mechanism: AttributedProse(
            "Endogenous indoleamine secreted by pineal gland in darkness → binds MT1 + MT2 receptors → reduces nocturnal alertness + facilitates sleep onset + entrains circadian rhythm. Endogenous production declines with age + bright light exposure + shift work.",
            citationIDs: ["openfda_round24"]
        ),
        dosing: [
            DosingBlock(label: "Sleep onset insomnia", body: "0.3-3 mg PO 30-60 min before desired sleep; START LOW (0.3-0.5 mg) and titrate; doses >3 mg generally NOT MORE EFFECTIVE per primary source.", citationIDs: ["specialty_round24"]),
            DosingBlock(label: "Jet lag", body: "0.5-5 mg at local bedtime for first 2-5 nights at destination per primary source.", citationIDs: ["specialty_round24"]),
            DosingBlock(label: "Pediatric (autism + insomnia)", body: "1-3 mg PO 30 min before bed (extended-release formulations available); under specialist supervision per primary source.", citationIDs: ["specialty_round24"]),
            DosingBlock(label: "Delirium prevention (ICU / hospital elderly)", body: "0.5-3 mg PO at bedtime; some evidence reduces ICU delirium per primary source.", citationIDs: ["specialty_round24"]),
            DosingBlock(label: "Non-24-hour sleep-wake (Hetlioz brand)", body: "Tasimelteon 20 mg PO 1 hour before bedtime — different drug; FDA-approved for blind patients per primary source.", citationIDs: ["openfda_round24"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — autoimmune disease (theoretical immune effects), bleeding disorders / anticoagulation (theoretical), seizure disorder, depression (limited evidence); pregnancy / breastfeeding (limited safety data; supplement form not assured).",
            citationIDs: ["openfda_round24"]
        ),
        warnings: [
            AttributedBullet("DIETARY SUPPLEMENT (US) — NOT FDA-REGULATED for purity / potency / dose accuracy; quality varies dramatically by brand; some products contain serotonin contamination per primary source.", citationIDs: ["specialty_round24"]),
            AttributedBullet("BRAND VARIATION — choose USP-verified or third-party tested products; pediatric formulations have raised quality concerns.", citationIDs: ["specialty_round24"]),
            AttributedBullet("DROWSINESS / FATIGUE — daytime sedation if too high dose; counsel against driving until response known.", citationIDs: ["openfda_round24"]),
            AttributedBullet("VIVID DREAMS / NIGHTMARES — common; usually tolerated.", citationIDs: ["openfda_round24"]),
            AttributedBullet("HEADACHE — most common adverse effect.", citationIDs: ["openfda_round24"]),
            AttributedBullet("HORMONAL effects — possible suppression of LH / ovulation at high doses (theoretical contraceptive concern).", citationIDs: ["openfda_round24"]),
            AttributedBullet("PEDIATRIC OVERDOSE — increasing concerns; CDC warning rising emergency visits; KEEP OUT OF REACH OF CHILDREN per primary source.", citationIDs: ["cdc_round24"]),
            AttributedBullet("DEPRESSION — controversial; some report worsening; counsel + monitor mood.", citationIDs: ["specialty_round24"])
        ],
        adverseReactions: AttributedProse(
            "Headache, daytime drowsiness, dizziness, nausea, vivid dreams / nightmares, irritability, depression (controversial), reduced alertness; hormonal effects at high doses (theoretical); rare allergic reactions.",
            citationIDs: ["openfda_round24"]
        ),
        drugInteractions: [
            AttributedBullet("Other CNS DEPRESSANTS (alcohol, benzodiazepines, opioids) — additive sedation.", citationIDs: ["openfda_round24"]),
            AttributedBullet("ANTICOAGULANTS / antiplatelets — theoretical bleeding risk; clinically uncertain.", citationIDs: ["openfda_round24"]),
            AttributedBullet("CYP1A2 inhibitors (fluvoxamine, ciprofloxacin) — increase melatonin levels.", citationIDs: ["openfda_round24"]),
            AttributedBullet("DIABETES medications — theoretical glucose effects; monitor.", citationIDs: ["openfda_round24"]),
            AttributedBullet("ORAL CONTRACEPTIVES — increase melatonin levels (combined with E2).", citationIDs: ["openfda_round24"])
        ],
        nursingImplications: [
            AttributedBullet("START LOW (0.3-0.5 mg); titrate; doses >3 mg rarely more effective + can paradoxically worsen sleep + cause drug effects.", citationIDs: ["specialty_round24"]),
            AttributedBullet("TIMING — 30-60 min BEFORE desired sleep; not at sleep difficulty time.", citationIDs: ["specialty_round24"]),
            AttributedBullet("QUALITY — recommend USP-verified or third-party tested products; counsel patient.", citationIDs: ["specialty_round24"]),
            AttributedBullet("ELDERLY — endogenous melatonin declines; supplementation may help; lower dose 0.3-1 mg.", citationIDs: ["specialty_round24"]),
            AttributedBullet("ICU DELIRIUM — emerging evidence; consider as part of bundle.", citationIDs: ["specialty_round24"]),
            AttributedBullet("PEDIATRIC — under 5 mg generally; long-term safety in children not fully established; specialist consultation.", citationIDs: ["specialty_round24"]),
            AttributedBullet("KEEP OUT OF CHILDREN'S REACH — accidental ingestions rising; CDC warning.", citationIDs: ["cdc_round24"]),
            AttributedBullet("NON-PHARM measures first — sleep hygiene, light exposure schedule, CBT-I, daytime exercise.", citationIDs: ["specialty_round24"])
        ],
        patientTeaching: AttributedProse(
            "Take this 30-60 minutes BEFORE bedtime. Use a LOW dose (0.5-3 mg) — more is not better. Try sleep hygiene first — same bedtime, dark room, no screens. Quality varies — choose a brand with USP verification. Keep out of children's reach (accidental overdoses are rising). Tell us about depression, vivid nightmares, or daytime sleepiness.",
            citationIDs: ["openrn_pharm_round24"]
        ),
        citations: [openfdaR24, openrnPharmR24, cdcR24, specialtyR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum CapsaicinTopicalSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "capsaicin-topical",
        title: "Capsaicin topical (Zostrix, Qutenza)",
        subtitle: "TRPV1 agonist · neuropathic pain · OTC 0.025-0.075% + Rx 8% patch · burning common · gloves required",
        category: "Topical TRPV1 receptor agonist (neuropathic pain agent)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "TRPV1 (transient receptor potential vanilloid 1) agonist"),
            KeyValueRow(key: "Use", value: "Neuropathic pain — postherpetic neuralgia (PHN); diabetic peripheral neuropathy; osteoarthritis; chronic musculoskeletal pain"),
            KeyValueRow(key: "OTC dose", value: "0.025-0.075% cream / gel applied 3-4× daily"),
            KeyValueRow(key: "Rx Qutenza patch", value: "8% capsaicin patch applied for 30 min (PHN) or 60 min (diabetic neuropathy); single application; repeat q3 months"),
            KeyValueRow(key: "Watch", value: "BURNING + erythema common; AVOID eyes / mucous membranes; gloves essential")
        ],
        indications: AttributedProse(
            "Neuropathic pain — postherpetic neuralgia (PHN), diabetic peripheral neuropathy (Qutenza patch FDA-approved), HIV-associated neuropathy. Chronic musculoskeletal pain — osteoarthritis. Trigeminal neuralgia (off-label) per primary source.",
            citationIDs: ["specialty_round24", "openfda_round24"]
        ),
        mechanism: AttributedProse(
            "Selective TRPV1 receptor agonist on nociceptive sensory neurons → initial activation (burning) → defunctionalization + retraction of cutaneous nociceptive fibers (with continued exposure) → reduced pain signaling. Reversible over weeks to months after stopping.",
            citationIDs: ["openfda_round24"]
        ),
        dosing: [
            DosingBlock(label: "OTC cream / gel (0.025-0.075%)", body: "Apply thin layer to affected area 3-4× daily; rub in well; expect burning initially that decreases over 1-2 weeks per primary source.", citationIDs: ["specialty_round24"]),
            DosingBlock(label: "Qutenza 8% patch — postherpetic neuralgia", body: "Apply for 30-60 min in clinical setting (after topical lidocaine); repeat q3 months; up to 4 patches per application per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Qutenza 8% patch — diabetic peripheral neuropathy", body: "Apply for 30 min on feet; repeat q3 months as needed per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Pediatric", body: "Generally not first-line; OTC products available but limited pediatric data.", citationIDs: ["openfda_round24"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to capsaicin / chili peppers; broken / irritated / inflamed skin; application to eyes / mucous membranes; severe asthma (inhalation reactive). Caution — pregnancy (limited safety data); diabetic foot ulcers (avoid application to ulcerated skin) per primary source.",
            citationIDs: ["openfda_round24"]
        ),
        warnings: [
            AttributedBullet("BURNING + ERYTHEMA — common; usually decreases with continued use over 1-2 weeks; PRE-MEDICATE with topical lidocaine for 8% patch.", citationIDs: ["specialty_round24"]),
            AttributedBullet("WEAR GLOVES during application; AVOID eyes, mucous membranes, broken skin; wash hands thoroughly after; cover treated area.", citationIDs: ["specialty_round24"]),
            AttributedBullet("BLOOD PRESSURE elevation possible during 8% patch application — monitor BP; counsel.", citationIDs: ["openfda_round24"]),
            AttributedBullet("BRONCHOSPASM / cough — inhalation of aerosolized capsaicin; ventilation + mask in clinical setting.", citationIDs: ["openfda_round24"]),
            AttributedBullet("CARDIAC EVENTS rare — increased BP / ischemia in patients with severe / unstable cardiac disease; caution.", citationIDs: ["specialty_round24"]),
            AttributedBullet("AVOID with HEAT (heating pad, hot bath, sun) — increases burning + irritation.", citationIDs: ["specialty_round24"]),
            AttributedBullet("ONSET — significant relief takes 1-2 weeks of regular use; counsel patience.", citationIDs: ["specialty_round24"])
        ],
        adverseReactions: AttributedProse(
            "Application site burning, erythema, papules, pruritus, dry skin, nausea, hypertension (8% patch), cough, bronchospasm (rare), allergic reactions.",
            citationIDs: ["openfda_round24"]
        ),
        drugInteractions: [
            AttributedBullet("ACE inhibitors — controversial association with cough exacerbation; counsel.", citationIDs: ["openfda_round24"]),
            AttributedBullet("Other topical agents — apply separately.", citationIDs: ["openfda_round24"]),
            AttributedBullet("Heat / heating pads / bath / sun — additive irritation.", citationIDs: ["openfda_round24"])
        ],
        nursingImplications: [
            AttributedBullet("WEAR GLOVES during application + handling; counsel patient on hand washing.", citationIDs: ["specialty_round24"]),
            AttributedBullet("AVOID eyes, mucous membranes, broken skin; cover treated area to prevent transfer.", citationIDs: ["specialty_round24"]),
            AttributedBullet("INITIAL BURNING expected; pre-medication with topical lidocaine for 8% patch; cool compresses help OTC formulations.", citationIDs: ["specialty_round24"]),
            AttributedBullet("ONSET — full benefit 1-2 weeks of regular use; counsel + encourage adherence.", citationIDs: ["specialty_round24"]),
            AttributedBullet("8% PATCH — clinical setting application; monitor BP; have lidocaine + cooling available.", citationIDs: ["specialty_round24"]),
            AttributedBullet("AVOID heat exposure on treated area; counsel.", citationIDs: ["openrn_pharm_round24"]),
            AttributedBullet("Combine with other neuropathic pain agents (gabapentin, pregabalin, TCAs, SNRIs) for refractory.", citationIDs: ["specialty_round24"])
        ],
        patientTeaching: AttributedProse(
            "This medicine works on the nerves causing your pain. Use GLOVES when you put it on (or wash your hands really well right after). NEVER touch your eyes, mouth, or genitals after application. Burning is normal at first — it gets better in 1-2 weeks of regular use. Don't apply heat — it makes the burn worse.",
            citationIDs: ["openrn_pharm_round24"]
        ),
        citations: [openfdaR24, openrnPharmR24, cdcR24, specialtyR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum LidocainePatchSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "lidocaine-patch",
        title: "Lidocaine 5% patch (Lidoderm)",
        subtitle: "Topical local anesthetic patch · postherpetic neuralgia first-line · OA · 12 hrs on / 12 hrs off · minimal systemic",
        category: "Topical local anesthetic (sodium channel blocker)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Topical sodium channel blocker (amide local anesthetic)"),
            KeyValueRow(key: "Use", value: "Postherpetic neuralgia (FDA-approved); diabetic peripheral neuropathy (off-label); chronic musculoskeletal pain (off-label)"),
            KeyValueRow(key: "Dose", value: "Apply up to 3 patches at a time × 12 hours, then 12 hours off; max 3 patches"),
            KeyValueRow(key: "Watch", value: "Minimal systemic absorption (3% intact skin); skin reactions; AVOID damaged skin or extensive burns")
        ],
        indications: AttributedProse(
            "Postherpetic neuralgia (FDA-approved). Off-label — diabetic peripheral neuropathy, chronic musculoskeletal pain, low back pain, knee osteoarthritis. Adjunctive analgesic for localized neuropathic + nociceptive pain per primary source.",
            citationIDs: ["specialty_round24", "openfda_round24"]
        ),
        mechanism: AttributedProse(
            "Lidocaine — amide local anesthetic; blocks voltage-gated sodium channels on peripheral nerves → reduces pain signal transmission. Topical application → minimal systemic absorption (3% intact skin); local effect predominates.",
            citationIDs: ["openfda_round24"]
        ),
        dosing: [
            DosingBlock(label: "Postherpetic neuralgia", body: "Apply up to 3 patches at one time × 12 hours, then 12 hours patch-free; cover only painful area; cut to size if needed per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Off-label musculoskeletal", body: "Apply 1-3 patches to affected area × 12 hours; same on/off schedule per primary source.", citationIDs: ["specialty_round24"]),
            DosingBlock(label: "Pediatric", body: "Off-label; pediatric safety not established; use under specialty supervision.", citationIDs: ["openfda_round24"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to lidocaine / amide anesthetics. Caution — application to broken / inflamed / extensive eczematous skin (increased absorption); severe hepatic impairment (reduced clearance); concomitant Class I antiarrhythmics (additive sodium channel blockade).",
            citationIDs: ["openfda_round24"]
        ),
        warnings: [
            AttributedBullet("MINIMAL SYSTEMIC ABSORPTION on intact skin (~3%); but inflamed / damaged skin → higher absorption + systemic toxicity risk.", citationIDs: ["openfda_round24"]),
            AttributedBullet("APPLICATION SITE REACTIONS — erythema, edema, pruritus; usually mild; rotate sites.", citationIDs: ["openfda_round24"]),
            AttributedBullet("METHEMOGLOBINEMIA — rare with topical use; risk in G6PD deficient + cardiopulmonary disease + pediatric per primary source.", citationIDs: ["specialty_round24"]),
            AttributedBullet("ALLERGIC reactions — including amide anesthetic allergy; may cross-react with other amide anesthetics.", citationIDs: ["openfda_round24"]),
            AttributedBullet("HEAT exposure (heating pad, electric blanket, hot bath) — increases absorption + burns.", citationIDs: ["specialty_round24"]),
            AttributedBullet("DAMAGED SKIN / mucous membranes — significantly higher absorption; AVOID.", citationIDs: ["specialty_round24"]),
            AttributedBullet("CONCURRENT CLASS I antiarrhythmics (mexiletine, tocainide) — additive systemic effects; caution.", citationIDs: ["openfda_round24"])
        ],
        adverseReactions: AttributedProse(
            "Application site erythema, pruritus, paresthesia, edema; rare systemic — drowsiness, dizziness, methemoglobinemia, allergic reactions; arrhythmia (rare with overdose).",
            citationIDs: ["openfda_round24"]
        ),
        drugInteractions: [
            AttributedBullet("CLASS I ANTIARRHYTHMICS — additive sodium channel blockade.", citationIDs: ["openfda_round24"]),
            AttributedBullet("Other AMIDE LOCAL ANESTHETICS — additive systemic effects + cross-reactivity.", citationIDs: ["openfda_round24"]),
            AttributedBullet("CYP1A2 / 3A4 inhibitors — modest impact on lidocaine metabolism.", citationIDs: ["openfda_round24"]),
            AttributedBullet("Sulfonamides, dapsone, benzocaine — additive methemoglobinemia risk in selected.", citationIDs: ["openfda_round24"])
        ],
        nursingImplications: [
            AttributedBullet("APPLY to clean dry intact skin only; DO NOT apply to broken / inflamed / extensive damaged skin.", citationIDs: ["specialty_round24"]),
            AttributedBullet("Cut patch to fit affected area; max 3 patches simultaneously.", citationIDs: ["openrn_pharm_round24"]),
            AttributedBullet("12 HOURS ON / 12 HOURS OFF schedule — adherence critical for safety; counsel.", citationIDs: ["specialty_round24"]),
            AttributedBullet("AVOID heat exposure on patch — increases absorption.", citationIDs: ["specialty_round24"]),
            AttributedBullet("DISPOSE used patches safely — wrap in foil or plastic; drug residual could be ingested by children / pets.", citationIDs: ["openrn_pharm_round24"]),
            AttributedBullet("MONITOR — pain relief, skin reactions, signs of systemic toxicity (rare).", citationIDs: ["specialty_round24"]),
            AttributedBullet("Combine with oral neuropathic pain agents (gabapentin, pregabalin) for refractory.", citationIDs: ["specialty_round24"])
        ],
        patientTeaching: AttributedProse(
            "Apply this patch to the painful area on clean dry skin (no rashes or cuts). You can cut it to fit. Wear it for 12 hours, then take it off for 12 hours. Don't use a heating pad on the patch — it increases the medicine in your blood. Throw used patches in foil or plastic so kids / pets don't get them.",
            citationIDs: ["openrn_pharm_round24"]
        ),
        citations: [openfdaR24, openrnPharmR24, cdcR24, specialtyR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum DiclofenacTopicalSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "diclofenac-topical",
        title: "Diclofenac topical 1% gel (Voltaren gel)",
        subtitle: "Topical NSAID · OTC since 2020 · OA hands + knees · LOWER systemic risk vs oral NSAID · safer in elderly + CKD",
        category: "Topical NSAID (cyclooxygenase inhibitor)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Topical NSAID (cyclooxygenase inhibitor)"),
            KeyValueRow(key: "Use", value: "Osteoarthritis pain — hands, knees, ankles, feet, elbows, wrists; localized musculoskeletal pain; preferred in elderly + CKD vs oral NSAIDs"),
            KeyValueRow(key: "Dose", value: "2-4 g (4 cm to upper body / 8 cm to lower body) applied 4× daily; OTC available 1%"),
            KeyValueRow(key: "Watch", value: "Lower systemic absorption (~10%); but black-box warnings still apply (cardiac, GI bleed) at high doses; not for back/spine/hip OA")
        ],
        indications: AttributedProse(
            "Topical treatment of osteoarthritis pain — labeled for hands, knees, ankles, feet, elbows, wrists (joints amenable to topical application). NOT effective for hip / spine OA (too deep). FIRST-LINE in elderly + CKD per AGS Beers + ACR guidelines per primary source.",
            citationIDs: ["specialty_round24", "openfda_round24"]
        ),
        mechanism: AttributedProse(
            "NSAID — inhibits COX-1 + COX-2 → reduces prostaglandin synthesis → reduces inflammation + pain. Topical application → ~10% systemic absorption (vs 100% oral) → lower GI / renal / CV risk while providing local benefit.",
            citationIDs: ["openfda_round24"]
        ),
        dosing: [
            DosingBlock(label: "Hands, wrists, elbows", body: "2 g (4 cm) applied 4× daily; max 8 g/day per joint per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Knees, ankles, feet", body: "4 g (8 cm) applied 4× daily; max 16 g/day per lower extremity joint per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Total daily limit", body: "Max 32 g/day across all joints to limit systemic exposure.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Pediatric", body: "Not established for pediatric use.", citationIDs: ["openfda_round24"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to NSAIDs / aspirin / asthma triad (Samter's); broken / inflamed skin at application site; pregnancy 3rd trimester (premature ductus closure — even topical); active GI bleeding; severe CKD; severe hepatic impairment per primary source.",
            citationIDs: ["openfda_round24"]
        ),
        warnings: [
            AttributedBullet("BLACK-BOX WARNINGS for NSAIDs — cardiac (MI, stroke, HF) + GI (bleed, perforation, ulcer); LOWER risk topical vs oral but NOT zero per primary source.", citationIDs: ["openfda_round24"]),
            AttributedBullet("RENAL toxicity — lower risk than oral; still possible at high cumulative doses; caution in CKD.", citationIDs: ["specialty_round24"]),
            AttributedBullet("HEPATOTOXICITY — rare with topical use; LFT monitoring not routine.", citationIDs: ["openfda_round24"]),
            AttributedBullet("APPLICATION SITE — erythema, pruritus, dermatitis; usually mild + transient.", citationIDs: ["openfda_round24"]),
            AttributedBullet("PHOTOSENSITIVITY at application sites — counsel sun protection.", citationIDs: ["openfda_round24"]),
            AttributedBullet("DON'T APPLY to broken / inflamed / wounded skin — increases absorption.", citationIDs: ["specialty_round24"]),
            AttributedBullet("AVOID concomitant ORAL NSAIDs — combined exposure raises systemic risk.", citationIDs: ["specialty_round24"]),
            AttributedBullet("AVOID heat / occlusive dressings on application area — increases absorption.", citationIDs: ["specialty_round24"])
        ],
        adverseReactions: AttributedProse(
            "Application site reactions (erythema, pruritus, dryness, rash), photosensitivity at site; rare GI / renal / cardiac with high cumulative use; allergic reactions.",
            citationIDs: ["openfda_round24"]
        ),
        drugInteractions: [
            AttributedBullet("ORAL NSAIDs — additive systemic risk; combined use generally avoided.", citationIDs: ["specialty_round24"]),
            AttributedBullet("WARFARIN — possible interaction; INR monitoring.", citationIDs: ["openfda_round24"]),
            AttributedBullet("ACE inhibitors / ARBs / DIURETICS — reduced antihypertensive effect; renal risk in elderly + CKD.", citationIDs: ["openfda_round24"]),
            AttributedBullet("LITHIUM — increased levels.", citationIDs: ["openfda_round24"])
        ],
        nursingImplications: [
            AttributedBullet("APPLY to CLEAN DRY INTACT skin only; gently massage in.", citationIDs: ["openrn_pharm_round24"]),
            AttributedBullet("Wash hands thoroughly after application (unless treating hand OA — leave on hands without washing).", citationIDs: ["openrn_pharm_round24"]),
            AttributedBullet("AVOID water exposure × 1 hour after application — improves absorption.", citationIDs: ["openrn_pharm_round24"]),
            AttributedBullet("RECOMMENDED in elderly + CKD over oral NSAIDs per AGS Beers per primary source.", citationIDs: ["specialty_round24"]),
            AttributedBullet("ASSESS for adequate trial — 2-4 weeks of regular use before assessing efficacy.", citationIDs: ["specialty_round24"]),
            AttributedBullet("AVOID concurrent oral NSAIDs.", citationIDs: ["specialty_round24"]),
            AttributedBullet("Counsel — apply BEFORE activities that cause pain; preventive vs reactive use.", citationIDs: ["specialty_round24"])
        ],
        patientTeaching: AttributedProse(
            "Apply the gel to your knee, hand, or other painful joint and rub it in well. Wash your hands afterward (unless you're treating your hands). Don't get the area wet for at least 1 hour. Don't take other NSAIDs (Advil, Aleve) at the same time — they add up. Topical NSAID is safer than pills for older adults.",
            citationIDs: ["openrn_pharm_round24"]
        ),
        citations: [openfdaR24, openrnPharmR24, cdcR24, specialtyR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum GlycopyrrolateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "glycopyrrolate",
        title: "Glycopyrrolate (Robinul)",
        subtitle: "Quaternary anticholinergic · doesn't cross BBB · terminal secretions + drooling + bowel · safer in elderly than scopolamine",
        category: "Quaternary ammonium anticholinergic / antimuscarinic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Quaternary ammonium anticholinergic — does not cross blood-brain barrier"),
            KeyValueRow(key: "Use", value: "Terminal secretions in palliative care; chronic drooling (Cuvposa); preoperative antisialagogue; reverse neostigmine effects; reduce GI motility / secretion"),
            KeyValueRow(key: "Palliative dose", value: "0.1-0.4 mg SC/IV q4-8h PRN; transdermal 1.5 mg patch"),
            KeyValueRow(key: "Pediatric drooling", value: "Cuvposa oral 0.02-0.1 mg/kg PO TID"),
            KeyValueRow(key: "Watch", value: "Anticholinergic — dry mouth, urinary retention, constipation, blurred vision; safer in elderly than scopolamine (no CNS effects)")
        ],
        indications: AttributedProse(
            "Reduce respiratory secretions in dying / palliative care patients (terminal secretions / death rattle); chronic drooling in pediatric neurological disorders (Cuvposa, oral); preoperative antisialagogue (anesthesia); concomitant administration with neostigmine to block muscarinic effects (reversal of neuromuscular blockade); reduce gastric acid + motility per primary source.",
            citationIDs: ["specialty_round24", "openfda_round24"]
        ),
        mechanism: AttributedProse(
            "Quaternary amine antimuscarinic agent — blocks acetylcholine at peripheral muscarinic receptors → reduces salivary, bronchial, gastric secretions + GI motility + ureteral / urinary tone. Quaternary structure → does NOT cross blood-brain barrier (vs scopolamine, atropine — tertiary amines cross) → no central anticholinergic effects.",
            citationIDs: ["openfda_round24"]
        ),
        dosing: [
            DosingBlock(label: "Terminal secretions (palliative)", body: "0.1-0.4 mg SC/IV q4-8h PRN OR continuous SC infusion 0.4-1.2 mg/24h per primary source.", citationIDs: ["specialty_round24"]),
            DosingBlock(label: "Cuvposa oral (chronic drooling — pediatric)", body: "0.02-0.1 mg/kg PO TID with titration; max 3 mg per dose per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Preoperative antisialagogue", body: "0.004 mg/kg IM 30-60 min before anesthesia (adult typically 0.2-0.3 mg).", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Block neostigmine muscarinic effects", body: "0.2 mg IV per 1 mg neostigmine OR 0.005 mg/kg IV.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Pediatric drooling (off-label)", body: "0.04-0.1 mg/kg PO BID-TID; titrate per primary source.", citationIDs: ["specialty_round24"])
        ],
        contraindications: AttributedProse(
            "Narrow-angle glaucoma; obstructive uropathy (BPH, urinary obstruction); paralytic ileus; severe ulcerative colitis (toxic megacolon); myasthenia gravis (worsens weakness if combined with anti-AChE inhibitors used in MG); hypersensitivity per primary source.",
            citationIDs: ["openfda_round24"]
        ),
        warnings: [
            AttributedBullet("ANTICHOLINERGIC — dry mouth, urinary retention, constipation, blurred vision; manage proactively.", citationIDs: ["specialty_round24"]),
            AttributedBullet("DOES NOT cross BBB — safer in elderly + critically ill than scopolamine / atropine; preferred for confused / delirious patients per primary source.", citationIDs: ["specialty_round24"]),
            AttributedBullet("URINARY RETENTION — caution in BPH; monitor; bladder ultrasound if concerned.", citationIDs: ["openfda_round24"]),
            AttributedBullet("HEAT INTOLERANCE — reduces sweating; caution in hot weather + elderly.", citationIDs: ["openfda_round24"]),
            AttributedBullet("CONFUSION (rare) — usually not since doesn't cross BBB; rare reports in severe systemic absorption.", citationIDs: ["openfda_round24"]),
            AttributedBullet("CARDIOVASCULAR — tachycardia, palpitations.", citationIDs: ["openfda_round24"]),
            AttributedBullet("DOWN SYNDROME — increased sensitivity to anticholinergic effects; lower doses.", citationIDs: ["openfda_round24"])
        ],
        adverseReactions: AttributedProse(
            "Dry mouth (very common), urinary retention, constipation, blurred vision, photophobia, decreased sweating, tachycardia, dizziness; rare CNS effects.",
            citationIDs: ["openfda_round24"]
        ),
        drugInteractions: [
            AttributedBullet("Other ANTICHOLINERGICS (TCAs, antihistamines, antipsychotics) — additive anticholinergic burden.", citationIDs: ["openfda_round24"]),
            AttributedBullet("PROKINETICS (metoclopramide) — antagonized.", citationIDs: ["openfda_round24"]),
            AttributedBullet("CHOLINESTERASE INHIBITORS (donepezil, rivastigmine) — antagonized.", citationIDs: ["specialty_round24"]),
            AttributedBullet("SLOWED gastric emptying — affects oral absorption of other drugs.", citationIDs: ["openfda_round24"])
        ],
        nursingImplications: [
            AttributedBullet("PALLIATIVE \"DEATH RATTLE\" — start glycopyrrolate or scopolamine; glycopyrrolate preferred when patient still responsive (no CNS effects); reposition + suction adjunctive.", citationIDs: ["specialty_round24"]),
            AttributedBullet("PEDIATRIC CHRONIC DROOLING — improves QOL in cerebral palsy + neurological disabilities; titrate carefully.", citationIDs: ["specialty_round24"]),
            AttributedBullet("MONITOR — secretions, urinary retention, bowel function, mental status, vital signs.", citationIDs: ["specialty_round24"]),
            AttributedBullet("PROACTIVE side-effect management — oral hygiene + sips for dry mouth; bladder scans for urinary retention; senna prophylactically.", citationIDs: ["specialty_round24"]),
            AttributedBullet("OFF-LABEL terminal secretions usually IV / SC; oral less common in EOL.", citationIDs: ["specialty_round24"]),
            AttributedBullet("DISCUSSION with family — terminal secretions are NOT distressing for the patient (unconscious); reposition + medications help peace for FAMILY.", citationIDs: ["specialty_round24"])
        ],
        patientTeaching: AttributedProse(
            "This medicine reduces saliva and other secretions. For patients near end of life, it helps with the gurgling sound from secretions. Side effects include dry mouth, blurred vision, and difficulty urinating. The gurgling sound usually doesn't bother your loved one — but this helps it be more peaceful for the family.",
            citationIDs: ["openrn_pharm_round24"]
        ),
        citations: [openfdaR24, openrnPharmR24, cdcR24, specialtyR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum FentanylPatchSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "fentanyl-patch",
        title: "Fentanyl transdermal patch (Duragesic)",
        subtitle: "Long-acting opioid · CHRONIC pain in OPIOID-TOLERANT only · 12-25-50-75-100 mcg/h · 72h application · BOXED death from accidental ingestion",
        category: "Long-acting transdermal opioid (μ-receptor agonist)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Long-acting μ-opioid receptor agonist (transdermal patch)"),
            KeyValueRow(key: "Use", value: "Severe CHRONIC pain in OPIOID-TOLERANT patients; cancer + non-cancer pain; PALLIATIVE care"),
            KeyValueRow(key: "Strengths", value: "12, 25, 50, 75, 100 mcg/hour; applied q72 hrs"),
            KeyValueRow(key: "OPIOID-NAIVE", value: "ABSOLUTELY CONTRAINDICATED — fatal respiratory depression"),
            KeyValueRow(key: "Boxed", value: "Death from accidental ingestion (especially children); respiratory depression; NOT for opioid-naive; NOT for acute pain"),
            KeyValueRow(key: "ONSET", value: "12-24 hrs; peak 24-72 hrs; offset slow after removal (2-3 days residual effect)")
        ],
        indications: AttributedProse(
            "Severe, persistent pain in OPIOID-TOLERANT patients (≥60 mg morphine equivalent daily for ≥1 week) — chronic cancer pain, palliative care, severe chronic non-cancer pain when other opioids inadequate per primary source.",
            citationIDs: ["specialty_round24", "openfda_round24"]
        ),
        mechanism: AttributedProse(
            "Synthetic μ-opioid agonist; ~80-100× more potent than morphine. Transdermal delivery system → continuous absorption through skin into systemic circulation → onset 12-24 hrs; steady-state 24-72 hrs; lasts 72 hrs per patch. Slow offset after removal (subcutaneous depot effect).",
            citationIDs: ["openfda_round24"]
        ),
        dosing: [
            DosingBlock(label: "Conversion from oral morphine equivalents", body: "Use conversion tables; approximately 60 mg oral morphine/day = 25 mcg/hr fentanyl patch per primary source.", citationIDs: ["specialty_round24"]),
            DosingBlock(label: "Initial dose", body: "12-25 mcg/hr q72h for opioid-tolerant patient on lower morphine equivalents; titrate per primary source.", citationIDs: ["specialty_round24"]),
            DosingBlock(label: "Cumulative dose", body: "Multiple patches if higher dose needed (e.g., 100 + 75 mcg/hr); maximum varies per institution.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Pediatric (≥2 years)", body: "OPIOID-TOLERANT only; conversion 30 mg morphine PO/day = 12.5 mcg/hr patch; specialty supervision.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Replace q72 hrs", body: "Apply at same time q72 hrs; max 72-hour interval (sometimes 48 hours in selected patients with rapid metabolism).", citationIDs: ["openfda_round24"])
        ],
        contraindications: AttributedProse(
            "OPIOID-NAIVE PATIENTS (FATAL); MILD / INTERMITTENT / ACUTE PAIN; postoperative pain; severe respiratory depression; severe asthma / COPD; paralytic ileus; hypersensitivity per primary source.",
            citationIDs: ["openfda_round24"]
        ),
        warnings: [
            AttributedBullet("BOXED — DEATH from RESPIRATORY DEPRESSION; OPIOID-NAIVE patients absolutely contraindicated per primary source.", citationIDs: ["openfda_round24"]),
            AttributedBullet("BOXED — ACCIDENTAL EXPOSURE / ingestion (especially children) → fatal; secure storage + safe disposal critical; old patches still contain significant fentanyl.", citationIDs: ["openfda_round24"]),
            AttributedBullet("BOXED — CYP3A4 inhibitors increase fentanyl levels → respiratory depression; ketoconazole, ritonavir, clarithromycin, grapefruit per primary source.", citationIDs: ["openfda_round24"]),
            AttributedBullet("BOXED — concurrent benzodiazepines / CNS depressants → fatal respiratory depression; minimize concurrent use.", citationIDs: ["openfda_round24"]),
            AttributedBullet("HEAT EXPOSURE → increased absorption + respiratory depression / overdose; AVOID heating pads, electric blankets, hot baths, fever, sun exposure.", citationIDs: ["specialty_round24"]),
            AttributedBullet("CACHEXIA / decreased subcutaneous fat — variable absorption; reduce dose.", citationIDs: ["specialty_round24"]),
            AttributedBullet("FEVER ≥38°C — increased absorption; consider dose reduction or alternative.", citationIDs: ["openfda_round24"]),
            AttributedBullet("SLOW ONSET (12-24 hrs) — pain control gap; bridge with short-acting opioid.", citationIDs: ["specialty_round24"]),
            AttributedBullet("SLOW OFFSET (2-3 days residual) — overdose continues after patch removed.", citationIDs: ["specialty_round24"]),
            AttributedBullet("DRY skin / ABSORBENT site — apply to upper torso / arms; AVOID over hair, broken / inflamed / scarred / shaved skin.", citationIDs: ["openfda_round24"])
        ],
        adverseReactions: AttributedProse(
            "Respiratory depression (potentially fatal), constipation, nausea, vomiting, sedation, dizziness, application site reactions (erythema, pruritus), urinary retention, hypotension, hyperalgesia, addiction / dependence / withdrawal.",
            citationIDs: ["openfda_round24"]
        ),
        drugInteractions: [
            AttributedBullet("CYP3A4 INHIBITORS — significantly increase fentanyl levels; reduce dose / use alternative.", citationIDs: ["openfda_round24"]),
            AttributedBullet("CYP3A4 INDUCERS — decrease levels; insufficient analgesia.", citationIDs: ["openfda_round24"]),
            AttributedBullet("BENZODIAZEPINES, CNS DEPRESSANTS — fatal respiratory depression; minimize.", citationIDs: ["openfda_round24"]),
            AttributedBullet("MAOIs — serotonin syndrome / hypertensive crisis; avoid within 14 days.", citationIDs: ["openfda_round24"]),
            AttributedBullet("ALCOHOL — additive sedation; counsel.", citationIDs: ["openfda_round24"])
        ],
        nursingImplications: [
            AttributedBullet("VERIFY OPIOID-TOLERANT before first patch — never opioid-naive per primary source.", citationIDs: ["specialty_round24"]),
            AttributedBullet("APPLY to clean dry intact non-hairy skin (upper arms, chest, back); rotate sites q72 hrs; AVOID heat exposure.", citationIDs: ["openfda_round24"]),
            AttributedBullet("REMOVE OLD PATCH before applying new — fatal overdose if multiple patches accidentally; FOLD STICKY SIDES TOGETHER + flush down toilet for safe disposal per FDA.", citationIDs: ["openfda_round24"]),
            AttributedBullet("BRIDGE with short-acting opioid × 12-24 hrs — patch onset slow.", citationIDs: ["specialty_round24"]),
            AttributedBullet("Co-prescribe NALOXONE — respiratory depression risk; counsel family.", citationIDs: ["specialty_round24"]),
            AttributedBullet("Co-prescribe LAXATIVES (senna + softener) prophylactically — opioid-induced constipation universal.", citationIDs: ["specialty_round24"]),
            AttributedBullet("MONITOR — pain, sedation, respirations, opioid side effects, signs of overdose (RR <8-12, pinpoint pupils, sedation).", citationIDs: ["specialty_round24"]),
            AttributedBullet("FEVER + heat exposure → increased absorption; REMOVE patch + reassess pain control + consider alternative.", citationIDs: ["specialty_round24"]),
            AttributedBullet("CHILD / pet safety — patches kept locked away; counsel family rigorously about ingestion / contact risk.", citationIDs: ["specialty_round24"]),
            AttributedBullet("DISCONTINUATION — slow taper; symptoms continue 2-3 days after removal due to depot.", citationIDs: ["specialty_round24"])
        ],
        patientTeaching: AttributedProse(
            "This patch contains a STRONG long-acting pain medicine. NEVER let children or pets touch it — they can die. Apply to clean dry skin on your chest, back, or upper arm (no hair). Wear it for 3 days, then remove + apply a new one in a different spot. NO heating pads, NO hot baths, NO electric blankets — heat releases more medicine + can cause overdose. When you remove the old patch, fold sticky-sides together + flush down toilet. Always have naloxone available + tell family how to use it.",
            citationIDs: ["openrn_pharm_round24"]
        ),
        citations: [openfdaR24, openrnPharmR24, cdcR24, specialtyR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum NaproxenSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "naproxen",
        title: "Naproxen (Aleve, Naprosyn)",
        subtitle: "OTC + Rx NSAID · longer half-life than ibuprofen · GI bleed + cardiac + renal risk · LOWER CV risk than other NSAIDs · gastric protection in elderly",
        category: "Non-selective NSAID (cyclooxygenase inhibitor)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Non-selective NSAID — COX-1 + COX-2 inhibitor"),
            KeyValueRow(key: "Use", value: "Mild-moderate pain, fever, inflammation; OA, RA, gout, dysmenorrhea, headaches, musculoskeletal pain"),
            KeyValueRow(key: "OTC dose", value: "220-440 mg PO q8-12h; max OTC 660 mg/day × 10 days"),
            KeyValueRow(key: "Rx dose", value: "250-500 mg PO BID; max 1500 mg/day chronic; 1000 mg/day for OA"),
            KeyValueRow(key: "Watch", value: "GI bleed (highest oral NSAID risk), CV events (lower than other NSAIDs per FDA), renal toxicity, HTN, fluid retention"),
            KeyValueRow(key: "Note", value: "Half-life 12-17 hours — longer dosing intervals than ibuprofen")
        ],
        indications: AttributedProse(
            "Mild-to-moderate pain, fever reduction, anti-inflammatory effect. Conditions — osteoarthritis, rheumatoid arthritis, ankylosing spondylitis, juvenile arthritis, gout / pseudo-gout flare, dysmenorrhea, tendinitis / bursitis, headache, musculoskeletal injuries per primary source.",
            citationIDs: ["specialty_round24", "openfda_round24"]
        ),
        mechanism: AttributedProse(
            "Non-selective NSAID — inhibits both COX-1 + COX-2 → reduces prostaglandin synthesis → anti-inflammatory + analgesic + antipyretic. Reversible inhibition of platelet COX-1 → modest antiplatelet effect (less than aspirin's irreversible inhibition).",
            citationIDs: ["openfda_round24"]
        ),
        dosing: [
            DosingBlock(label: "OTC (Aleve)", body: "220 mg PO q8-12h or 440 mg PO once daily; max 660 mg/day × 10 days for self-treatment per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Rx — pain + acute inflammation", body: "500 mg PO × 1, then 250 mg PO q6-8h; max 1250 mg first 24 hrs, 1000 mg/day chronic per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Osteoarthritis / RA chronic", body: "250-500 mg PO BID; max 1000 mg/day per primary source.", citationIDs: ["openfda_round24"]),
            DosingBlock(label: "Acute gout flare", body: "750 mg PO × 1, then 250 mg q8h until resolution per primary source.", citationIDs: ["specialty_round24"]),
            DosingBlock(label: "Pediatric JIA (≥2 yrs)", body: "5-7 mg/kg PO BID per primary source.", citationIDs: ["specialty_round24"])
        ],
        contraindications: AttributedProse(
            "Active GI bleeding / peptic ulcer; recent CABG; severe heart failure; hypersensitivity to NSAIDs / aspirin / asthma triad; 3rd trimester pregnancy (premature ductus closure); severe renal impairment; severe hepatic impairment per primary source.",
            citationIDs: ["openfda_round24"]
        ),
        warnings: [
            AttributedBullet("BLACK-BOX — CARDIOVASCULAR THROMBOTIC events (MI, stroke); per FDA naproxen has LOWER CV risk than other NSAIDs but still elevated; minimize duration + dose; AVOID in established CV disease per primary source.", citationIDs: ["openfda_round24"]),
            AttributedBullet("BLACK-BOX — CABG perioperative use contraindicated.", citationIDs: ["openfda_round24"]),
            AttributedBullet("BLACK-BOX — GI BLEED + ULCER + PERFORATION — naproxen has HIGHEST GI risk among non-selective oral NSAIDs per primary source.", citationIDs: ["specialty_round24"]),
            AttributedBullet("RENAL toxicity — AKI, interstitial nephritis, papillary necrosis; caution in elderly + CKD + diabetes + dehydration + concurrent ACE/ARB/diuretic.", citationIDs: ["specialty_round24"]),
            AttributedBullet("HTN — increases BP; counsel + monitor.", citationIDs: ["openfda_round24"]),
            AttributedBullet("FLUID RETENTION + HF exacerbation.", citationIDs: ["openfda_round24"]),
            AttributedBullet("HEPATOTOXICITY — rare; LFTs if symptoms.", citationIDs: ["openfda_round24"]),
            AttributedBullet("HYPERSENSITIVITY — Samter's triad (asthma + nasal polyps + ASA sensitivity); avoid all NSAIDs.", citationIDs: ["openfda_round24"]),
            AttributedBullet("PREGNANCY — Category C 1st-2nd trimester; avoid 3rd trimester (premature ductus closure, oligohydramnios, fetal renal injury) per primary source.", citationIDs: ["specialty_round24"]),
            AttributedBullet("ELDERLY — high-risk for adverse effects; per AGS Beers POTENTIALLY INAPPROPRIATE in elderly without GI / CV protection; consider topical NSAID alternative.", citationIDs: ["specialty_round24"]),
            AttributedBullet("Hepatic / renal — monitor + dose adjust.", citationIDs: ["openfda_round24"])
        ],
        adverseReactions: AttributedProse(
            "GI — dyspepsia, nausea, abdominal pain, ulcer, bleed, perforation; CV — HTN, edema, MI / stroke risk; renal — AKI; CNS — dizziness, headache, drowsiness; allergic reactions; prolonged bleeding (antiplatelet effect).",
            citationIDs: ["openfda_round24"]
        ),
        drugInteractions: [
            AttributedBullet("ANTICOAGULANTS, ANTIPLATELETS — additive bleeding risk; avoid concurrent.", citationIDs: ["openfda_round24"]),
            AttributedBullet("ASPIRIN — naproxen blocks aspirin's irreversible COX-1 binding → reduces cardioprotective effect; if both needed, take ASA first then wait 30 min.", citationIDs: ["specialty_round24"]),
            AttributedBullet("ACE INHIBITORS / ARBs — reduced antihypertensive effect; renal toxicity risk.", citationIDs: ["openfda_round24"]),
            AttributedBullet("DIURETICS — reduced effect + renal risk.", citationIDs: ["openfda_round24"]),
            AttributedBullet("LITHIUM — increased lithium levels.", citationIDs: ["openfda_round24"]),
            AttributedBullet("METHOTREXATE — increased toxicity.", citationIDs: ["openfda_round24"]),
            AttributedBullet("CYCLOSPORINE — additive nephrotoxicity.", citationIDs: ["openfda_round24"])
        ],
        nursingImplications: [
            AttributedBullet("LOWEST EFFECTIVE DOSE × shortest duration to minimize CV + GI risk per primary source.", citationIDs: ["specialty_round24"]),
            AttributedBullet("TAKE WITH FOOD or milk to reduce GI upset.", citationIDs: ["openrn_pharm_round24"]),
            AttributedBullet("ELDERLY + CKD + diabetes + CV disease — consider topical diclofenac OR acetaminophen alternative.", citationIDs: ["specialty_round24"]),
            AttributedBullet("GASTRIC PROTECTION — co-prescribe PPI for chronic NSAIDs in patients >60, prior PUD, anticoagulation, concurrent steroids per primary source.", citationIDs: ["specialty_round24"]),
            AttributedBullet("MONITOR — BP, weight, edema, CBC, renal function, LFTs (chronic users); GI symptoms; cardiac symptoms.", citationIDs: ["specialty_round24"]),
            AttributedBullet("ASPIRIN coadministration — take ASA 30 min BEFORE naproxen for cardioprotection; prefer alternative analgesic in patients on cardioprotective ASA.", citationIDs: ["specialty_round24"]),
            AttributedBullet("HOLD pre-op — discontinue 1 week before elective surgery (longer half-life than ibuprofen).", citationIDs: ["specialty_round24"])
        ],
        patientTeaching: AttributedProse(
            "Take this with food. Don't take it with other NSAIDs (Advil, Motrin). Tell us about black stools, vomiting blood, severe stomach pain, swelling in legs, weight gain, chest pain, or shortness of breath. Don't take in late pregnancy. If you take baby aspirin for your heart, take it 30 minutes BEFORE this medicine. For older adults — topical NSAID gel may be safer.",
            citationIDs: ["openrn_pharm_round24"]
        ),
        citations: [openfdaR24, openrnPharmR24, cdcR24, specialtyR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}
