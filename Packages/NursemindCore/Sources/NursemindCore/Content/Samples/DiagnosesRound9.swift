import Foundation

// Curator-model diagnosis entries (round 9 expansion — peds congenital heart, peds onc, peds neuro / endocrine / genetic).
// Sources: Open RN Health Alterations (CC BY 4.0), OpenStax Maternal-Newborn + Pediatric Nursing
// (CC BY 4.0 with AI restriction), CDC (public domain), AAP / AHA / COG / NCCN concept citations.

private let openrnPedsR9 = CitationSource(
    id: "openrn_peds_round9",
    shortName: "Open RN Health Alterations / Pediatric Nursing",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=pediatric+congenital+oncology+neuromuscular",
    lastRetrieved: "2026-05-04"
)
private let openstaxR9 = CitationSource(
    id: "openstax_round9",
    shortName: "OpenStax Maternal-Newborn + Pediatric Nursing",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/maternal-newborn-nursing",
    lastRetrieved: "2026-05-04"
)
private let cdcDxR9 = CitationSource(
    id: "cdc_dx_round9",
    shortName: "CDC pediatric clinical guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/ncbddd/",
    lastRetrieved: "2026-05-04"
)
private let pedSpecialtyR9 = CitationSource(
    id: "ped_specialty_round9",
    shortName: "AAP / AHA / COG / NCCN concept citations",
    publisher: "AAP · AHA · Children's Oncology Group · NCCN",
    license: .factCitationOnly,
    url: "https://publications.aap.org/aapnews",
    lastRetrieved: "2026-05-04"
)

private let chdR9 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let oncR9 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cellularRegulation)
private let neuroR9 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation)
private let endoR9 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .glucoseRegulation)
private let geneticR9 = NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .cognition)
private let muscR9 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility)

// MARK: - Tetralogy of Fallot

