import Foundation

// Curated NICU reference entries — Open RN Maternity Nursing (CC BY 4.0),
// CDC public-domain, and original-concept citations for legacy clinical scores.
// Tier-A RN review pending pre-launch for high-risk content (sepsis recognition,
// phototherapy thresholds, neonatal resuscitation).

private let openrnMaternityNICU = CitationSource(
    id: "openrn_maternity_nicu",
    shortName: "Open RN Maternity Nursing — Neonatal chapter",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingmaternal/?s=neonatal+newborn+sepsis",
    lastRetrieved: "2026-05-04"
)

private let cdcNeonatal = CitationSource(
    id: "cdc_neonatal",
    shortName: "CDC — Newborn Care & Safety",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/ncbddd/childdevelopment/positiveparenting/infants.html",
    lastRetrieved: "2026-05-04"
)

private let apgar1953 = CitationSource(
    id: "apgar_1953",
    shortName: "Apgar V. — Original 1953 scoring system (concept citation)",
    detail: "Anesth Analg 1953;32:260-7. Universally adopted clinical scoring tool.",
    publisher: "Anesthesia & Analgesia",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/13083014/",
    lastRetrieved: "2026-05-04"
)

// MARK: - Neonatal Vital Signs

public enum NeonatalVitalSignsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "neonatal-vital-signs",
        title: "Neonatal vital signs",
        subtitle: "Term and preterm normal ranges by day of life",
        eyebrow: "REFERENCE · NICU",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .prose(title: "Why neonatal ranges differ", AttributedProse("Neonates have proportionally higher metabolic rates and surface area, immature thermoregulation, and ductal-dependent circulation in the first hours of life. PALS thresholds do not apply. Always interpret vitals against the neonate's gestational age and day of life — not adult or older-peds norms.", citationIDs: ["openrn_maternity_nicu"])),
            .keyValueTable(title: "Heart rate (resting, beats/min)", [
                KeyValueRow(key: "Term newborn (awake)", value: "100–160"),
                KeyValueRow(key: "Term newborn (sleeping)", value: "Can dip to 80–90 briefly"),
                KeyValueRow(key: "Term newborn (crying)", value: "Up to 180–200"),
                KeyValueRow(key: "Preterm <32 weeks", value: "120–170 (higher baseline)"),
                KeyValueRow(key: "Tachycardia threshold", value: "Sustained >180–200 — investigate (pain, fever, sepsis, dehydration, anemia)"),
                KeyValueRow(key: "Bradycardia threshold", value: "Sustained <100 in awake newborn — concerning")
            ]),
            .keyValueTable(title: "Respiratory rate (breaths/min)", [
                KeyValueRow(key: "Term newborn", value: "30–60"),
                KeyValueRow(key: "Preterm <32 weeks", value: "40–70"),
                KeyValueRow(key: "Periodic breathing (preterm)", value: "Pauses ≤20 seconds without color change — normal variant"),
                KeyValueRow(key: "Apnea (true)", value: "Pause >20 sec OR shorter pause with bradycardia / cyanosis / desaturation — workup needed")
            ]),
            .keyValueTable(title: "Blood pressure (mmHg)", [
                KeyValueRow(key: "Term newborn — first 12 hr", value: "Systolic 60–80, diastolic 30–50"),
                KeyValueRow(key: "Term newborn — DOL 1–7", value: "Systolic 67–84"),
                KeyValueRow(key: "Mean arterial pressure rule", value: "Approx MAP should be ≥ gestational age in weeks (e.g., 28-week premie should have MAP ≥28)"),
                KeyValueRow(key: "BP cuff size", value: "Cuff bladder should cover 40% of arm circumference, length covers 80–100%")
            ]),
            .keyValueTable(title: "Temperature", [
                KeyValueRow(key: "Term axillary normal", value: "36.5–37.5°C (97.7–99.5°F)"),
                KeyValueRow(key: "Hypothermia", value: "<36.5°C — risk of hypoglycemia, increased oxygen consumption, acidosis"),
                KeyValueRow(key: "Cold stress signs", value: "Acrocyanosis, tachypnea, mottling, weak cry, poor feeding"),
                KeyValueRow(key: "Fever in <90 days", value: "≥38°C / 100.4°F — full sepsis workup, regardless of how well the infant looks")
            ]),
            .bullets(title: "Watch-fors specific to neonates", [
                AttributedBullet("Subtle signs of decompensation: poor feeding, hypoglycemia, color change, decreased tone, tachypnea — neonates often won't fever or tachycardia like older patients.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Pre-ductal vs post-ductal SpO2: pre-ductal (right hand) > post-ductal (foot) by ≥3% suggests right-to-left ductal shunting (PPHN, ductal-dependent CHD).", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Capillary refill >3 seconds in a warm neonate is concerning for poor perfusion.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Always consider sepsis when vitals shift — neonatal immune response is blunted; signs are subtle.", citationIDs: ["openrn_maternity_nicu"])
            ])
        ],
        citations: [openrnMaternityNICU],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Apgar Scoring

