import Foundation

// Curator-model toxicology diagnosis entries. Audit found the tox library
// deep (TCA, CO, organophosphate, serotonin syndrome, NMS, MH, lithium) but
// missing the most common and most testable poisonings: acetaminophen, aspirin,
// digoxin, iron, CCB/beta-blocker, toxic alcohols, anticholinergics, and a
// toxidrome pattern reference (alcohol withdrawal and sympathomimetic toxicity
// were already covered elsewhere and are not duplicated here). Per Apple 1.4.2,
// antidotes are named conceptually and doses deferred to protocol/poison-control
// — no patient-specific dose math. Sources: Open RN Health Alterations (CC BY
// 4.0), CDC public domain, AACT/ACMT + poison-control concept citations.
// Tier-A RN review pending (all entries are high-alert emergency content).

private let openrnTox = CitationSource(
    id: "openrn_toxicology",
    shortName: "Open RN Health Alterations — Toxicology & Emergency chapters",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-07-03"
)
private let poisonControl = CitationSource(
    id: "poison_control_concept",
    shortName: "AACT / ACMT / U.S. Poison Control (concept citation only)",
    detail: "American Association of Poison Control Centers — 1-800-222-1222; management is directed by regional poison control / medical toxicology",
    publisher: "American Association of Poison Control Centers",
    license: .factCitationOnly,
    url: "https://www.poison.org/",
    lastRetrieved: "2026-07-03"
)
private let cdcTox = CitationSource(
    id: "cdc_toxicology",
    shortName: "CDC injury & poisoning prevention guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-07-03"
)

private let toxTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .safety)
private let toxPerfusionTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let toxPharmTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)

// MARK: - Acetaminophen overdose

public enum AcetaminophenOverdoseSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "acetaminophen-overdose",
        title: "Acetaminophen overdose",
        subtitle: "Most common overdose · a time-critical antidote and a deceptively well-looking early phase",
        nclexTags: toxTags,
        definition: AttributedProse(
            "Acetaminophen (APAP) is one of the most common intentional and unintentional overdoses and a leading cause of acute liver failure. Its danger lies in the mismatch between how well the patient looks in the first day and the hepatic catastrophe that can follow — and in an antidote whose effectiveness depends on starting early.",
            citationIDs: ["openrn_toxicology", "poison_control_concept"]
        ),
        pathophysiology: AttributedProse(
            "Most acetaminophen is metabolized safely, but a fraction becomes the reactive metabolite NAPQI, which glutathione normally neutralizes. In overdose, glutathione is depleted, NAPQI accumulates, and it causes centrilobular hepatocellular necrosis. N-acetylcysteine (NAC) works by replenishing glutathione and scavenging NAPQI — which is why it is far more effective given early, before injury is established. Serum level plotted on the treatment nomogram (against time since a single acute ingestion) guides the decision to treat.",
            citationIDs: ["openrn_toxicology", "poison_control_concept"]
        ),
        presentation: [
            AttributedBullet("Phase 1 (first ~24 hr): often asymptomatic or mild — nausea, vomiting, malaise. The patient looks deceptively well, which is the trap.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Phase 2 (~24–72 hr): right upper quadrant pain and rising liver enzymes as hepatic injury develops, sometimes as overt symptoms fade.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Phase 3 (~72–96 hr): peak hepatotoxicity — jaundice, coagulopathy, encephalopathy, possible acute liver failure and renal injury; this is when deaths occur.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Phase 4 (~4 days–2 weeks): recovery for survivors, or progression to fulminant failure.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("High-risk features: chronic alcohol use, malnutrition, staggered/repeated supratherapeutic ingestion, and co-ingestants that delay gastric emptying.", citationIDs: ["poison_control_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serum acetaminophen level timed to the ingestion, interpreted on the treatment nomogram for a single acute ingestion; levels drawn too early (before ~4 hr) can mislead.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Liver function tests (AST/ALT), INR, renal function, and glucose to gauge injury and trend it.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Universal co-ingestant screen (this is a self-harm-prone drug): salicylate level, and consider others; the history in overdose is unreliable.", citationIDs: ["openrn_toxicology"])
        ],
        priorityAssessments: [
            AttributedBullet("Establish time and pattern of ingestion as precisely as possible — single acute vs. staggered changes how the level is interpreted.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Trend hepatic and coagulation markers, mental status (encephalopathy), and urine output; watch for the phase-3 turn even as early symptoms improve.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Assess psychosocial safety in intentional ingestion — suicide risk assessment and one-to-one observation per policy.", citationIDs: ["openrn_toxicology"])
        ],
        commonInterventions: [
            AttributedBullet("Contact poison control early — management, level interpretation, and NAC decisions are guided by toxicology.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("N-acetylcysteine is the antidote; its benefit is time-dependent, so it is often started based on risk before the level returns and continued per protocol — the nurse's job is to prevent delay.", citationIDs: ["openrn_toxicology", "poison_control_concept"]),
            AttributedBullet("Activated charcoal may be used for recent ingestions per toxicology direction and airway-safety judgment.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Supportive care and transplant-center involvement for acute liver failure (coagulopathy, encephalopathy, acidosis).", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Watch for NAC reactions: the IV form can cause anaphylactoid reactions (flushing, rash, bronchospasm) — usually managed by slowing/pausing the infusion per protocol, not by abandoning the antidote.", citationIDs: ["openrn_toxicology"])
        ],
        watchFor: [
            AttributedBullet("The deceptive early phase — a well-looking patient at hour 6 is not out of danger; the level and the clock decide, not the appearance.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Evolving liver failure: rising INR, encephalopathy, hypoglycemia, and metabolic acidosis.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Anaphylactoid reactions to IV NAC.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Ongoing suicide risk once medically stabilizing.", citationIDs: ["openrn_toxicology"])
        ],
        citations: [openrnTox, poisonControl],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Salicylate (aspirin) overdose

public enum SalicylateOverdoseSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "salicylate-overdose",
        title: "Salicylate (aspirin) overdose",
        subtitle: "The classic mixed acid-base picture · a falling pH is an ominous late turn",
        nclexTags: toxTags,
        definition: AttributedProse(
            "Salicylate poisoning — from aspirin and related compounds (including oil of wintergreen, which is highly concentrated) — produces a characteristic mixed acid-base disturbance and multi-system toxicity. It is a diagnosis where the trend in pH matters more than any single value.",
            citationIDs: ["openrn_toxicology", "poison_control_concept"]
        ),
        pathophysiology: AttributedProse(
            "Salicylate directly stimulates the respiratory center (causing a primary respiratory alkalosis) and simultaneously uncouples oxidative phosphorylation and disrupts metabolism (causing a primary metabolic acidosis with an elevated anion gap). The result is the classic mixed picture. As toxicity worsens and the blood becomes more acidic, more salicylate crosses into the central nervous system — which is why a falling pH signals a dangerous turn, not improvement.",
            citationIDs: ["openrn_toxicology"]
        ),
        presentation: [
            AttributedBullet("Early: tinnitus and hearing changes, nausea/vomiting, and hyperventilation (tachypnea and hyperpnea).", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Progressive: hyperthermia, diaphoresis, dehydration, agitation, confusion.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Severe/late: seizures, coma, cerebral and pulmonary edema, cardiovascular collapse — often heralded by the pH falling toward and below normal.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Chronic salicylism (especially in older adults on therapeutic aspirin) can present subtly as confusion and is easily missed.", citationIDs: ["poison_control_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serial salicylate levels (a single level can be rising or falling — the trend guides care) plus serial arterial blood gases and basic metabolic panel to characterize the mixed acid-base state and anion gap.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Glucose (including CNS glucose considerations), potassium, and coagulation studies; co-ingestant screen including acetaminophen.", citationIDs: ["openrn_toxicology"])
        ],
        priorityAssessments: [
            AttributedBullet("Trend the ABG and salicylate level together — a rising level or a pH drifting down is a deterioration signal even if the patient looks similar.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Neurologic status (confusion, seizures) and temperature (hyperthermia); fluid and electrolyte status, especially potassium, which must be adequate for the treatment to work.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Respiratory status — beware intubating these patients casually; interrupting their compensatory hyperventilation can precipitate a lethal acidosis unless ventilation is aggressively matched.", citationIDs: ["poison_control_concept"])
        ],
        commonInterventions: [
            AttributedBullet("Contact poison control; management is toxicology-directed.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Serum and urine alkalinization with a sodium bicarbonate infusion per protocol traps salicylate out of the CNS and enhances renal elimination — potassium must be repleted or alkalinization fails.", citationIDs: ["openrn_toxicology", "poison_control_concept"]),
            AttributedBullet("Volume resuscitation and glucose support; activated charcoal for appropriate recent ingestions per toxicology.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Hemodialysis for severe toxicity (very high levels, refractory acidosis, altered mental status, pulmonary/cerebral edema, renal failure) — know the criteria and mobilize early.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Suicide risk assessment and safety measures for intentional ingestion.", citationIDs: ["openrn_toxicology"])
        ],
        watchFor: [
            AttributedBullet("A normalizing or falling pH as a red flag — it often means worsening CNS penetration, not recovery.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("The intubation trap — loss of compensatory hyperventilation can be fatal without matched aggressive ventilation.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Hypokalemia undermining alkalinization; cerebral and pulmonary edema; seizures.", citationIDs: ["openrn_toxicology"])
        ],
        citations: [openrnTox, poisonControl],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Digoxin toxicity

public enum DigoxinToxicitySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "digoxin-toxicity",
        title: "Digoxin toxicity",
        subtitle: "Narrow therapeutic index · potassium tells the story · an antibody-fragment antidote",
        nclexTags: toxPerfusionTags,
        definition: AttributedProse(
            "Digoxin has a narrow therapeutic index, and toxicity — acute or chronic — is a classic, testable emergency. It presents with GI, visual, and cardiac features, and the serum potassium behaves differently in acute versus chronic toxicity in a way that shapes both prognosis and treatment.",
            citationIDs: ["openrn_toxicology", "poison_control_concept"]
        ),
        pathophysiology: AttributedProse(
            "Digoxin inhibits the myocardial sodium-potassium ATPase, increasing intracellular calcium (its therapeutic inotropy) and increasing vagal tone (slowing AV conduction). In toxicity, excessive AV block and enhanced automaticity produce a wide range of dysrhythmias. Because the drug blocks the pump that moves potassium into cells, acute toxicity drives potassium out of cells and up in the serum — and in acute poisoning, a high potassium is a marker of severity. Conditions that raise risk: renal impairment (digoxin is renally cleared), hypokalemia, hypomagnesemia, and hypercalcemia, plus interacting drugs.",
            citationIDs: ["openrn_toxicology"]
        ),
        presentation: [
            AttributedBullet("GI: anorexia, nausea, vomiting — often the earliest signs of chronic toxicity.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Neuro/visual: fatigue, confusion, weakness, and the classic visual changes — blurred or yellow-green vision, halos around lights.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Cardiac: almost any dysrhythmia, but characteristically those combining increased automaticity with AV block (e.g., bradyarrhythmias, heart block, and paradoxical tachyarrhythmias).", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Chronic toxicity is common in older adults with declining renal function or a new interacting drug, and presents insidiously.", citationIDs: ["poison_control_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serum digoxin level (timed appropriately after a dose), interpreted alongside symptoms — patients can be toxic within the 'therapeutic' range, and clinical toxicity outweighs the number.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Potassium, magnesium, calcium, and renal function — each both a cause and a consequence; potassium in particular guides urgency in acute toxicity.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Continuous ECG/telemetry to identify the dysrhythmia and trend it.", citationIDs: ["openrn_toxicology"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous cardiac monitoring — the lethal risk is dysrhythmia; know the patient's rhythm and any change.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Serial potassium in acute toxicity as a severity marker; correct hypomagnesemia and hypokalemia in chronic toxicity, which potentiate the drug.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Apical pulse and hemodynamic status; hold further digoxin and clarify the ongoing regimen.", citationIDs: ["openrn_toxicology"])
        ],
        commonInterventions: [
            AttributedBullet("Contact poison control; management is toxicology-directed.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Digoxin-specific antibody fragments (digoxin immune Fab) are the antidote for life-threatening toxicity — indications include life-threatening dysrhythmias and, in acute poisoning, marked hyperkalemia; administered per protocol.", citationIDs: ["openrn_toxicology", "poison_control_concept"]),
            AttributedBullet("Correct magnesium and, carefully, potassium — but in acute toxicity treat hyperkalemia cautiously and avoid IV calcium per toxicology guidance, which historically raised concern in this setting ('stone heart').", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Manage bradydysrhythmias supportively (atropine, temporary pacing per protocol) while definitive antidote is arranged.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Review and reconcile the medication list — chronic toxicity often traces to a new interacting drug or worsening renal function.", citationIDs: ["openrn_toxicology"])
        ],
        watchFor: [
            AttributedBullet("Any new dysrhythmia — the deterioration path is electrical.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Hyperkalemia in acute toxicity as a severity signal; hypokalemia/hypomagnesemia worsening chronic toxicity.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("The insidious chronic presentation in older adults — nausea, confusion, and visual changes are easy to attribute elsewhere.", citationIDs: ["poison_control_concept"])
        ],
        citations: [openrnTox, poisonControl],
        lastSourceFidelityReview: "2026-07-03"
    )
}


// MARK: - Iron overdose

public enum IronOverdoseSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "iron-overdose",
        title: "Iron overdose",
        subtitle: "A pediatric-ingestion classic · a deceptive latent phase · a chelation antidote",
        nclexTags: toxTags,
        definition: AttributedProse(
            "Iron overdose — frequently a young child who ingests adult iron tablets or prenatal vitamins — is dangerous partly because of a deceptive quiet phase in the middle of its course. It progresses through recognizable stages and has a specific chelation antidote for severe poisoning.",
            citationIDs: ["openrn_toxicology", "poison_control_concept"]
        ),
        pathophysiology: AttributedProse(
            "Excess iron is directly corrosive to GI mucosa (early hemorrhagic gastroenteritis) and, once absorbed, overwhelms binding capacity. Free iron poisons mitochondria and catalyzes oxidative injury, producing metabolic acidosis and multi-organ damage — the liver especially. The staged course reflects this: local GI injury first, a misleading lull, then systemic toxicity.",
            citationIDs: ["openrn_toxicology"]
        ),
        presentation: [
            AttributedBullet("Stage 1 (GI, first hours): vomiting and diarrhea, often bloody, with abdominal pain; significant fluid loss.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Stage 2 (latent, ~6–24 hr): apparent improvement as GI symptoms settle — the deceptive quiet that falsely reassures.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Stage 3 (systemic): metabolic acidosis, shock, hepatotoxicity, coagulopathy, and altered mental status.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Stage 4 (~2–5 days): fulminant hepatic failure in severe cases.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Stage 5 (weeks later): GI scarring and strictures from the initial corrosive injury.", citationIDs: ["openrn_toxicology"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serum iron level timed to ingestion, alongside anion-gap/acid-base status, glucose, and hepatic/coagulation markers.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Abdominal radiograph may reveal radio-opaque tablets (helpful when positive; a negative film does not exclude ingestion).", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Careful ingestion history including the elemental-iron content of the specific product, which determines risk.", citationIDs: ["poison_control_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("Do not be reassured by the stage-2 lull — trend acid-base status, perfusion, and mental status through it.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Volume status and GI losses (which can be large and bloody); hemodynamics and urine output.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("For pediatric ingestions, medication-storage counseling and safety assessment; suicide risk assessment for intentional adult ingestions.", citationIDs: ["cdc_toxicology"])
        ],
        commonInterventions: [
            AttributedBullet("Contact poison control; management is toxicology-directed.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Aggressive IV fluid resuscitation for GI losses and shock; correct acidosis and support perfusion.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Whole-bowel irrigation may be used to clear tablets from the gut per toxicology (activated charcoal does not bind iron).", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Deferoxamine chelation for severe toxicity per protocol; monitor for its effects and for the characteristic color change it can impart to urine.", citationIDs: ["openrn_toxicology", "poison_control_concept"]),
            AttributedBullet("Support hepatic failure and coagulopathy; involve a transplant center for fulminant cases.", citationIDs: ["openrn_toxicology"])
        ],
        watchFor: [
            AttributedBullet("The latent stage as a trap — improvement at hour 8 does not mean the danger has passed.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Progression to shock, metabolic acidosis, and hepatic failure.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Delayed GI strictures weeks later in survivors of significant corrosive injury.", citationIDs: ["openrn_toxicology"])
        ],
        citations: [openrnTox, poisonControl, cdcTox],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Calcium channel blocker and beta-blocker overdose

public enum CCBBetaBlockerOverdoseSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ccb-betablocker-overdose",
        title: "Calcium channel blocker and beta-blocker overdose",
        subtitle: "Bradycardia and shock · one dramatic distinguishing lab · specialized antidotes",
        nclexTags: toxPerfusionTags,
        definition: AttributedProse(
            "Overdose of calcium channel blockers (CCBs) and beta-blockers both produce bradycardia and hypotension and are grouped together for that reason, but they differ in one telling feature and in emphasis of treatment. Both can be lethal and both have specialized antidotal strategies beyond ordinary resuscitation.",
            citationIDs: ["openrn_toxicology", "poison_control_concept"]
        ),
        pathophysiology: AttributedProse(
            "Beta-blockers antagonize beta-adrenergic receptors, reducing heart rate and contractility. Non-dihydropyridine CCBs (verapamil, diltiazem) block cardiac calcium channels with the same net effect, while dihydropyridine CCBs (e.g., amlodipine) mainly cause vasodilatory shock. The distinguishing clue: CCB toxicity classically produces hyperglycemia, because blocked calcium channels impair pancreatic insulin release — whereas beta-blocker toxicity tends toward normal or low glucose. That difference underpins high-dose insulin therapy, a mainstay for these poisonings.",
            citationIDs: ["openrn_toxicology", "poison_control_concept"]
        ),
        presentation: [
            AttributedBullet("Both: bradycardia, hypotension, AV block, and cardiogenic/vasodilatory shock; altered mental status from hypoperfusion.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("CCB clue: hyperglycemia (and relatively preserved mentation early despite profound hypotension).", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Beta-blocker clues: hypoglycemia possible, bronchospasm (in susceptible patients), and CNS effects/seizures with lipophilic agents (e.g., propranolol).", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Extended-release formulations delay and prolong toxicity — a well-looking early patient can crash hours later.", citationIDs: ["poison_control_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical, supported by ECG (bradycardia, blocks), glucose (the CCB-vs-beta-blocker clue), and acid-base/lactate for perfusion.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Identify the specific agent and formulation (immediate vs. extended release) — it changes the anticipated course.", citationIDs: ["poison_control_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous cardiac monitoring and frequent blood pressure; anticipate delayed deterioration with extended-release products.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Serial glucose (both to distinguish the toxins and to run high-dose insulin therapy safely) and potassium.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Perfusion markers — mental status, urine output, lactate; suicide risk assessment for intentional ingestion.", citationIDs: ["openrn_toxicology"])
        ],
        commonInterventions: [
            AttributedBullet("Contact poison control; these are toxicology-directed resuscitations with several antidotal layers.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Standard measures: IV fluids, atropine for bradycardia, and vasopressors for shock per protocol.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("IV calcium (more helpful in CCB toxicity), high-dose insulin euglycemic therapy (a mainstay for both — requires close glucose and potassium monitoring), and glucagon (classically for beta-blocker toxicity) per protocol.", citationIDs: ["openrn_toxicology", "poison_control_concept"]),
            AttributedBullet("Lipid emulsion therapy and mechanical support (pacing, ECMO) for refractory cases per toxicology.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Whole-bowel irrigation for extended-release ingestions per protocol; prolonged observation given delayed toxicity.", citationIDs: ["poison_control_concept"])
        ],
        watchFor: [
            AttributedBullet("Delayed, prolonged toxicity from extended-release formulations — do not under-observe an early-well patient.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Hypoglycemia during high-dose insulin therapy (and hypokalemia) — meticulous monitoring is part of the treatment.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Refractory shock requiring escalation to mechanical support.", citationIDs: ["openrn_toxicology"])
        ],
        citations: [openrnTox, poisonControl],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Toxic alcohol poisoning (ethylene glycol and methanol)

public enum ToxicAlcoholSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "toxic-alcohol-poisoning",
        title: "Toxic alcohol poisoning (ethylene glycol and methanol)",
        subtitle: "The metabolites do the harm · an anion + osmolar gap story · block the enzyme",
        nclexTags: toxTags,
        definition: AttributedProse(
            "Ethylene glycol (antifreeze) and methanol (windshield fluid, some solvents) are toxic not as the parent alcohols but through their metabolites. They present as an intoxicated patient evolving into a severe high-anion-gap metabolic acidosis, and the treatment strategy is to block the enzyme that makes the toxic metabolites.",
            citationIDs: ["openrn_toxicology", "poison_control_concept"]
        ),
        pathophysiology: AttributedProse(
            "Alcohol dehydrogenase metabolizes ethylene glycol into acids and oxalate (which injure the kidneys and chelate calcium) and methanol into formic acid (which injures the optic nerve and CNS). Early on, the unmetabolized alcohol raises the serum osmolar gap; as metabolism proceeds, the osmolar gap narrows and a widening anion-gap acidosis takes over. Fomepizole (or ethanol) works by inhibiting alcohol dehydrogenase — stopping production of the harmful metabolites so the parent alcohol can be cleared or dialyzed.",
            citationIDs: ["openrn_toxicology", "poison_control_concept"]
        ),
        presentation: [
            AttributedBullet("Early: apparent alcohol intoxication without the smell of ethanol; nausea.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Ethylene glycol: progresses to metabolic acidosis, then cardiopulmonary instability, then acute kidney injury (calcium oxalate crystals; hypocalcemia).", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Methanol: the hallmark is visual disturbance — blurred vision, 'snowfield' whiteout, or blindness — with severe acidosis and basal ganglia injury.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("A profound high-anion-gap metabolic acidosis out of proportion to the story should raise the suspicion.", citationIDs: ["poison_control_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serum osmolality with calculated osmolar gap, ABG/anion gap, and basic metabolic panel — the gaps evolve over time (osmolar gap early, anion gap later), so timing matters.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Specific ethylene glycol/methanol levels where available; calcium (ethylene glycol) and a co-ingestant screen.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("A normal osmolar gap late does not exclude toxicity — by then the alcohol may already be metabolized into acid.", citationIDs: ["poison_control_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("Trend acid-base status and the gaps; neuro and visual assessment (methanol) and renal/calcium status (ethylene glycol).", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Recognize the pattern early — the sooner the enzyme is blocked, the less toxic metabolite forms.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Suicide risk assessment for intentional ingestion; storage/safety counseling for accidental exposures.", citationIDs: ["cdc_toxicology"])
        ],
        commonInterventions: [
            AttributedBullet("Contact poison control; management is toxicology-directed.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Fomepizole (preferred) or ethanol per protocol to inhibit alcohol dehydrogenase and halt toxic-metabolite formation — the earlier the better.", citationIDs: ["openrn_toxicology", "poison_control_concept"]),
            AttributedBullet("Hemodialysis for severe acidosis, high levels, renal failure, or visual symptoms — it removes both the parent alcohol and the acids.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Cofactor therapy per toxicology (e.g., folate for methanol; thiamine and pyridoxine for ethylene glycol) and sodium bicarbonate for severe acidosis.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Supportive care for CNS, cardiovascular, and renal effects.", citationIDs: ["openrn_toxicology"])
        ],
        watchFor: [
            AttributedBullet("The evolving-gaps trap — an early osmolar gap that narrows while a dangerous anion-gap acidosis grows.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Methanol visual loss and ethylene glycol acute kidney injury/hypocalcemia.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Missed diagnosis — 'drunk without the smell' plus a severe acidosis is the clue.", citationIDs: ["openrn_toxicology"])
        ],
        citations: [openrnTox, poisonControl],
        lastSourceFidelityReview: "2026-07-03"
    )
}


// MARK: - Anticholinergic poisoning

public enum AnticholinergicPoisoningSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "anticholinergic-poisoning",
        title: "Anticholinergic poisoning",
        subtitle: "\"Mad, red, hot, dry, blind\" · a memorable toxidrome with a cautious antidote",
        nclexTags: toxTags,
        definition: AttributedProse(
            "Anticholinergic toxicity results from many common agents — antihistamines (diphenhydramine), tricyclics, antipsychotics, antispasmodics, some plants (jimsonweed), and scopolamine. It produces one of the most recognizable toxidromes in medicine, summarized by a classic mnemonic, and its antidote is effective but used cautiously.",
            citationIDs: ["openrn_toxicology", "poison_control_concept"]
        ),
        pathophysiology: AttributedProse(
            "Blockade of muscarinic acetylcholine receptors removes parasympathetic 'rest and digest' tone: the heart speeds up, secretions and sweating stop, the pupils dilate and cannot accommodate, the gut and bladder slow, and — from central blockade — delirium develops. The inability to sweat drives dangerous hyperthermia, a key threat.",
            citationIDs: ["openrn_toxicology"]
        ),
        presentation: [
            AttributedBullet("The classic toxidrome — 'mad as a hatter' (delirium, agitation, hallucinations), 'red as a beet' (flushed skin), 'hot as a hare' (hyperthermia), 'dry as a bone' (dry skin/mucosa, no sweat), 'blind as a bat' (dilated, unreactive pupils), 'full as a flask' (urinary retention).", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Also: tachycardia, decreased or absent bowel sounds, and picking/mumbling delirium.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Distinguish from sympathomimetic toxicity by the skin: anticholinergic patients are dry, stimulant patients are diaphoretic — a bedside discriminator.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Watch for the co-toxicities of the specific agent (e.g., TCA sodium-channel effects, antihistamine sodium-channel effects at high dose).", citationIDs: ["openrn_toxicology"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical toxidrome recognition; ECG (especially to detect sodium-channel effects from agents like TCAs/diphenhydramine — a wide QRS changes management).", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Temperature, and evaluation for the complications and co-ingestants.", citationIDs: ["poison_control_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("Temperature — the dry-skin inability to cool makes hyperthermia a real and rapid danger.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Continuous cardiac monitoring (rhythm and QRS width), neuro/delirium status, and bladder distension (retention is common).", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Safety of the delirious, agitated patient; suicide risk assessment for intentional ingestion.", citationIDs: ["openrn_toxicology"])
        ],
        commonInterventions: [
            AttributedBullet("Contact poison control; supportive care is the foundation.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Benzodiazepines for agitation and seizures; active cooling for hyperthermia; bladder scan and catheterization for retention.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Physostigmine is a specific antidote for pure anticholinergic delirium in selected cases, used cautiously per toxicology — it is generally avoided when a TCA/sodium-channel-blocking co-ingestion is suspected because of cardiac risk.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Sodium bicarbonate per protocol if the agent has sodium-channel-blocking effects and the QRS widens (as with TCAs and high-dose diphenhydramine).", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Activated charcoal for appropriate recent ingestions per toxicology and airway judgment.", citationIDs: ["poison_control_concept"])
        ],
        watchFor: [
            AttributedBullet("Hyperthermia from the inability to sweat — cool early.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("A widening QRS signaling sodium-channel toxicity from the specific agent.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Urinary retention, worsening delirium, and seizures.", citationIDs: ["openrn_toxicology"])
        ],
        citations: [openrnTox, poisonControl],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Toxidrome recognition (pattern reference)

public enum ToxidromeRecognitionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "toxidrome-recognition",
        title: "Toxidrome recognition",
        subtitle: "Reading the pattern when the substance is unknown · the pupils, skin, and vitals tell the story",
        nclexTags: toxPharmTags,
        definition: AttributedProse(
            "A toxidrome is a recognizable cluster of signs pointing to a class of poisoning. In the common situation where the ingested substance is unknown or the history is unreliable, reading the toxidrome — from vital signs, pupils, skin, bowel sounds, and mental status — lets the team narrow the field and act. This entry is the pattern key that ties the specific poisoning entries together.",
            citationIDs: ["openrn_toxicology", "poison_control_concept"]
        ),
        pathophysiology: AttributedProse(
            "Most toxidromes map to a neurotransmitter system. Cholinergic and anticholinergic syndromes are opposite disturbances of acetylcholine; sympathomimetic toxicity is catecholamine excess; opioid and sedative-hypnotic syndromes are CNS depression by different mechanisms. Because each system produces a characteristic footprint across the pupils, skin, secretions, gut, and vitals, the physical exam becomes a diagnostic instrument.",
            citationIDs: ["openrn_toxicology"]
        ),
        presentation: [
            AttributedBullet("Anticholinergic: hyperthermia, tachycardia, dilated pupils, DRY flushed skin, urinary retention, delirium — 'mad, red, hot, dry, blind.'", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Cholinergic (organophosphates, some nerve agents): the wet toxidrome — SLUDGE/DUMBELS (salivation, lacrimation, urination, defecation, GI distress, emesis; plus bradycardia, bronchorrhea, miosis) — bronchorrhea and bronchospasm kill.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Sympathomimetic: hyperthermia, tachycardia, hypertension, dilated pupils, and DIAPHORETIC (wet) skin — the skin distinguishes it from anticholinergic.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Opioid: the triad of CNS depression, respiratory depression, and pinpoint (miotic) pupils.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Sedative-hypnotic (benzodiazepines, alcohol, barbiturates): CNS depression with relatively preserved respiration early and typically normal-size pupils — depression without the opioid's pinpoint pupils.", citationIDs: ["openrn_toxicology"])
        ],
        diagnosticCriteria: [
            AttributedBullet("A structured toxidrome exam: mental status, respiratory rate and effort, heart rate, blood pressure, temperature, pupil size, skin (dry vs. sweaty), bowel sounds, and bladder — the pattern across these is the diagnosis.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Anchor with an ECG (QRS/QT), glucose, acid-base/anion gap, and the universal acetaminophen + salicylate co-ingestant screen.", citationIDs: ["openrn_toxicology"])
        ],
        priorityAssessments: [
            AttributedBullet("The two discriminators worth memorizing: pupils (pinpoint = opioid/cholinergic; dilated = anticholinergic/sympathomimetic) and skin (dry = anticholinergic; wet = cholinergic/sympathomimetic).", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Reassess the pattern over time — toxidromes evolve, co-ingestions blur them, and a mixed picture is common.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Airway, breathing, circulation always first — the toxidrome guides the specifics, but resuscitation leads.", citationIDs: ["openrn_toxicology"])
        ],
        commonInterventions: [
            AttributedBullet("Contact poison control early for any significant or unclear poisoning — the toxidrome plus the exposure history directs antidotes and disposition.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Match empiric antidotes to the pattern where clear and safe: naloxone for the opioid triad; atropine (and pralidoxime) for cholinergic crisis; benzodiazepines for sympathomimetic and withdrawal states.", citationIDs: ["openrn_toxicology", "poison_control_concept"]),
            AttributedBullet("Supportive care tailored to the syndrome — cooling for the hyperthermic toxidromes, ventilation for CNS-depressant ones.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Decontamination (activated charcoal, whole-bowel irrigation) only when indicated and airway-safe, per toxicology.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("Always screen for the co-ingestion that hides behind the obvious one; assess psychosocial safety in intentional exposures.", citationIDs: ["openrn_toxicology"])
        ],
        watchFor: [
            AttributedBullet("Mixed and evolving pictures — a single clean toxidrome is the exception, not the rule.", citationIDs: ["poison_control_concept"]),
            AttributedBullet("The lethal specifics within a syndrome: opioid apnea, cholinergic bronchorrhea, sympathomimetic/anticholinergic hyperthermia.", citationIDs: ["openrn_toxicology"]),
            AttributedBullet("Anchoring bias — the visible drug may not be the dangerous one; keep the co-ingestant screen and the exam honest.", citationIDs: ["openrn_toxicology"])
        ],
        citations: [openrnTox, poisonControl],
        lastSourceFidelityReview: "2026-07-03"
    )
}
