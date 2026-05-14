import Foundation

// Curator-model diagnoses (round 38 part A — neonatal/infant pediatric).

private let openrnPedsR38A = CitationSource(
    id: "openrn_peds_r38a",
    shortName: "Open RN Maternal Newborn + Pediatric Nursing",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/maternalnewborn/",
    lastRetrieved: "2026-05-13"
)
private let cdcPedsR38A = CitationSource(
    id: "cdc_peds_r38a",
    shortName: "CDC + AAP + NIH concept citations",
    publisher: "CDC · AAP · NIH",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyPedsR38A = CitationSource(
    id: "specialty_peds_r38a",
    shortName: "AAP + APSA + NASPGHAN + AHA + Endocrine Society fact citations",
    publisher: "AAP · APSA · NASPGHAN · AHA · Endocrine Society",
    license: .factCitationOnly,
    url: "https://www.aap.org/",
    lastRetrieved: "2026-05-13"
)

private let pedsTagsR38A = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .physiologicalAdaptation,
    priorityConcept: .gasExchange
)
private let pedsGITagsR38A = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .physiologicalAdaptation,
    priorityConcept: .elimination
)
private let pedsEndoTagsR38A = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .physiologicalAdaptation,
    priorityConcept: .glucoseRegulation
)

public enum MalrotationVolvulusSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "malrotation-volvulus",
        title: "Malrotation with midgut volvulus",
        subtitle: "Newborn surgical emergency · BILIOUS emesis = volvulus until proven otherwise · upper GI series · emergent Ladd procedure · bowel ischemia 6 hr window",
        nclexTags: pedsGITagsR38A,
        definition: AttributedProse(
            "Intestinal malrotation — congenital defect of bowel rotation during embryologic development; occurs in 1:500 live births; can present with midgut VOLVULUS (twisting around superior mesenteric artery) at any age but most common in first month of life. BILIOUS EMESIS in any infant <1 year is malrotation with volvulus until proven otherwise — surgical EMERGENCY; bowel ischemia + necrosis develops within 6 hours of complete vascular compromise per primary source.",
            citationIDs: ["specialty_peds_r38a"]
        ),
        pathophysiology: AttributedProse(
            "Embryologic failure of intestinal rotation around superior mesenteric artery (SMA) → narrow mesenteric base + abnormal Ladd bands → predisposition to twisting; midgut volvulus → SMA compression → bowel ischemia → necrosis (6-hr window from torsion); can also present with chronic intermittent abdominal pain, failure to thrive, malabsorption from partial obstruction.",
            citationIDs: ["specialty_peds_r38a"]
        ),
        presentation: [
            AttributedBullet("BILIOUS EMESIS in infant <1 year — RED FLAG; SURGICAL EMERGENCY; do NOT attribute to gastroenteritis or feeding intolerance.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Acute volvulus — sudden bilious emesis + abdominal distension + pain (irritability) + bloody stools (late, ischemia) + shock signs (lethargy, hypotension, tachycardia).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Chronic / intermittent — recurrent abdominal pain + emesis + failure to thrive + diarrhea + malabsorption; often missed for months.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Older children + adults — chronic abdominal pain + emesis + intermittent obstruction.", citationIDs: ["openrn_peds_r38a"])
        ],
        diagnosticCriteria: [
            AttributedBullet("UPPER GI SERIES — gold standard; abnormal duodenal-jejunal junction position (should be left of midline + at level of pylorus) + corkscrew appearance of duodenum/jejunum confirms volvulus.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Abdominal X-ray — may show double bubble (gastric + duodenal distension), paucity of distal gas, free air if perforation; can be normal early.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Ultrasound — \"whirlpool sign\" of SMA + SMV; can confirm but UGI is definitive.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Labs — metabolic acidosis + lactic acidosis + leukocytosis suggests bowel ischemia; CBC + BMP + lactate + type/screen.", citationIDs: ["specialty_peds_r38a"])
        ],
        priorityAssessments: [
            AttributedBullet("Hemodynamic status — sepsis-like shock from bowel ischemia; emergent fluid resuscitation + ICU.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Time-to-OR — delays = bowel necrosis; aim for OR within hours of diagnosis.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Acid-base + lactate — markers of bowel viability; rising lactate = ischemia.", citationIDs: ["specialty_peds_r38a"])
        ],
        commonInterventions: [
            AttributedBullet("EMERGENT SURGICAL CONSULTATION — Ladd procedure (counterclockwise detorsion + lysis of Ladd bands + appendectomy + duodenum to right + cecum to left); time-critical.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("NPO + NG decompression + IV fluid resuscitation (20 mL/kg NS bolus → reassess); cardiac monitor.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Broad-spectrum IV antibiotics if peritoneal signs OR ischemic bowel; ampicillin + gentamicin + metronidazole typical.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Pain management — IV opioids (fentanyl 1-2 mcg/kg).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Pre-op preparation — type + crossmatch, coagulation panel, anesthesia consultation.", citationIDs: ["openrn_peds_r38a"]),
            AttributedBullet("Post-op — bowel rest + TPN if extensive resection (short bowel syndrome risk); long-term GI follow-up.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Family communication + emotional support; outcomes depend on extent of necrosis at time of surgery.", citationIDs: ["openrn_peds_r38a"])
        ],
        watchFor: [
            AttributedBullet("Bowel necrosis + short bowel syndrome — extensive resection may require lifelong TPN; transplantation rarely needed.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Sepsis + multiorgan failure — from ischemic bowel + bacterial translocation; ICU support.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Recurrent volvulus — rare after Ladd procedure; counsel family about long-term obstruction risk + late presentation.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Adhesive small bowel obstruction — common late complication; abdominal pain + emesis + obstipation; surgical evaluation.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("DELAYS in diagnosis cause permanent disability + mortality; education for emergency providers about bilious emesis as red flag.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Long-term — feeding difficulties + nutritional support + GI follow-up.", citationIDs: ["openrn_peds_r38a"])
        ],
        citations: [openrnPedsR38A, cdcPedsR38A, specialtyPedsR38A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BiliaryAtresiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "biliary-atresia",
        title: "Biliary atresia",
        subtitle: "Progressive obliteration of extrahepatic bile ducts · jaundice >14 days · ACHOLIC stools · Kasai HPE before 60-90 days · liver transplant ultimate",
        nclexTags: pedsGITagsR38A,
        definition: AttributedProse(
            "Biliary atresia — progressive idiopathic obliteration of extrahepatic bile ducts presenting in newborns; affects 1:8,000-15,000 live births; leads to cirrhosis + liver failure. EARLY DIAGNOSIS critical — Kasai hepatoportoenterostomy (HPE) before 60-90 days of life significantly improves bile flow + delays need for transplant. JAUNDICE PERSISTING >14 DAYS in newborn requires urgent evaluation including conjugated/direct bilirubin per primary source.",
            citationIDs: ["specialty_peds_r38a"]
        ),
        pathophysiology: AttributedProse(
            "Idiopathic inflammation + fibrotic obliteration of extrahepatic bile ducts → bile flow obstruction → cholestasis → progressive hepatic damage + cirrhosis. Often associated with other anomalies (BASM — Biliary Atresia Splenic Malformation syndrome with polysplenia, situs inversus). Type 1 (distal CBD), Type 2 (common hepatic duct), Type 3 (most common — entire extrahepatic system).",
            citationIDs: ["specialty_peds_r38a"]
        ),
        presentation: [
            AttributedBullet("PROLONGED JAUNDICE >14 days in term newborn (>21 days in preterm) — RED FLAG requiring direct bilirubin (NOT just total).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("ACHOLIC (clay-colored, white, pale) STOOLS — most specific sign; review parental smartphone photos of diapers.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Dark urine — conjugated bilirubin in urine.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Hepatomegaly + splenomegaly (later).", citationIDs: ["openrn_peds_r38a"]),
            AttributedBullet("Failure to thrive (later, malabsorption + cirrhosis).", citationIDs: ["openrn_peds_r38a"]),
            AttributedBullet("Vitamin K deficiency bleeding — rare presentation as intracranial hemorrhage.", citationIDs: ["specialty_peds_r38a"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DIRECT (CONJUGATED) BILIRUBIN >2 mg/dL OR >20% of total bilirubin in newborn = pathologic cholestasis; emergent workup.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Liver function tests — elevated GGT (most specific for biliary obstruction), ALT/AST, alkaline phosphatase.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Coagulation — PT/INR (vitamin K malabsorption), correct with vitamin K before procedures.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Abdominal ultrasound — absent or contracted gallbladder + triangular cord sign (fibrous remnant); may be normal in early disease.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("HIDA scan with phenobarbital priming — failure to excrete tracer to small bowel suggests biliary obstruction.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Liver biopsy — bile duct proliferation + plug formation + fibrosis; differentiates from other causes.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Rule out other causes of neonatal cholestasis — TORCH, alpha-1 antitrypsin, Alagille, CF, metabolic.", citationIDs: ["specialty_peds_r38a"])
        ],
        priorityAssessments: [
            AttributedBullet("Time to Kasai — outcomes proportional to age at HPE; <60 days best, <90 days acceptable, >90 days reduced success.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Coagulation status — vitamin K replacement before any procedure.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Nutrition + growth — fat-soluble vitamin replacement (A, D, E, K), MCT-enriched formula.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Long-term planning — Kasai is bridge; majority require transplant by adolescence.", citationIDs: ["specialty_peds_r38a"])
        ],
        commonInterventions: [
            AttributedBullet("KASAI HEPATOPORTOENTEROSTOMY (HPE) — surgical creation of biliary drainage by attaching jejunal Roux limb to porta hepatis; ASAP after diagnosis (target <60 days, definitely <90 days).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Pre-op — vitamin K supplementation, correct coagulopathy, FFP if active bleeding.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Post-Kasai — antibiotics prophylaxis (cholangitis prevention) typically TMP-SMX or amoxicillin × 6-12 months.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Post-Kasai — ursodeoxycholic acid for bile flow + steroids (controversial).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Nutritional support — high-calorie + MCT formula (Pregestimil, Alimentum) + fat-soluble vitamins.", citationIDs: ["openrn_peds_r38a"]),
            AttributedBullet("Long-term — pediatric hepatology follow-up, surveillance for complications, eventual liver transplant evaluation.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("LIVER TRANSPLANT — definitive for failed Kasai or progressive cirrhosis; ~50-80% of biliary atresia patients require transplant by age 10-20.", citationIDs: ["specialty_peds_r38a"])
        ],
        watchFor: [
            AttributedBullet("CHOLANGITIS — most common post-Kasai complication; fever + jaundice + abdominal pain; antibiotics IV; recurrent leads to liver damage.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Portal hypertension + variceal bleeding — late complication; surveillance endoscopy + beta-blockers + variceal banding.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Ascites + hepatic encephalopathy — late complications of cirrhosis.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Failure to thrive + nutritional deficiency — fat-soluble vitamin deficiency + feeding difficulties.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Hepatocellular carcinoma — long-term risk in biliary atresia patients with cirrhosis.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Family + caregiver education — recognizing cholangitis, vitamin compliance, transplant preparation, emotional support.", citationIDs: ["openrn_peds_r38a"]),
            AttributedBullet("EARLY recognition crucial — JAUNDICE >14 days = workup; do NOT attribute to physiologic or breast milk jaundice without checking direct bilirubin.", citationIDs: ["specialty_peds_r38a"])
        ],
        citations: [openrnPedsR38A, cdcPedsR38A, specialtyPedsR38A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TEFSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "tracheoesophageal-fistula",
        title: "Tracheoesophageal fistula (TEF) + esophageal atresia (EA)",
        subtitle: "Newborn — DROOLING + choking + cyanosis with feeds + COILED NG tube on CXR · Type C most common (85%) · emergent surgical repair · VACTERL association",
        nclexTags: pedsTagsR38A,
        definition: AttributedProse(
            "Esophageal atresia (EA) with or without tracheoesophageal fistula (TEF) — congenital defect (~1:3,500 live births); failure of esophagus + trachea to separate during embryologic development. Type C (proximal EA + distal TEF) is most common (~85%). Symptoms within hours-days of birth. Associated with VACTERL syndrome (Vertebral, Anorectal, Cardiac, TEF, Renal, Limb anomalies — workup essential). Emergent surgical repair per primary source.",
            citationIDs: ["specialty_peds_r38a"]
        ),
        pathophysiology: AttributedProse(
            "Failure of foregut separation 4-6 weeks gestation → blind-ending esophageal pouch + abnormal connection between esophagus + trachea. Five anatomical types — Type A (EA without TEF, 7%), Type B (proximal EA + proximal TEF, rare), Type C (proximal EA + distal TEF, 85%, most common), Type D (proximal EA + proximal + distal TEF, rare), Type E / H-type (TEF without atresia, 4%, often delayed diagnosis).",
            citationIDs: ["specialty_peds_r38a"]
        ),
        presentation: [
            AttributedBullet("DROOLING + EXCESSIVE SECRETIONS — newborn unable to swallow saliva pools.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("CHOKING + COUGHING + CYANOSIS with feeds — esophageal pouch overflow into airway.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("ABDOMINAL DISTENSION — gastric distension from air entering through TEF (Type C, distal fistula).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("COILED NG TUBE on CXR — diagnostic; tube cannot pass into stomach due to atresia.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("PRENATAL — POLYHYDRAMNIOS in mother + small/absent fetal stomach on US (suggests EA).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("H-type TEF — recurrent pneumonia, choking with feeds, often delayed diagnosis (months-years).", citationIDs: ["specialty_peds_r38a"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CHEST X-RAY with NG TUBE — coiled in upper esophagus = diagnostic for EA; abdominal gas pattern indicates distal TEF (Type C).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Echocardiogram — cardiac anomaly screening (VACTERL); ~25-50% have cardiac defects; affects surgical timing + approach.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Renal ultrasound + spinal X-ray — VACTERL workup (renal, vertebral anomalies).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Bronchoscopy + esophagoscopy — direct visualization at time of repair.", citationIDs: ["specialty_peds_r38a"])
        ],
        priorityAssessments: [
            AttributedBullet("Airway protection — high suction risk; aspiration pneumonia common before diagnosis.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("VACTERL workup — 50% have associated anomalies; cardiac evaluation before surgery.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Nutritional planning — gastrostomy tube placement common until oral feeding established.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Surgical timing — emergent in symptomatic; delayed for stable VLBW or significant cardiac anomalies.", citationIDs: ["specialty_peds_r38a"])
        ],
        commonInterventions: [
            AttributedBullet("IMMEDIATE — NPO; head of bed elevated; CONTINUOUS suction of esophageal pouch (Replogle tube to LCWS — low continuous wall suction); IV fluids; warm + dry; transfer to NICU.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("EMERGENT pediatric surgery consultation; thoracic surgery for TEF ligation + esophageal anastomosis; gastrostomy if cannot anastomose primarily.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Antibiotic prophylaxis — pneumonia common; broad-spectrum.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Cardiac evaluation pre-op — concomitant cardiac surgery may be needed.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Post-op — chest tube management, suture line healing, gradual feeding advance via gastrostomy then PO.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Long-term — esophageal stricture (most common complication, requires dilations), GERD (severe), tracheomalacia (residual airway softening), recurrent fistula, swallowing difficulties.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Multidisciplinary — neonatology + thoracic surgery + cardiology + nutrition + speech therapy + family support.", citationIDs: ["specialty_peds_r38a"])
        ],
        watchFor: [
            AttributedBullet("ASPIRATION PNEUMONIA — most immediate threat pre-repair; CONTINUOUS suction of pouch + NPO + head of bed elevated.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("ANASTOMOTIC LEAK — post-op; chest tube drainage + sepsis signs; emergent reoperation.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("ESOPHAGEAL STRICTURE — long-term; requires periodic dilations (bougie or balloon).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("GERD — severe; PPI + sometimes Nissen fundoplication.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("TRACHEOMALACIA — residual airway softening; brassy cough + episodic respiratory distress; usually improves with growth, sometimes surgical aortopexy.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("RECURRENT FISTULA — choking with feeds + recurrent pneumonia; requires reoperation.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("FEEDING DIFFICULTIES + DYSPHAGIA — long-term; speech therapy + feeding therapy.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Long-term GI surveillance — Barrett esophagus risk in adulthood from chronic GERD.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Family support + education — chronic condition requiring multidisciplinary follow-up; emotional + practical support.", citationIDs: ["openrn_peds_r38a"])
        ],
        citations: [openrnPedsR38A, cdcPedsR38A, specialtyPedsR38A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CongenitalHypothyroidismSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "congenital-hypothyroidism",
        title: "Congenital hypothyroidism",
        subtitle: "Newborn screen detection · 1:2000-4000 · LEVOTHYROXINE replacement BEFORE 2 weeks of life prevents intellectual disability · lifelong therapy",
        nclexTags: pedsEndoTagsR38A,
        definition: AttributedProse(
            "Congenital hypothyroidism — most common preventable cause of intellectual disability; affects 1:2,000-4,000 live births. Detected by NEWBORN SCREENING (state-mandated heel stick); EARLY treatment with levothyroxine (initiation by 14 days of life) prevents cognitive deficits + ensures normal development. Untreated = profound intellectual disability + growth failure (cretinism) per primary source.",
            citationIDs: ["specialty_peds_r38a"]
        ),
        pathophysiology: AttributedProse(
            "Causes — thyroid dysgenesis (agenesis, ectopic, hypoplastic — most common 80%), dyshormonogenesis (enzyme defect 15%), TSH receptor defect, transient (maternal antibodies, iodine deficiency/excess, drugs); rare central (pituitary). Inadequate thyroid hormone during critical brain development causes irreversible cognitive impairment if untreated.",
            citationIDs: ["specialty_peds_r38a"]
        ),
        presentation: [
            AttributedBullet("MOST identified by NEWBORN SCREENING before symptoms develop (asymptomatic in newborn period).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("If symptoms — large fontanelles, prolonged jaundice (indirect, beyond 2 weeks), umbilical hernia, hypothermia, lethargy, poor feeding, constipation, hoarse cry.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Late untreated — coarse facies, macroglossia, dry skin, cool extremities, bradycardia, slow growth, delayed development, anemia.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("CRETINISM — severe untreated CH: profound intellectual disability + short stature + characteristic features (now rare in screened populations).", citationIDs: ["specialty_peds_r38a"])
        ],
        diagnosticCriteria: [
            AttributedBullet("NEWBORN SCREEN — TSH (most states; primary screening) ± total T4; heel stick at 24-72 hours of life; abnormal triggers immediate confirmatory testing.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Confirmatory venous TSH + free T4 — TSH elevated + free T4 low confirms primary CH; STAT lab if abnormal screen.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Etiologic workup — thyroid ultrasound + radioactive iodine scan (helps distinguish dysgenesis vs dyshormonogenesis); thyroglobulin.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Maternal thyroid history — autoimmune disease + medications + iodine status; transient causes investigated.", citationIDs: ["specialty_peds_r38a"])
        ],
        priorityAssessments: [
            AttributedBullet("TIME TO TREATMENT — initiate levothyroxine WITHIN 14 DAYS of life; delays cause permanent cognitive damage.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Adherence + monitoring — lifelong therapy; periodic dose adjustment for growth.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Family education — administration technique, importance of consistency, expected normal development.", citationIDs: ["openrn_peds_r38a"])
        ],
        commonInterventions: [
            AttributedBullet("LEVOTHYROXINE 10-15 mcg/kg/day PO once daily — start within 14 days of life; never delay for confirmatory testing if screening positive.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Tablet form preferred (more reliable than liquid suspensions which have variable bioavailability); CRUSH tablet + dissolve in 1-2 mL breast milk or formula immediately before administering; do NOT mix in full bottle (variable dose).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("AVOID administering with iron, calcium, soy formula (interferes with absorption); separate by 4 hours.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Monitoring — TSH + free T4 at 2 weeks, then Q1-2 months × 6 months, then Q3 months × 1 year, then Q4-6 months; goal TSH 0.5-2 mIU/L, free T4 normal.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Pediatric endocrinology referral + lifelong follow-up.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Developmental monitoring — most achieve normal cognitive function with early treatment; subtle deficits possible if delayed treatment.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Re-evaluation at age 3 — confirm permanent vs transient hypothyroidism; trial off therapy + repeat TSH/T4 after 4-6 weeks.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Family support — emotional adjustment to diagnosis + lifelong therapy; reassurance about normal outcomes with treatment.", citationIDs: ["openrn_peds_r38a"])
        ],
        watchFor: [
            AttributedBullet("OVERTREATMENT — irritability, tachycardia, poor weight gain, premature craniosynostosis; reduce dose if TSH suppressed.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("UNDERTREATMENT — persistent symptoms; growth + development delay; missed doses + interactions; education + adherence support.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("ABSORPTION ISSUES — iron, calcium, soy, antacids, PPIs, fiber; separate by 4 hours.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Transient cases — discontinue at age 3 if clinically + biochemically euthyroid off therapy.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Subtle DD — even with adequate treatment, mild cognitive deficits (lower IQ scores) possible; early intervention services if any concerns.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Iron deficiency anemia — common comorbidity; screen periodically.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Future fertility + pregnancy planning — adjusts levothyroxine dose; monitoring TSH preconception + during pregnancy.", citationIDs: ["specialty_peds_r38a"])
        ],
        citations: [openrnPedsR38A, cdcPedsR38A, specialtyPedsR38A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BRUESample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "brue",
        title: "BRUE (Brief Resolved Unexplained Event)",
        subtitle: "Replaced ALTE 2016 · infant <1 yr · sudden brief episode (color/breathing/tone/responsiveness) RESOLVED at presentation · low-risk vs high-risk stratification · workup",
        nclexTags: pedsTagsR38A,
        definition: AttributedProse(
            "Brief Resolved Unexplained Event (BRUE) — replaced ALTE (Apparent Life-Threatening Event) terminology in 2016 AAP guideline. Infant <1 year with SUDDEN, BRIEF, RESOLVED episode of one or more: cyanosis or pallor; absent/decreased/irregular breathing; marked change in tone (hyper/hypotonia); altered responsiveness. Episode resolved at presentation + no underlying cause identified despite history + exam. RISK STRATIFICATION (low-risk vs higher-risk) guides workup intensity per primary source.",
            citationIDs: ["specialty_peds_r38a"]
        ),
        pathophysiology: AttributedProse(
            "BRUE is a description, not a diagnosis — actual cause may be GERD, feeding issue, seizure, infection, child abuse, cardiac arrhythmia, breath-holding spell, or normal infant behavior misperceived. Most BRUEs are benign + self-limited; minority are sentinel events for serious underlying pathology requiring identification.",
            citationIDs: ["specialty_peds_r38a"]
        ),
        presentation: [
            AttributedBullet("Caregiver report of infant <1 year experiencing SUDDEN BRIEF EPISODE — typically <1 minute — of color change (cyanotic, pallor), breathing change (apnea, irregular), tone change (limp, stiff), or responsiveness change.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("RESOLVED at presentation — infant looks WELL on exam.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("If unwell at presentation OR specific features (fever, sepsis, seizure, persistent symptoms) → NOT BRUE; pursue differential.", citationIDs: ["specialty_peds_r38a"])
        ],
        diagnosticCriteria: [
            AttributedBullet("LOW-RISK BRUE criteria (ALL must be met): Age >60 days; Born ≥32 weeks gestation + corrected age >45 weeks; First event; Duration <1 minute; No CPR by trained provider; No concerning history; No concerning exam findings.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("HIGHER-RISK if any criterion not met OR concerning features (recurrent, prolonged, CPR required, fever, abnormal exam, family history of sudden death).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Comprehensive history — environment + position + exposure + duration + interventions + meal timing + caregiver observations + timeline; prior episodes + family history (sudden death, cardiac, seizures).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Detailed exam — head-to-toe; bruising/injury (abuse), oral exam (oral injury, frenulum), abdominal, cardiac (murmur), respiratory, neurologic, growth.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("LOW-RISK BRUE — minimal workup; pulse oximetry + brief observation 1-4 hours; consider EKG; no routine labs/imaging.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("HIGHER-RISK BRUE — admission + monitoring + targeted workup based on suspected etiology (sepsis, seizure, abuse, cardiac, GERD).", citationIDs: ["specialty_peds_r38a"])
        ],
        priorityAssessments: [
            AttributedBullet("Risk stratification — low vs higher-risk to guide workup + disposition.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Underlying cause identification — sepsis, seizure, cardiac, abuse, metabolic, ENT, respiratory.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Family education + reassurance + safety planning.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Child abuse — \"sentinel injury\" concept; ANY bruise/injury in pre-mobile infant warrants child abuse evaluation.", citationIDs: ["specialty_peds_r38a"])
        ],
        commonInterventions: [
            AttributedBullet("LOW-RISK BRUE — reassurance + caregiver education + observation period (1-4 hours) + safe sleep counseling; routine workup NOT indicated; CPR training offer.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("HIGHER-RISK BRUE — admission + cardiac + respiratory monitoring + targeted workup (CBC, BMP, glucose, urinalysis, blood culture if febrile/ill, EKG, EEG if seizure suspected, echo if cardiac, pH probe/EGD for GERD).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("CHILD ABUSE evaluation — skeletal survey (children <2 years), head imaging, ophthalmology (retinal hemorrhages), CPS report if suspicion; do NOT confront caregiver.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Multidisciplinary — pediatrics + neurology + cardiology + child abuse pediatrics as needed.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Caregiver SAFE SLEEP counseling — ABC of safe sleep — Alone, on Back, in Crib (no co-sleeping, no soft bedding, no bumpers, firm flat surface).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("CPR + first-aid training for caregivers.", citationIDs: ["openrn_peds_r38a"]),
            AttributedBullet("Follow-up — pediatrician within 24-72 hours; documentation of episode + plan.", citationIDs: ["openrn_peds_r38a"])
        ],
        watchFor: [
            AttributedBullet("RECURRENCE — repeat episodes increase concern; admit + further workup.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("MISSED CHILD ABUSE — pre-mobile infant injury is sentinel; sentinel injury → 4x higher subsequent severe abuse + death; LOW THRESHOLD for evaluation.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("MISSED SEIZURE — recurrent or post-event symptoms; EEG.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("MISSED CARDIAC — family history of sudden death + arrhythmia; EKG + ECHO + Holter.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Caregiver anxiety + emotional impact — significant; address concerns + provide support + resources.", citationIDs: ["openrn_peds_r38a"]),
            AttributedBullet("SIDS — distinct entity; BRUE workup may identify modifiable risks; safe sleep education essential.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Most BRUEs benign + non-recurrent — reassurance important; avoid overinvestigation in low-risk.", citationIDs: ["specialty_peds_r38a"])
        ],
        citations: [openrnPedsR38A, cdcPedsR38A, specialtyPedsR38A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PediatricFeverWithoutSourceSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pediatric-fever-without-source",
        title: "Pediatric fever without source (FWS)",
        subtitle: "Age-stratified workup · NEONATE (<28 d): full sepsis · INFANT 1-3 mo: stratified · CHILD 3-36 mo: clinical assessment + UA + considerations · UTI is most common occult infection",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .infection
        ),
        definition: AttributedProse(
            "Fever without source (FWS) — temperature ≥38.0°C (100.4°F) rectal in child without identifiable focus on history + exam; common pediatric ED presentation. AGE-STRATIFIED WORKUP — risk of serious bacterial infection (SBI — pyelonephritis, bacteremia, meningitis) varies by age + immunization status. NEONATES at highest risk + require full sepsis workup; older infants + young children risk-stratified by clinical appearance + lab findings per primary source.",
            citationIDs: ["specialty_peds_r38a"]
        ),
        pathophysiology: AttributedProse(
            "Fever is normal physiologic response to infection (cytokine-mediated hypothalamic reset); MOST pediatric fever is viral (self-limited); SERIOUS BACTERIAL INFECTION (SBI) — UTI most common occult source (3-7%), bacteremia (<1% in vaccinated era), meningitis (rare). Pre-Hib + pre-pneumococcal vaccine era had higher SBI rates; current era with universal vaccination has dramatically reduced occult bacteremia.",
            citationIDs: ["specialty_peds_r38a"]
        ),
        presentation: [
            AttributedBullet("Fever ≥38.0°C rectal (preferred in <3 months), oral, or temporal; axillary unreliable in young infants.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("No focal source on history + exam — no respiratory symptoms, no GI symptoms, no rash, no focal pain, no specific exposures.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Well-appearing — alert, playful, smiling, easy to console, normal hydration; ill-appearing requires aggressive workup regardless of age.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Toxic appearance (lethargy, poor perfusion, weak cry, paradoxical irritability) = high concern for SBI.", citationIDs: ["specialty_peds_r38a"])
        ],
        diagnosticCriteria: [
            AttributedBullet("NEONATE (0-28 days) — FULL SEPSIS WORKUP for ANY fever ≥38.0°C: CBC + blood culture + UA + urine culture (catheterized) + LP + CXR if respiratory symptoms; ADMIT for empiric antibiotics (ampicillin + gentamicin OR ampicillin + cefotaxime/ceftriaxone) pending cultures.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("INFANT 29-60 days — Step-by-Step approach OR Boston/Philadelphia/Rochester criteria; CBC + blood culture + UA + urine culture (catheterized) + procalcitonin/CRP; LP for high-risk; admit + empiric antibiotics for high-risk OR ill-appearing.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("INFANT 61-90 days — UA + urine culture mandatory; CBC + blood culture often + procalcitonin if available; selective LP; outpatient management for low-risk + well-appearing + reliable follow-up.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("CHILD 3-36 months — clinical assessment primary; UA + culture in females + uncircumcised males <2 yr (UTI risk); selective CBC/blood culture; outpatient with reliable follow-up + clear return precautions.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("CHILD >36 months — clinical assessment; targeted workup based on history + exam; treat outpatient unless concerning features.", citationIDs: ["specialty_peds_r38a"])
        ],
        priorityAssessments: [
            AttributedBullet("Age-stratified risk assessment — neonatal highest risk; vaccination status critical (Hib, pneumococcal); immunocompromised always high-risk.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Clinical appearance (toxic vs well) — best single predictor; sick child needs aggressive workup regardless of age.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("UTI as most common occult source — UA + culture mandatory in young infants + female toddlers + uncircumcised male toddlers.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Fever pattern + duration + height — high fever (>39°C) + prolonged + no source increases SBI concern.", citationIDs: ["specialty_peds_r38a"])
        ],
        commonInterventions: [
            AttributedBullet("NEONATE (0-28 days) — full septic workup + admission + empiric antibiotics; do NOT discharge regardless of appearance.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("INFANT 29-60 days — STEP-BY-STEP algorithm: ill-appearing OR age <22 days OR leukocyturia OR procalcitonin >0.5 OR CRP >20 → high-risk → admit; otherwise CRP/procalcitonin/leukocyte assessment for further stratification.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("INFANT 61-90 days — well-appearing + low-risk labs + reliable follow-up → outpatient with empiric antibiotics for UTI per UA + return precautions.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("CHILD 3-36 months well-appearing — supportive care + antipyretics + return precautions; specific workup based on history; UA in female + uncircumcised male <2 yr.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Antipyretics — acetaminophen 10-15 mg/kg PO/PR Q4-6h OR ibuprofen 5-10 mg/kg PO Q6-8h (>6 mo); not for fever suppression alone (helps comfort + monitoring).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Hydration — oral preferred; IV if dehydrated.", citationIDs: ["openrn_peds_r38a"]),
            AttributedBullet("Empiric antibiotics — neonatal full coverage (ampicillin + gentamicin/cefotaxime); older infants per institutional protocol; UTI — cephalexin or amoxicillin-clavulanate outpatient.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Return precautions — fever lasting >48-72 hr, worsening symptoms, decreased PO, decreased urine output, lethargy, rash, persistent vomiting, age <3 months recurrence, ill appearance.", citationIDs: ["openrn_peds_r38a"]),
            AttributedBullet("Follow-up — culture review at 24-48 hr; phone or visit follow-up; education on home management.", citationIDs: ["openrn_peds_r38a"])
        ],
        watchFor: [
            AttributedBullet("MISSED OCCULT BACTEREMIA — rare in vaccinated era but still occurs; serial CBC + cultures + reassessment.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("UTI complications — pyelonephritis + renal scarring + future hypertension; emphasize identification + treatment.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("MENINGITIS — rare in vaccinated era; risk increases with younger age + concerning exam (full fontanelle, neck stiffness, paradoxical irritability); LP threshold low in young infants.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("FEBRILE SEIZURE — common in 6 months-5 years; usually benign simple seizure; education + reassurance; complex requires neuro workup.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Kawasaki disease — fever ≥5 days + classic features (conjunctivitis, oral/pharyngeal changes, rash, extremity changes, lymphadenopathy); urgent diagnosis + IVIG.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("MULTISYSTEM INFLAMMATORY SYNDROME (MIS-C) — post-COVID; fever + multisystem involvement; specialty workup.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("FAMILY EDUCATION — fever is response to infection (not the infection); teach home management; clear return precautions.", citationIDs: ["openrn_peds_r38a"])
        ],
        citations: [openrnPedsR38A, cdcPedsR38A, specialtyPedsR38A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PediatricAppendicitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pediatric-appendicitis",
        title: "Pediatric appendicitis",
        subtitle: "Atypical presentation in young children · ALVARADO + PAS scoring · ultrasound first-line · CT if equivocal · perforation more common in <5 yr · time-critical",
        nclexTags: pedsGITagsR38A,
        definition: AttributedProse(
            "Appendicitis — inflammation of appendix; most common pediatric surgical emergency. Annual incidence ~7 per 10,000 in pediatric. Atypical presentation in young children + delays in diagnosis lead to higher perforation rates (30-50% in <5 yr vs 15-25% in older). Pediatric Appendicitis Score (PAS) + Alvarado score guide imaging + surgical decisions; ultrasound first-line imaging avoiding radiation per primary source.",
            citationIDs: ["specialty_peds_r38a"]
        ),
        pathophysiology: AttributedProse(
            "Luminal obstruction (fecalith, lymphoid hyperplasia, foreign body) → bacterial overgrowth + inflammation + edema → ischemia + necrosis → PERFORATION (within 24-72 hours typically) → peritonitis or contained abscess. Pediatric appendix is more posterior + retrocecal in some cases (atypical pain location).",
            citationIDs: ["specialty_peds_r38a"]
        ),
        presentation: [
            AttributedBullet("CLASSIC adult presentation in OLDER children (>5 yr) — periumbilical pain → migrates to RLQ over 12-24 hr; anorexia; nausea/vomiting; low-grade fever.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("ATYPICAL in YOUNG CHILDREN (<5 yr) — diarrhea + irritability + vague abdominal pain + fever + lethargy; often confused with gastroenteritis; perforation more common from delayed diagnosis.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Fever — usually low-grade (38-38.5°C); high fever suggests perforation/abscess.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Anorexia almost universal (95%); vomiting typically AFTER pain onset (vomiting before pain suggests gastroenteritis).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Examination — McBurney point tenderness, Rovsing sign (RLQ pain with LLQ palpation), psoas sign, obturator sign; rebound + guarding (peritoneal signs); high-pitched bowel sounds early → absent late.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Atypical pain locations — retrocecal (flank pain), pelvic (suprapubic, dysuria), high (RUQ), pregnant (RUQ); high index of suspicion needed.", citationIDs: ["specialty_peds_r38a"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ALVARADO SCORE (MANTRELS) — Migration of pain (1), Anorexia (1), Nausea/vomiting (1), Tenderness RLQ (2), Rebound (1), Elevation of temperature (1), Leukocytosis (2), Shift to left (1); 7-10 = surgery, 5-6 = observe + reimage, <4 = consider alternative.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("PEDIATRIC APPENDICITIS SCORE (PAS) — similar to Alvarado; 8-10 high probability; 4-7 indeterminate (image); 0-3 low probability.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("CBC — leukocytosis (>10,000-12,000) + left shift; not diagnostic alone (overlap with viral); WBC <10,000 has high NPV.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("CRP elevated; especially helpful with WBC.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("UA — sterile pyuria possible (appendix near ureter); rule out UTI.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("β-hCG in adolescent females — ectopic pregnancy.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("ULTRASOUND — first-line imaging in pediatrics; non-compressible appendix >6 mm + secondary signs (free fluid, fat stranding); operator-dependent + sensitivity 80-90%; if positive → surgery; if equivocal → CT or observation.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("CT — gold standard imaging (sensitivity + specificity >95%); reserved for equivocal US; consider radiation dose.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("MRI — radiation-free alternative when available; pregnant patients + selected pediatric.", citationIDs: ["specialty_peds_r38a"])
        ],
        priorityAssessments: [
            AttributedBullet("Time-to-diagnosis — perforation risk increases with each hour delay; serial exams essential.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Hemodynamic status — sepsis/peritonitis = aggressive resuscitation.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Age-specific risk — <5 yr highest perforation risk + atypical presentation.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Pre-op preparation — type/screen, NPO, IV access, antibiotics.", citationIDs: ["specialty_peds_r38a"])
        ],
        commonInterventions: [
            AttributedBullet("PEDIATRIC SURGERY consultation; LAPAROSCOPIC appendectomy is gold standard; open if perforation/abscess.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("PRE-OP — NPO, IV fluids (20 mL/kg NS bolus → maintenance), pain management (IV opioids — fentanyl 1-2 mcg/kg or morphine 0.1 mg/kg), broad-spectrum IV antibiotics (ceftriaxone + metronidazole OR pip-tazo) BEFORE incision.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("PERFORATED appendix — IV antibiotics + drainage of abscess (interventional radiology) + delayed appendectomy 6-8 weeks (\"interval appendectomy\"); OR immediate surgery + drainage in selected.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("POST-OP uncomplicated — clear liquids → regular diet as tolerated, ambulate early, discharge POD 1-2; oral antibiotics 3-7 days.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("POST-OP complicated/perforated — IV antibiotics 5-7 days minimum, NG decompression if ileus, gradual diet advancement, longer hospitalization.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Pain management post-op — multimodal (acetaminophen + ibuprofen + opioid PRN); minimize opioid use.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("Family education — wound care, diet advancement, activity restrictions (no contact sports 4-6 weeks), follow-up.", citationIDs: ["openrn_peds_r38a"])
        ],
        watchFor: [
            AttributedBullet("PERFORATION + PERITONITIS — generalized peritoneal signs + fever + leukocytosis + sepsis; emergent surgery.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("ABSCESS — contained perforation; CT confirms; IR drainage + antibiotics + interval appendectomy.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("SEPSIS — fluid resuscitation + broad antibiotics + ICU; complications from delayed diagnosis.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("POST-OP COMPLICATIONS — wound infection (5-15%), intra-abdominal abscess (esp. perforated), small bowel obstruction (adhesive, late), pneumonia (atelectasis).", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("MISDIAGNOSIS — gastroenteritis, mesenteric adenitis, intussusception, pyelonephritis, ovarian pathology; serial exams + repeat imaging if persistent symptoms.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("FUTURE FERTILITY (females) — perforated appendix + tubo-ovarian abscess can affect fertility; counsel young female patients.", citationIDs: ["specialty_peds_r38a"]),
            AttributedBullet("DIFFERENTIAL — gastroenteritis (most common mimic), mesenteric adenitis, intussusception, Meckel diverticulum, pyelonephritis, ovarian torsion, ectopic pregnancy, IBD, constipation.", citationIDs: ["specialty_peds_r38a"])
        ],
        citations: [openrnPedsR38A, cdcPedsR38A, specialtyPedsR38A],
        lastSourceFidelityReview: "2026-05-13"
    )
}