public enum TOFSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "tetralogy-of-fallot",
        title: "Tetralogy of Fallot (TOF)",
        subtitle: "Cyanotic CHD · 4 defects · \"tet spells\" · staged surgical repair",
        nclexTags: chdR9,
        definition: AttributedProse(
            "Most common cyanotic congenital heart disease beyond infancy. Four defects: pulmonary stenosis (subvalvular or valvular), right ventricular hypertrophy, overriding aorta, and ventricular septal defect (VSD). Severity of cyanosis depends on degree of pulmonary stenosis per primary source.",
            citationIDs: ["openrn_peds_round9", "ped_specialty_round9"]
        ),
        pathophysiology: AttributedProse(
            "Pulmonary stenosis → reduced pulmonary blood flow + right-to-left shunt across VSD → systemic hypoxemia. Increased catecholamines (crying, defecation, agitation) further increase RV outflow obstruction → \"tet spell\" with deepening cyanosis.",
            citationIDs: ["openrn_peds_round9"]
        ),
        presentation: [
            AttributedBullet("Cyanosis — severity ranges from minimal (\"pink tet\") to deep cyanosis at birth.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Loud systolic ejection murmur at left upper sternal border.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Clubbing of fingers/toes in older children.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("\"Tet spells\" / hypercyanotic episodes — deep cyanosis, irritability, syncope; toddlers may instinctively SQUAT after exertion to reduce RV outflow obstruction.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Failure to thrive, feeding intolerance with severe disease.", citationIDs: ["openrn_peds_round9"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Echocardiography — gold standard.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("CXR — \"boot-shaped\" heart from RV hypertrophy and uplifted apex; decreased pulmonary vascular markings.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("ECG — RV hypertrophy.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Pulse oximetry — pre- and postductal saturation; CHD newborn screening.", citationIDs: ["openrn_peds_round9"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous SpO2; trend baseline; assess for cyanosis triggers.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Feeding tolerance, weight gain, growth.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Tet-spell history, frequency, and triggers.", citationIDs: ["openrn_peds_round9"])
        ],
        commonInterventions: [
            AttributedBullet("TET SPELL ACUTE TREATMENT: 1) KNEE-CHEST POSITION (squatting equivalent — increases SVR, decreases right-to-left shunt); 2) calm + comfort + supplemental oxygen; 3) morphine SQ/IV; 4) IV fluid bolus; 5) phenylephrine if refractory; 6) propranolol per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Prevention — avoid dehydration, treat fever promptly, stool softeners, scheduled feeds.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Definitive — surgical repair (typically 3–6 months of age) — patch VSD + relief of RV outflow obstruction per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Lifelong cardiology follow-up — pulmonary regurgitation, RV dilation, arrhythmia, sudden death risk.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Endocarditis prophylaxis until 6 months post-repair (and lifelong if residual defects) per primary source.", citationIDs: ["openrn_peds_round9"])
        ],
        watchFor: [
            AttributedBullet("TET SPELL — life-threatening if prolonged; activate code if no response to knee-chest, oxygen, morphine; cardiology emergent.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Polycythemia — chronic hypoxemia → erythrocytosis → hyperviscosity → stroke risk.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Brain abscess from right-to-left shunt — fever + neuro change in TOF patient warrants imaging.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Post-surgical — pulmonary regurgitation often present; may need pulmonary valve replacement in adolescence / adulthood.", citationIDs: ["openrn_peds_round9"])
        ],
        citations: [openrnPedsR9, pedSpecialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Transposition of the Great Arteries (TGA)

public enum TGASample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "tga",
        title: "Transposition of the great arteries (TGA)",
        subtitle: "Cyanotic CHD · ductal-dependent · PGE1 + emergent surgery",
        nclexTags: chdR9,
        definition: AttributedProse(
            "Most common cyanotic CHD presenting in the first 24 hours of life. Aorta arises from the right ventricle and pulmonary artery from the left ventricle, creating two parallel circulations. Survival depends on mixing through PDA, PFO, or VSD until surgical repair per primary source.",
            citationIDs: ["openrn_peds_round9", "ped_specialty_round9"]
        ),
        pathophysiology: AttributedProse(
            "Systemic and pulmonary circulations run in parallel rather than series. Without mixing (via PDA, PFO, VSD), oxygenated blood does not reach systemic circulation. As ductus closes after birth, cyanosis worsens dramatically.",
            citationIDs: ["openrn_peds_round9"]
        ),
        presentation: [
            AttributedBullet("Profound cyanosis within hours of birth — deepens as ductus closes.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Tachypnea but otherwise initially comfortable (\"happy cyanotic baby\").", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Single S2 (only aortic component audible due to anterior aorta).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Often NO murmur unless associated VSD / pulmonary stenosis.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Failure of pre/postductal SpO2 newborn screening (saturation typically 60–80%).", citationIDs: ["openrn_peds_round9"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Echocardiography — definitive.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("CXR — \"egg on a string\" silhouette (narrow superior mediastinum), increased pulmonary markings.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Pre/postductal SpO2 differential (>3% post < pre may suggest PPHN or other mixing patterns; TGA can show reverse).", citationIDs: ["openrn_peds_round9"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous SpO2 (pre- and postductal); ABG.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Cardiac, respiratory, neuro status; perfusion (capillary refill, peripheral pulses, lactate).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Coordinate emergent transfer to pediatric cardiac center.", citationIDs: ["openrn_peds_round9"])
        ],
        commonInterventions: [
            AttributedBullet("ALPROSTADIL (PGE1) IV continuous infusion — keeps ductus arteriosus OPEN to allow mixing per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("INTUBATION-READY at all times during PGE1 — apnea is common.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Balloon atrial septostomy (Rashkind procedure) — emergent palliative; creates ASD for additional mixing per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("DEFINITIVE — Arterial switch operation (Jatene) typically within first 2 weeks of life per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("NICU-level care; minimize handling; thermoregulation; gentle suctioning.", citationIDs: ["openrn_peds_round9"])
        ],
        watchFor: [
            AttributedBullet("PGE1 APNEA — primary nursing concern; intubation backup essential.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Persistent severe hypoxemia despite PGE1 — emergent septostomy needed.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Outcomes — modern arterial switch achieves >95% survival with good long-term function per primary source.", citationIDs: ["openrn_peds_round9"])
        ],
        citations: [openrnPedsR9, pedSpecialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Patent Ductus Arteriosus (PDA)

public enum PDASample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pda",
        title: "Patent ductus arteriosus (PDA)",
        subtitle: "Persistent fetal vessel · acyanotic L→R shunt · indomethacin / surgery",
        nclexTags: chdR9,
        definition: AttributedProse(
            "Persistent post-natal patency of the ductus arteriosus (a normal fetal vessel that should close functionally within 12–48 hours and structurally within 2–3 weeks). Common in preterm infants. Hemodynamically significant PDA (hsPDA) causes left-to-right shunt and pulmonary overcirculation per primary source.",
            citationIDs: ["openrn_peds_round9", "ped_specialty_round9"]
        ),
        pathophysiology: AttributedProse(
            "Left-to-right shunt → increased pulmonary blood flow, LA / LV volume overload → CHF. In preterm — lung disease worsens, NEC and IVH risk increase. In ductal-dependent CHD (like HLHS, severe coarctation, TGA) — PDA is LIFE-SUSTAINING and must be kept open.",
            citationIDs: ["openrn_peds_round9"]
        ),
        presentation: [
            AttributedBullet("Continuous \"machinery\" murmur at left infraclavicular area.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Bounding pulses, wide pulse pressure.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Tachypnea, increased work of breathing, failure to thrive.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Hyperdynamic precordium.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Preterm infants — worsening respiratory status, apnea, ventilator dependence, bronchopulmonary dysplasia risk.", citationIDs: ["openrn_peds_round9"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Echocardiography — definitive; quantifies size and shunt direction.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("CXR — cardiomegaly, increased pulmonary vascular markings if hemodynamically significant.", citationIDs: ["openrn_peds_round9"])
        ],
        priorityAssessments: [
            AttributedBullet("Respiratory effort, work of breathing, oxygen requirement.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Hemodynamics — pulses, BP, capillary refill.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Feeding tolerance and weight gain.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Distinguish from ductal-dependent CHD before considering closure!", citationIDs: ["openrn_peds_round9"])
        ],
        commonInterventions: [
            AttributedBullet("Asymptomatic in term infant — often spontaneous closure; observation.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Symptomatic in preterm — INDOMETHACIN OR IBUPROFEN OR ACETAMINOPHEN closes PDA via prostaglandin inhibition per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Refractory or contraindication to medical closure — surgical ligation or transcatheter device closure per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Fluid restriction; diuretics for symptomatic CHF.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Endocarditis prophylaxis until 6 months post-closure if device used per primary source.", citationIDs: ["openrn_peds_round9"])
        ],
        watchFor: [
            AttributedBullet("DUCTAL-DEPENDENT CHD MISIDENTIFICATION — closing the PDA in HLHS / TGA / severe coarctation = catastrophic; ALWAYS confirm anatomy on echo before considering closure.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Indomethacin neonatal adverse effects — oliguria, NEC, IVH, bleeding.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Bronchopulmonary dysplasia worsening — preterm + persistent hsPDA association.", citationIDs: ["openrn_peds_round9"])
        ],
        citations: [openrnPedsR9, pedSpecialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Coarctation of the Aorta

public enum CoarctationSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "coarctation-of-aorta",
        title: "Coarctation of the aorta",
        subtitle: "Aortic narrowing · differential BP / pulses · ductal-dependent in critical form",
        nclexTags: chdR9,
        definition: AttributedProse(
            "Discrete narrowing of the aorta, classically just distal to the left subclavian artery near the ductus arteriosus insertion. Critical (severe) coarctation presents in the first weeks of life and is ductal-dependent for systemic perfusion to the lower body; less-severe forms present later in childhood with HTN per primary source.",
            citationIDs: ["openrn_peds_round9", "ped_specialty_round9"]
        ),
        pathophysiology: AttributedProse(
            "Obstruction to flow distal to the aortic arch → upper-extremity hypertension, lower-extremity hypoperfusion. With ductal closure in critical coarctation, lower-body perfusion fails → severe shock and acidosis.",
            citationIDs: ["openrn_peds_round9"]
        ),
        presentation: [
            AttributedBullet("Critical (neonate) — circulatory collapse, severe metabolic acidosis as PDA closes; absent or weak FEMORAL pulses; differential pre/postductal SpO2.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Older child — upper-extremity HTN, BP differential >20 mmHg between arms and legs (UE > LE), weak femoral pulses, leg claudication, cold feet.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Systolic murmur at left upper sternal border / left infraclavicular / interscapular region.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Headache, epistaxis, leg fatigue in older children.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Associated — bicuspid aortic valve, Turner syndrome, intracranial aneurysms.", citationIDs: ["openrn_peds_round9"])
        ],
        diagnosticCriteria: [
            AttributedBullet("4-extremity BP — UE > LE BP differential supports.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Echocardiography — confirms.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("CXR — \"3 sign\" or rib notching (older children with collateral development).", citationIDs: ["openrn_peds_round9"])
        ],
        priorityAssessments: [
            AttributedBullet("4-extremity BP and pulses; pre/postductal SpO2 in neonates.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Perfusion of lower extremities; lactate; renal function.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Family history; assess for associated anomalies.", citationIDs: ["openrn_peds_round9"])
        ],
        commonInterventions: [
            AttributedBullet("Critical neonate — ALPROSTADIL (PGE1) IV to reopen ductus and restore lower-body perfusion; emergent transfer to pediatric cardiac center per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Surgical repair (end-to-end anastomosis or extended) — neonates and infants with critical coarctation per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Balloon angioplasty + stent — older children and recurrent coarctation per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Lifelong follow-up — recurrence, residual or systemic HTN, aortic dilation, intracranial aneurysm screening per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("HTN management even after repair — use ACEi/ARB or beta-blocker; monitor exercise BP per primary source.", citationIDs: ["openrn_peds_round9"])
        ],
        watchFor: [
            AttributedBullet("DUCTAL CLOSURE in undiagnosed coarctation → shock, multiorgan failure within hours; PGE1 emergently.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Persistent HTN post-repair — common; aggressive management to prevent end-organ damage.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Aneurysm at repair site or intracranial — periodic imaging.", citationIDs: ["openrn_peds_round9"])
        ],
        citations: [openrnPedsR9, pedSpecialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hypoplastic Left Heart Syndrome (HLHS)

public enum HLHSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hlhs",
        title: "Hypoplastic left heart syndrome (HLHS)",
        subtitle: "Underdeveloped left heart · ductal-dependent · staged Norwood / Glenn / Fontan",
        nclexTags: chdR9,
        definition: AttributedProse(
            "Spectrum of underdevelopment of left-sided heart structures (mitral valve, LV, aortic valve, ascending aorta). Without intervention, uniformly fatal in the first weeks of life. Survival depends on staged surgical palliation (Norwood → Glenn → Fontan) or transplant per primary source.",
            citationIDs: ["openrn_peds_round9", "ped_specialty_round9"]
        ),
        pathophysiology: AttributedProse(
            "Underdeveloped left ventricle cannot support systemic circulation. Systemic perfusion is entirely dependent on the right ventricle pumping through the ductus arteriosus to the aorta. Pulmonary blood return relies on patent ASD / foramen ovale.",
            citationIDs: ["openrn_peds_round9"]
        ),
        presentation: [
            AttributedBullet("Often diagnosed prenatally on fetal echo.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Postnatal — initially well, then progressive cyanosis, tachypnea, mottling, weak pulses, shock as PDA closes (typically days 1–3 of life).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Single second heart sound.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Lactic acidosis, AKI, ischemic gut.", citationIDs: ["openrn_peds_round9"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Fetal echocardiography (most common diagnosis route).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Postnatal echo — confirms anatomy.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("CXR — cardiomegaly, increased pulmonary markings as condition worsens.", citationIDs: ["openrn_peds_round9"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous SpO2 (pre- and postductal); HR, BP, perfusion.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("ABG, lactate, electrolytes, renal function, CBC.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Family / caregiver counseling and emotional support — diagnosis is overwhelming.", citationIDs: ["openrn_peds_round9"])
        ],
        commonInterventions: [
            AttributedBullet("ALPROSTADIL (PGE1) IV continuous infusion — life-sustaining ductal patency per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Goal-directed oxygen titration — AVOID 100% O2 unless clinically needed; target SpO2 ~75–85% for balanced circulation.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Transfer to specialized pediatric cardiac center.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("STAGED surgical palliation: Stage 1 NORWOOD (within first week); Stage 2 GLENN (4–6 mo); Stage 3 FONTAN (2–4 yr) per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Heart transplant — alternative to staged palliation in select cases.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Long-term — anticoagulation, exercise tolerance limits, future transplant possibility, complications of single-ventricle physiology (protein-losing enteropathy, plastic bronchitis, arrhythmia, liver fibrosis).", citationIDs: ["openrn_peds_round9"])
        ],
        watchFor: [
            AttributedBullet("DUCTAL CLOSURE → shock and death within hours; PGE1 essential.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("PGE1 apnea — INTUBATION READINESS at all times.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Hyperoxia → pulmonary vasodilation → over-pulmonary circulation, decreased systemic perfusion; titrate O2 carefully.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Family — high-stakes counseling; involve palliative care from the outset alongside cardiac team per primary source.", citationIDs: ["openrn_peds_round9"])
        ],
        citations: [openrnPedsR9, pedSpecialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - ALL (Acute Lymphoblastic Leukemia)

public enum ALLSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "all-leukemia",
        title: "Acute lymphoblastic leukemia (ALL)",
        subtitle: "Most common pediatric cancer · cytopenias · CNS prophylaxis · long protocols",
        nclexTags: oncR9,
        definition: AttributedProse(
            "Hematologic malignancy of immature lymphoid precursors (lymphoblasts). Most common pediatric cancer, peak age 2–5. Modern multi-agent chemotherapy + CNS prophylaxis achieves >90% long-term remission in pediatrics per primary source.",
            citationIDs: ["openrn_peds_round9", "ped_specialty_round9"]
        ),
        pathophysiology: AttributedProse(
            "Clonal proliferation of B- or T-cell lymphoid precursors → bone-marrow infiltration → cytopenias and extramedullary disease (CNS, testes, hepatosplenomegaly).",
            citationIDs: ["openrn_peds_round9"]
        ),
        presentation: [
            AttributedBullet("Bone-marrow failure — fatigue (anemia), bruising / petechiae / bleeding (thrombocytopenia), fever / infection (neutropenia).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Hepatosplenomegaly, lymphadenopathy.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Bone / joint pain — refusal to walk in young children.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("CNS — headache, vomiting, cranial-nerve palsy (less common at presentation).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Testicular swelling (less common at presentation; sanctuary site).", citationIDs: ["openrn_peds_round9"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CBC — variable WBC (low or markedly high), anemia, thrombocytopenia, blasts on smear.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Bone-marrow biopsy + cytogenetics + flow cytometry — diagnostic and prognostic.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Lumbar puncture for CSF cytology — assesses CNS involvement.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Risk stratification by age, WBC, immunophenotype, cytogenetics, MRD.", citationIDs: ["openrn_peds_round9"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs (sepsis screen), bleeding, bruising, hepatosplenomegaly.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Neurologic exam (CNS involvement); testicular exam in male patients.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Tumor lysis syndrome risk — especially at induction; trend K, phosphate, calcium, uric acid, creatinine.", citationIDs: ["openrn_peds_round9"])
        ],
        commonInterventions: [
            AttributedBullet("Multi-agent chemotherapy in PHASES — induction → consolidation → interim maintenance → delayed intensification → maintenance (typically 2.5–3 years total) per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Intrathecal chemotherapy + CNS-directed therapy (CRANIAL RADIATION reserved for high-risk).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Tumor lysis prophylaxis — IV hydration, allopurinol or rasburicase; close electrolyte monitoring per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Infection prophylaxis — PJP (TMP-SMX), antifungal during high-risk periods, IVIG if hypogammaglobulinemic.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Transfusion support — irradiated, leukoreduced, CMV-safe products.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Targeted / novel therapy — TKIs for Ph+ ALL (imatinib, dasatinib); CAR-T (tisagenlecleucel) for refractory / relapsed B-cell ALL per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Long-term follow-up for late effects — secondary malignancy, cardiotoxicity (anthracyclines), neurocognitive (CNS therapy), endocrine, fertility per primary source.", citationIDs: ["openrn_peds_round9"])
        ],
        watchFor: [
            AttributedBullet("FEBRILE NEUTROPENIA — emergency; cultures + empiric IV antibiotics within 1 hour per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("TUMOR LYSIS SYNDROME at induction — hyperK, hyperphos, hyperuricemia, AKI.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("CHEMO EXTRAVASATION — vesicants (vincristine, anthracyclines); central access preferred; treat per protocol.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Engagement of family, child-life, oncology social work — long-haul protocol.", citationIDs: ["openrn_peds_round9"])
        ],
        citations: [openrnPedsR9, pedSpecialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Wilms Tumor

public enum WilmsTumorSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "wilms-tumor",
        title: "Wilms tumor (nephroblastoma)",
        subtitle: "Most common pediatric renal tumor · abdominal mass · DO NOT palpate",
        nclexTags: oncR9,
        definition: AttributedProse(
            "Most common pediatric renal malignancy, typically presenting in children 2–5 years. Modern multi-modality therapy (surgery + chemotherapy ± radiation) achieves >90% long-term survival per primary source.",
            citationIDs: ["openrn_peds_round9", "ped_specialty_round9"]
        ),
        pathophysiology: AttributedProse(
            "Embryonal renal tumor arising from metanephric blastemal cells. Most are sporadic; ~10% syndromic (WAGR, Beckwith-Wiedemann, Denys-Drash, hemihypertrophy).",
            citationIDs: ["openrn_peds_round9"]
        ),
        presentation: [
            AttributedBullet("ASYMPTOMATIC abdominal mass discovered on routine bath / dressing — most common presentation.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Mass typically smooth, firm, unilateral, does NOT cross midline (vs neuroblastoma).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Hematuria, HTN, abdominal pain in some.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Constitutional — fever, anemia, weight loss less common.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Associations — aniridia, hemihypertrophy, GU anomalies.", citationIDs: ["openrn_peds_round9"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Abdominal ultrasound first-line.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("CT abdomen / pelvis + chest CT (lung mets).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Histology after surgical resection (NWTS / SIOP staging).", citationIDs: ["openrn_peds_round9"])
        ],
        priorityAssessments: [
            AttributedBullet("DO NOT PALPATE the abdomen — risk of tumor rupture and intraperitoneal seeding.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("BP — assess for renin-mediated HTN.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("UA, BUN/creatinine; assess for syndromic features.", citationIDs: ["openrn_peds_round9"])
        ],
        commonInterventions: [
            AttributedBullet("BEDSIDE SIGN — \"DO NOT PALPATE\" abdomen sign at all times until resection per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Surgical resection (radical nephrectomy) — generally up-front in U.S. (NWTS approach); SIOP approach gives neoadjuvant chemo first per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Adjuvant chemotherapy — vincristine, dactinomycin, doxorubicin per stage / histology per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Radiation for higher-stage / unfavorable histology disease.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Long-term follow-up for late effects — second malignancy, renal function (single kidney), cardiotoxicity, growth.", citationIDs: ["openrn_peds_round9"])
        ],
        watchFor: [
            AttributedBullet("TUMOR RUPTURE / INTRAPERITONEAL SEEDING — minimize abdominal palpation; gentle handling perioperatively.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Lung metastases — most common metastatic site; CT chest at diagnosis and surveillance.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Bilateral disease (~5%) — nephron-sparing approach.", citationIDs: ["openrn_peds_round9"])
        ],
        citations: [openrnPedsR9, pedSpecialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Neuroblastoma

public enum NeuroblastomaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "neuroblastoma",
        title: "Neuroblastoma",
        subtitle: "Embryonal sympathetic-nervous-system tumor · CROSSES midline · varied prognosis",
        nclexTags: oncR9,
        definition: AttributedProse(
            "Embryonal tumor of the sympathetic nervous system, most often in adrenal medulla or paraspinal sympathetic ganglia. Most common solid extracranial pediatric cancer in infants. Outcomes range from spontaneous regression in infants to high-mortality high-risk disease in older children per primary source.",
            citationIDs: ["openrn_peds_round9", "ped_specialty_round9"]
        ),
        pathophysiology: AttributedProse(
            "Arises from neural-crest cells. MYCN amplification, age >18 months, advanced stage are markers of high-risk disease. Catecholamine production (HVA, VMA) is a hallmark.",
            citationIDs: ["openrn_peds_round9"]
        ),
        presentation: [
            AttributedBullet("Abdominal mass that CAN CROSS midline (vs Wilms — does not cross midline).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Constitutional — fever, weight loss, fatigue.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Bone pain, limp, refusal to bear weight (bone mets).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Periorbital ecchymosis (\"raccoon eyes\") from orbital metastasis.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Opsoclonus-myoclonus syndrome — \"dancing eyes, dancing feet\" paraneoplastic.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("HTN, watery diarrhea (catecholamine secretion or VIP-secreting variant).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Subcutaneous \"blueberry muffin\" lesions in infants with stage 4S.", citationIDs: ["openrn_peds_round9"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Imaging — CT / MRI showing mass; MIBG scan; bone marrow.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Urine catecholamines (HVA, VMA) elevated.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Tissue biopsy + MYCN status + DNA index for risk stratification.", citationIDs: ["openrn_peds_round9"])
        ],
        priorityAssessments: [
            AttributedBullet("BP — paraneoplastic HTN.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Neurologic exam — spinal-cord compression (paraspinal tumors).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Pain assessment.", citationIDs: ["openrn_peds_round9"])
        ],
        commonInterventions: [
            AttributedBullet("Risk-stratified treatment — observation only for low-risk infant tumors; surgery + chemo for intermediate; intensive multimodal (chemo + surgery + radiation + autologous stem-cell transplant + dinutuximab immunotherapy + retinoid maintenance) for high-risk per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Pain management; ortho consult for cord compression.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Long-term follow-up — late effects of intensive therapy include hearing loss, growth, fertility, secondary malignancy per primary source.", citationIDs: ["openrn_peds_round9"])
        ],
        watchFor: [
            AttributedBullet("SPINAL-CORD COMPRESSION — paraspinal tumors; emergent steroids + neurosurgery / chemo / radiation per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Catecholamine crisis at induction.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Stage 4S in infants — paradoxically can spontaneously regress.", citationIDs: ["openrn_peds_round9"])
        ],
        citations: [openrnPedsR9, pedSpecialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Retinoblastoma

public enum RetinoblastomaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "retinoblastoma",
        title: "Retinoblastoma",
        subtitle: "Most common pediatric ocular malignancy · LEUKOCORIA · RB1 mutation",
        nclexTags: oncR9,
        definition: AttributedProse(
            "Most common malignant intraocular tumor of childhood. Caused by mutations in the RB1 tumor-suppressor gene. Hereditary (40%) or sporadic (60%); hereditary cases are often bilateral and confer increased lifetime risk of secondary cancers per primary source.",
            citationIDs: ["openrn_peds_round9", "ped_specialty_round9"]
        ),
        pathophysiology: AttributedProse(
            "Loss of both RB1 alleles → unregulated retinal-cell proliferation → tumor formation. Two-hit hypothesis — first hit germline (in hereditary) or somatic (sporadic), second hit somatic in retinal cell.",
            citationIDs: ["openrn_peds_round9"]
        ),
        presentation: [
            AttributedBullet("LEUKOCORIA (white pupillary reflex) — most common presenting sign; often noticed in photographs (\"cat's-eye reflex\").", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Strabismus (deviated eye).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Decreased vision; nystagmus; orbital inflammation.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Bilateral disease in hereditary (~40% of all cases).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Family history in some.", citationIDs: ["openrn_peds_round9"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Examination under anesthesia by pediatric ophthalmologist — definitive.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("MRI of orbits + brain (rule out trilateral disease — pinealoblastoma).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Genetic testing for RB1 in patient and family.", citationIDs: ["openrn_peds_round9"])
        ],
        priorityAssessments: [
            AttributedBullet("Visual acuity (age-appropriate); pupillary reflex (red reflex test); strabismus exam.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Family history; counsel siblings to undergo screening if hereditary.", citationIDs: ["openrn_peds_round9"])
        ],
        commonInterventions: [
            AttributedBullet("Treatment based on tumor extent — focal therapy (laser, cryotherapy, plaque brachytherapy) for small tumors; intra-arterial / intravitreal chemo for moderate; enucleation for advanced unilateral with no salvageable vision per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Systemic chemotherapy for high-risk pathologic features or metastatic disease.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Genetic counseling and screening for siblings / future children.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Long-term ophthalmology surveillance for new tumors (especially bilateral / hereditary patients).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Surveillance for SECONDARY MALIGNANCIES in hereditary patients — osteosarcoma, soft-tissue sarcoma, melanoma per primary source.", citationIDs: ["ped_specialty_round9"])
        ],
        watchFor: [
            AttributedBullet("DELAYED DIAGNOSIS — leukocoria can be missed in photos; PCP and parents should know the warning sign.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Trilateral retinoblastoma — pinealoblastoma in addition to bilateral retinal tumors; survival worse.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Psychosocial support post-enucleation; prosthesis fitting.", citationIDs: ["openrn_peds_round9"])
        ],
        citations: [openrnPedsR9, pedSpecialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cerebral Palsy

public enum CerebralPalsySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cerebral-palsy",
        title: "Cerebral palsy (CP)",
        subtitle: "Non-progressive motor disorder of early development · multidisciplinary care",
        nclexTags: muscR9,
        definition: AttributedProse(
            "Group of permanent, non-progressive movement and posture disorders attributed to disturbances in the developing fetal or infant brain. Manifestations evolve as the child grows but the underlying brain injury is static per primary source.",
            citationIDs: ["openrn_peds_round9", "ped_specialty_round9"]
        ),
        pathophysiology: AttributedProse(
            "Most cases prenatal — congenital malformations, infection, stroke, hypoxic-ischemic injury, prematurity. Subtypes: spastic (most common — increased tone, hyperreflexia), dyskinetic (athetoid, dystonic), ataxic, mixed.",
            citationIDs: ["openrn_peds_round9"]
        ),
        presentation: [
            AttributedBullet("Delayed motor milestones (rolling, sitting, walking).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Persistent primitive reflexes; abnormal tone (hypertonia or hypotonia).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Spastic types — scissoring gait, equinus posturing, contractures.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Dyskinetic — involuntary movements, dystonia.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Ataxic — uncoordinated movements, balance issues.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Comorbidities — intellectual disability, seizures, vision / hearing impairment, feeding difficulties, GERD, dental issues, scoliosis, hip dysplasia.", citationIDs: ["openrn_peds_round9"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — history + neurologic exam over time; typically diagnosed by age 2.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("MRI brain — identifies underlying lesion in most cases.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Gross Motor Function Classification System (GMFCS) levels I–V grade severity.", citationIDs: ["openrn_peds_round9"])
        ],
        priorityAssessments: [
            AttributedBullet("Functional ability (GMFCS); ADLs; communication; mobility aids needed.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Seizures — assessment + management.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Nutrition, swallowing, GERD, dental.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Family — caregiver support, school accommodations, mental health.", citationIDs: ["openrn_peds_round9"])
        ],
        commonInterventions: [
            AttributedBullet("MULTIDISCIPLINARY team — PT / OT / speech, neurology, orthopedics, developmental pediatrics, dentistry, social work, school nursing.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Spasticity management — PT / stretching, oral baclofen / tizanidine, intrathecal baclofen pump, botulinum toxin injections, orthopedic interventions per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Seizure management — AEDs.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Nutrition support — feeding therapy, G-tube if severe dysphagia / aspiration.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Mobility aids, AAC devices, classroom support.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Surveillance for hip dysplasia, scoliosis (annual exam ± imaging).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Transition to adult care planning — start adolescence.", citationIDs: ["openrn_peds_round9"])
        ],
        watchFor: [
            AttributedBullet("ASPIRATION pneumonia — leading cause of mortality; positioning, swallow evaluation, modify diet, G-tube.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("HIP DYSPLASIA / SCOLIOSIS in non-ambulatory patients; ortho referral.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("CAREGIVER BURDEN — high; respite, mental health support, social services.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Pressure injuries in non-ambulatory patients; positioning + skin care.", citationIDs: ["openrn_peds_round9"])
        ],
        citations: [openrnPedsR9, pedSpecialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Spina Bifida (Myelomeningocele)

public enum SpinaBifidaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "spina-bifida",
        title: "Spina bifida (myelomeningocele)",
        subtitle: "Neural-tube defect · sterile sac protection · post-op assessment + lifelong care",
        nclexTags: neuroR9,
        definition: AttributedProse(
            "Neural-tube defect resulting from incomplete neural-tube closure during early embryogenesis. Spectrum: spina bifida occulta (mildest), meningocele (sac contains meninges + CSF only), myelomeningocele (sac contains meninges + spinal cord — most severe and most clinically significant) per primary source.",
            citationIDs: ["openrn_peds_round9", "cdc_dx_round9"]
        ),
        pathophysiology: AttributedProse(
            "Failure of caudal neural-tube closure ~3–4 weeks gestation → exposed neural elements. Hydrocephalus from associated Arnold-Chiari II malformation in most patients with myelomeningocele. Folic-acid deficiency is a major modifiable risk factor.",
            citationIDs: ["openrn_peds_round9"]
        ),
        presentation: [
            AttributedBullet("Visible sac on the back at birth (myelomeningocele) — typically lumbosacral.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Lower-extremity weakness or paralysis depending on level.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Neurogenic bladder and bowel; absent rectal tone.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Hydrocephalus — increasing head circumference, bulging fontanelle, sunset eyes.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Spina bifida occulta — often subtle (hairy patch, dimple, lipoma over lumbosacral spine); usually asymptomatic.", citationIDs: ["openrn_peds_round9"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Prenatal — elevated maternal serum AFP, fetal US, fetal MRI per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Postnatal — visible defect, MRI / US for occulta and to assess associated anomalies.", citationIDs: ["openrn_peds_round9"])
        ],
        priorityAssessments: [
            AttributedBullet("PRESERVATION of the SAC — cover with STERILE saline-soaked gauze; PRONE positioning; protect from urine / stool contamination per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Head circumference (hydrocephalus); LATEX precautions from birth (high latex-allergy risk).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Neuro exam — lower-extremity movement, anal wink, bladder distention.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Family — emotional support; multidisciplinary planning.", citationIDs: ["openrn_peds_round9"])
        ],
        commonInterventions: [
            AttributedBullet("Surgical closure within 24–72 hours of birth (prenatal closure increasingly performed for selected fetuses) per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("VP shunt for hydrocephalus (most patients).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Bladder management — clean intermittent catheterization (CIC) typically by age ~3; bowel program.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("LATEX-FREE environment from birth — multiple lifetime exposures predispose to latex anaphylaxis per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Multidisciplinary lifelong care — neurosurgery, urology, orthopedics, PT/OT, neurology.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("PREVENTION — folic acid 400 mcg daily for ALL women of childbearing age + 4 mg/day for women with prior NTD pregnancy per primary source.", citationIDs: ["cdc_dx_round9"])
        ],
        watchFor: [
            AttributedBullet("SAC RUPTURE / INFECTION — meningitis risk; prone positioning, sterile dressing, IV antibiotics if rupture.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("HYDROCEPHALUS — increasing ICP; emergent shunt placement.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("LATEX ANAPHYLAXIS — life-threatening; latex-free supplies essential.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Tethered cord — back pain, gait change, new urinary symptoms in older child; neurosurgery evaluation.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("UTI / pyelonephritis from neurogenic bladder; routine surveillance.", citationIDs: ["openrn_peds_round9"])
        ],
        citations: [openrnPedsR9, cdcDxR9, pedSpecialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pediatric T1DM

public enum PedsT1DMSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pediatric-t1dm",
        title: "Type 1 diabetes mellitus (pediatric)",
        subtitle: "Autoimmune insulin deficiency · DKA risk · lifelong insulin",
        nclexTags: endoR9,
        definition: AttributedProse(
            "Autoimmune destruction of pancreatic beta cells → absolute insulin deficiency. Most common pediatric endocrine disorder. Often presents with new-onset hyperglycemia or DKA in children/adolescents per primary source.",
            citationIDs: ["openrn_peds_round9", "ped_specialty_round9"]
        ),
        pathophysiology: AttributedProse(
            "Genetic susceptibility (HLA-DR3/DR4) + environmental trigger → autoimmune attack on beta cells → insulin deficiency → hyperglycemia, lipolysis, ketogenesis, DKA.",
            citationIDs: ["openrn_peds_round9"]
        ),
        presentation: [
            AttributedBullet("Polyuria, polydipsia, polyphagia; weight loss.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Nocturnal enuresis (\"night-time wetting\") in previously continent child — often first sign noticed by family.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Fatigue; blurred vision.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("DKA at presentation — Kussmaul respirations, fruity breath, abdominal pain, vomiting, AMS, dehydration.", citationIDs: ["openrn_peds_round9"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Random glucose ≥200 with classic symptoms; OR fasting glucose ≥126; OR A1c ≥6.5; OR 2-hr OGTT ≥200 per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Pediatric T1 confirmed by autoantibodies (anti-GAD, anti-islet cell, anti-insulin, anti-IA-2) and low C-peptide.", citationIDs: ["openrn_peds_round9"])
        ],
        priorityAssessments: [
            AttributedBullet("ABCs in DKA; continuous monitoring of mental status, electrolytes, glucose, ketones, ABG.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Hydration status; potassium (will fall with insulin and acidosis correction).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Family — coping, support, school plan, emergency contacts.", citationIDs: ["openrn_peds_round9"])
        ],
        commonInterventions: [
            AttributedBullet("DKA — IV NS resuscitation; IV insulin infusion AFTER fluids started; potassium repletion as it falls; trend glucose, K, anion gap; transition to SQ insulin once anion gap closes per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("CEREBRAL EDEMA risk in pediatric DKA — slow gradual correction of glucose and osmolality; mannitol / hypertonic saline emergent if AMS develops per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Lifelong INSULIN — basal-bolus regimen (multiple daily injections OR insulin pump); no oral agents work in T1.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Continuous glucose monitor (CGM) is standard of care for pediatric T1DM per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Carb-counting + meal planning + exercise + sick-day rules + glucagon access.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Hybrid closed-loop systems (\"artificial pancreas\") increasingly used per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Mental-health screening — depression, eating disorders, diabetes distress are common per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Long-term — annual eye exam (after 5 yr disease or age 11), urine albumin / creatinine ratio, lipid panel, thyroid screen, celiac screening per primary source.", citationIDs: ["openrn_peds_round9"])
        ],
        watchFor: [
            AttributedBullet("PEDIATRIC DKA CEREBRAL EDEMA — leading cause of DKA death in children; slow careful correction; emergent treatment of AMS.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("HYPOGLYCEMIA — counsel on rule of 15 (15 g carb, recheck 15 min); glucagon for severe hypo; close follow-up after exercise.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Diabetic eating disorder (\"diabulimia\") — withholding insulin for weight loss; high mortality; screen.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("School support — IEP / 504 plan, glucagon access, training of school nurse and teachers per primary source.", citationIDs: ["openrn_peds_round9"])
        ],
        citations: [openrnPedsR9, pedSpecialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Down Syndrome

public enum DownSyndromeSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "down-syndrome",
        title: "Down syndrome (Trisomy 21)",
        subtitle: "Most common chromosomal cause of intellectual disability · multisystem care",
        nclexTags: geneticR9,
        definition: AttributedProse(
            "Genetic disorder caused by an extra copy of all or part of chromosome 21 — most often nondisjunction trisomy 21 (~95%); less commonly translocation or mosaicism. Most common chromosomal cause of intellectual disability per primary source.",
            citationIDs: ["openrn_peds_round9", "cdc_dx_round9"]
        ),
        pathophysiology: AttributedProse(
            "Extra chromosome 21 → overexpression of genes → multisystem effects: characteristic facial features, intellectual disability (variable), congenital anomalies (especially cardiac and GI), endocrine, hematologic, immunologic, and increased risk of certain cancers.",
            citationIDs: ["openrn_peds_round9"]
        ),
        presentation: [
            AttributedBullet("Facial — flattened facies, upward palpebral fissures, epicanthal folds, small ears, protruding tongue.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Hand — single transverse palmar (simian) crease, brachydactyly.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Hypotonia, joint laxity, brushfield spots.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Congenital heart disease in ~50% — most often AV septal defect (\"endocardial cushion\"), VSD, TOF.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("GI — duodenal atresia, Hirschsprung, celiac.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Endocrine — hypothyroidism (very common), DM.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Hematologic — transient myeloproliferative disorder, ALL / AML at 10–20× general population.", citationIDs: ["openrn_peds_round9"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Prenatal — combined 1st-trimester screening, cell-free DNA, diagnostic chorionic villus sampling / amniocentesis with karyotype per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Postnatal — chromosomal karyotype confirms trisomy 21.", citationIDs: ["openrn_peds_round9"])
        ],
        priorityAssessments: [
            AttributedBullet("Cardiac echo at birth (CHD screen).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Hearing + vision screening (early and ongoing).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Thyroid screening — at birth, 6 mo, 12 mo, then annually per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Atlanto-axial instability — assess before any cervical-spine intervention or contact sports per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Family — counseling, education, early-intervention referral.", citationIDs: ["openrn_peds_round9"])
        ],
        commonInterventions: [
            AttributedBullet("Multidisciplinary care — cardiology, endocrinology, ophthalmology, audiology, GI, neurology, developmental pediatrics, PT/OT/ST.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Early-intervention services from birth.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Surgical correction of CHD, GI atresia.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Routine peds + screening per AAP Health Supervision Guidelines for Children with Down Syndrome.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Vaccines per CDC schedule + pneumococcal, RSV considerations.", citationIDs: ["cdc_dx_round9"]),
            AttributedBullet("Adolescence — sexuality education; reproductive health counseling.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Adult — early Alzheimer's disease in 50s–60s; surveillance; transition to adult care.", citationIDs: ["openrn_peds_round9"])
        ],
        watchFor: [
            AttributedBullet("CHD post-op — pulmonary hypertension, AV-canal repair complications.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Atlanto-axial instability → spinal-cord injury — limit cervical-spine extension during intubation; avoid contact sports without screening.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("OSA — high prevalence; screen by age 4 with sleep study per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Hematologic — TMD in newborns may resolve but risk for AML / ALL persists; periodic CBC.", citationIDs: ["openrn_peds_round9"])
        ],
        citations: [openrnPedsR9, cdcDxR9, pedSpecialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Duchenne Muscular Dystrophy

public enum DuchenneSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "duchenne-md",
        title: "Duchenne muscular dystrophy (DMD)",
        subtitle: "X-linked dystrophin deficiency · Gowers' sign · cardiopulmonary surveillance",
        nclexTags: muscR9,
        definition: AttributedProse(
            "X-linked recessive degenerative muscle disease caused by absence of dystrophin protein (deletions in the DMD gene). Most common pediatric muscular dystrophy. Onset 2–5 years; loss of ambulation typically by age 12; cardiomyopathy and respiratory failure are leading causes of death per primary source.",
            citationIDs: ["openrn_peds_round9", "ped_specialty_round9"]
        ),
        pathophysiology: AttributedProse(
            "Dystrophin gene mutation → absent dystrophin protein → muscle-fiber instability → progressive muscle necrosis with regeneration → fibrosis and fatty replacement → progressive weakness, cardiomyopathy, respiratory muscle failure.",
            citationIDs: ["openrn_peds_round9"]
        ),
        presentation: [
            AttributedBullet("Delayed motor milestones; toe walking; clumsiness.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("GOWERS' SIGN — child uses arms to \"climb up\" their thighs to stand from floor.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Calf pseudohypertrophy (fatty infiltration giving false appearance of muscle bulk).", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Lordosis, waddling gait, frequent falls.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Loss of ambulation typically by age 12; cardiomyopathy and respiratory weakness develop in adolescence.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Cognitive — IQ typically slightly lower than average, learning disabilities common.", citationIDs: ["openrn_peds_round9"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Markedly elevated CK (often >10,000) at presentation.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Genetic testing for DMD gene mutation — definitive.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Muscle biopsy — absence of dystrophin (rarely needed if genetics positive).", citationIDs: ["openrn_peds_round9"])
        ],
        priorityAssessments: [
            AttributedBullet("Functional ability over time; mobility aids, wheelchair planning.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Cardiac — annual ECG and echo from diagnosis; cardiomyopathy develops insidiously per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Pulmonary — annual pulmonary function from age 7; nocturnal hypoventilation screen as disease progresses.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Bone health — DXA; nutrition; vitamin D.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Family — caregiver burden, mental health, transition planning.", citationIDs: ["openrn_peds_round9"])
        ],
        commonInterventions: [
            AttributedBullet("GLUCOCORTICOIDS (prednisone or deflazacort) slow disease progression — mainstay of therapy per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Exon-skipping therapies (eteplirsen, golodirsen, casimersen, viltolarsen) for amenable mutations per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Cardiac — ACEi/ARB and beta-blocker for cardioprotection from age 10 (or earlier per echo) per primary source.", citationIDs: ["ped_specialty_round9"]),
            AttributedBullet("Pulmonary — non-invasive ventilation (BiPAP) for nocturnal hypoventilation; cough-assist devices; vaccinations.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("PT, mobility aids, wheelchair, scoliosis surgery, contracture management.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Nutrition support; G-tube as swallowing weakens.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Multidisciplinary care; psychosocial support; eventual transition to adult care or hospice.", citationIDs: ["openrn_peds_round9"])
        ],
        watchFor: [
            AttributedBullet("CARDIOMYOPATHY — leading cause of mortality; aggressive cardioprotection.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("RESPIRATORY FAILURE — gradual; nocturnal hypoventilation often missed without sleep study.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("MALIGNANT HYPERTHERMIA-LIKE reaction with succinylcholine and volatile anesthetics — DOCUMENT and counsel ANY anesthesia team in advance per primary source.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Steroid side effects — weight gain, osteoporosis, cataracts, growth — careful monitoring.", citationIDs: ["openrn_peds_round9"]),
            AttributedBullet("Carrier daughters — counsel about reproductive risk and risk of cardiomyopathy themselves; periodic cardiac surveillance.", citationIDs: ["openrn_peds_round9"])
        ],
        citations: [openrnPedsR9, pedSpecialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}