public enum ApgarScoreSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "apgar-score",
        title: "Apgar score",
        subtitle: "Standardized newborn assessment at 1 and 5 minutes",
        eyebrow: "REFERENCE · NICU",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .prose(title: "Purpose", AttributedProse("The Apgar score is a quick standardized assessment of the newborn's transition to extrauterine life. Done at 1 minute and 5 minutes after birth (and every 5 min until ≥7 if score is low). It does NOT predict long-term outcome and is NOT used alone to decide resuscitation — resuscitation decisions follow NRP based on respirations, heart rate, and tone.", citationIDs: ["apgar_1953", "openrn_maternity_nicu"])),
            .keyValueTable(title: "Five components — 0, 1, or 2 each", [
                KeyValueRow(key: "A — Appearance (color)", value: "0 = blue/pale · 1 = pink body, blue extremities (acrocyanosis) · 2 = completely pink"),
                KeyValueRow(key: "P — Pulse (heart rate)", value: "0 = absent · 1 = <100 · 2 = ≥100"),
                KeyValueRow(key: "G — Grimace (reflex irritability)", value: "0 = no response · 1 = grimace · 2 = cry, cough, sneeze on stimulation"),
                KeyValueRow(key: "A — Activity (muscle tone)", value: "0 = limp · 1 = some flexion · 2 = active motion, well-flexed"),
                KeyValueRow(key: "R — Respiration", value: "0 = absent · 1 = slow, irregular, weak cry · 2 = strong cry, regular breathing")
            ]),
            .keyValueTable(title: "Score interpretation", [
                KeyValueRow(key: "7–10", value: "Normal — routine post-delivery care"),
                KeyValueRow(key: "4–6", value: "Moderately depressed — may need stimulation, supplemental oxygen, possible PPV"),
                KeyValueRow(key: "0–3", value: "Severely depressed — neonatal resuscitation per NRP; emergent")
            ]),
            .bullets(title: "Documentation", [
                AttributedBullet("Document each component score, not just the total — \"1 min Apgar 7 (color 1, pulse 2, grimace 2, activity 1, resp 1)\".", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Continue 5-min Apgar even if 1-min was 9–10 (it's standard).", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("If 5-min score <7, reassess every 5 min until ≥7 or until 20 min.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Acrocyanosis (blue hands/feet, pink trunk) is normal in the first 24 hr — that's a 1 for color, not 0.", citationIDs: ["openrn_maternity_nicu"])
            ]),
            .prose(title: "What Apgar is NOT", AttributedProse("Apgar does not diagnose perinatal asphyxia. It does not predict long-term neurodevelopmental outcome. It does not replace the NRP algorithm — resuscitation begins based on initial assessment (term? tone? breathing or crying?), not the Apgar number.", citationIDs: ["openrn_maternity_nicu"]))
        ],
        citations: [apgar1953, openrnMaternityNICU],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Neonatal Jaundice / Phototherapy

public enum NeonatalJaundiceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "neonatal-jaundice",
        title: "Neonatal jaundice and phototherapy",
        subtitle: "Physiologic vs pathologic; nursing care during phototherapy",
        eyebrow: "REFERENCE · NICU",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .prose(title: "Physiologic vs pathologic", AttributedProse("Most term newborns have visible jaundice by day 2–3 from increased RBC turnover plus immature liver UDP-glucuronosyltransferase. This peaks around day 3–5 and resolves by 1–2 weeks. Pathologic jaundice appears in the first 24 hours, rises rapidly (>0.2 mg/dL/hr or >5 mg/dL/day), or persists >2 weeks term / >3 weeks preterm.", citationIDs: ["openrn_maternity_nicu"])),
            .bullets(title: "Red flags — pathologic causes to investigate", [
                AttributedBullet("Jaundice in the first 24 hours of life — almost always pathologic (hemolysis, infection).", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("ABO or Rh incompatibility (mom O+, baby A or B; or mom Rh-negative, baby Rh-positive without RhoGAM).", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("G6PD deficiency (hemolytic).", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Sepsis, urinary tract infection.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Dehydration / inadequate feeding (especially exclusively breastfed; \"breastfeeding jaundice\" from underfeeding, not breast milk itself).", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Cephalohematoma (delayed bilirubin rise as collected blood breaks down).", citationIDs: ["openrn_maternity_nicu"])
            ]),
            .keyValueTable(title: "Bilirubin values to know", [
                KeyValueRow(key: "Total serum bilirubin (TSB) on nomogram", value: "Plotted by hours of life. Use AAP / Bhutani nomogram — facility-specific phototherapy thresholds."),
                KeyValueRow(key: "Conjugated (direct) bilirubin", value: ">1 mg/dL OR >20% of total — concerning for cholestasis, biliary obstruction, sepsis"),
                KeyValueRow(key: "Acute bilirubin encephalopathy threshold", value: "TSB approaching exchange-transfusion levels — neuro emergency"),
                KeyValueRow(key: "Kernicterus", value: "Permanent neurologic damage — chronic phase of bilirubin encephalopathy")
            ]),
            .bullets(title: "Phototherapy nursing care", [
                AttributedBullet("Eye protection: opaque eye shields covering eyes only — check every shift for displacement, pressure points, conjunctival drainage.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Maximize skin exposure: diaper only, frequent position changes (supine ↔ prone if appropriate), keep covers minimal.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Temperature: monitor for hyperthermia from light source; for preterm, watch for hypothermia from increased exposure.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Hydration: insensible water loss increases ~20%. Encourage frequent feeds (8–12/day breastfed). Monitor urine output, stool color, weight.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Skin: bronze-baby syndrome (gray-brown skin) is a benign side effect of phototherapy in conjugated hyperbilirubinemia.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Feeding: do NOT supplement with water — increases bilirubin enterohepatic circulation. Continue breastfeeding or formula.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("TSB monitoring: every 6–24 hr per protocol while on phototherapy until below threshold for ≥6 hr.", citationIDs: ["openrn_maternity_nicu"])
            ]),
            .bullets(title: "When to escalate beyond phototherapy", [
                AttributedBullet("Rapid TSB rise despite intensive phototherapy.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Signs of acute bilirubin encephalopathy: lethargy, poor feeding, hypertonia/hypotonia, high-pitched cry, retrocollis/opisthotonos.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Approaching exchange-transfusion threshold per nomogram.", citationIDs: ["openrn_maternity_nicu"])
            ])
        ],
        citations: [openrnMaternityNICU],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Neonatal Sepsis

public enum NeonatalSepsisSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "neonatal-sepsis",
        title: "Neonatal sepsis",
        subtitle: "Subtle presentation, high-stakes recognition",
        eyebrow: "REFERENCE · NICU",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        sections: [
            .prose(title: "Why neonates fool you", AttributedProse("Neonates can be septic without fever, without leukocytosis, and without hypotension. Their immune systems are immature and their compensatory mechanisms are blunted. Subtle changes — feeding poorly, more sleepy, color shift, temperature instability — are often the first sign. By the time the vitals look textbook-septic, the neonate is critical.", citationIDs: ["openrn_maternity_nicu"])),
            .keyValueTable(title: "Early- vs late-onset sepsis", [
                KeyValueRow(key: "Early-onset (≤72 hr after birth)", value: "Vertical transmission. Most common: Group B Strep (GBS), E. coli."),
                KeyValueRow(key: "Late-onset (>72 hr to 28 days)", value: "Postnatal acquisition (lines, equipment, environment). Most common: coag-negative Staph, GBS, S. aureus, E. coli, Listeria."),
                KeyValueRow(key: "Risk factors — early onset", value: "Maternal GBS+ without adequate IAP, prolonged ROM (>18 hr), maternal chorioamnionitis, preterm <37 weeks, intrapartum fever."),
                KeyValueRow(key: "Risk factors — late onset", value: "Prematurity, central lines, mechanical ventilation, prolonged hospitalization, NEC.")
            ]),
            .bullets(title: "Subtle signs (often the only sign)", [
                AttributedBullet("Poor feeding or feeding intolerance.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Lethargy, irritability, decreased tone, decreased activity.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Temperature instability (low or high — hypothermia is more common than fever in preterms).", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Color: pallor, mottling, cyanosis, jaundice (especially conjugated).", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Apnea, tachypnea, grunting, retractions, oxygen desaturation.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Hypoglycemia or hyperglycemia in a neonate without other explanation.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Hypotension, poor perfusion, cap refill >3 sec.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Vomiting, abdominal distention, ileus.", citationIDs: ["openrn_maternity_nicu"])
            ]),
            .numberedSteps(title: "Sepsis workup (per facility protocol)", [
                "Notify provider for any infant with concerning vitals or behavior — even subtle.",
                "Blood culture (aerobic + sometimes anaerobic) — 1 mL minimum.",
                "CBC with differential — neutropenia or left shift (I:T ratio >0.2) suggests infection.",
                "CRP at presentation and ~24 hr (single value has poor sensitivity).",
                "Urine culture in late-onset (catheter or suprapubic specimen).",
                "Lumbar puncture per protocol — rule out meningitis (especially if positive blood culture or persistent symptoms).",
                "Consider chest X-ray if respiratory symptoms.",
                "Start empiric antibiotics within 1 hour of suspicion (typically ampicillin + gentamicin for early-onset; vancomycin + gentamicin or aminoglycoside for late-onset)."
            ], citationIDs: ["openrn_maternity_nicu"]),
            .bullets(title: "Nursing priorities during workup", [
                AttributedBullet("Maintain neutral thermal environment — minimize cold stress while drawing labs and doing exam.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Cluster care to allow rest periods.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Monitor glucose — sepsis predisposes to hypoglycemia.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Strict I&O, daily weights.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Continuous cardiopulmonary monitoring; have resuscitation equipment at bedside.", citationIDs: ["openrn_maternity_nicu"]),
                AttributedBullet("Family support — reinforce that workup is precautionary; explain timing of culture results.", citationIDs: ["openrn_maternity_nicu"])
            ])
        ],
        citations: [openrnMaternityNICU, cdcNeonatal],
        lastSourceFidelityReview: "2026-05-04"
    )
}
