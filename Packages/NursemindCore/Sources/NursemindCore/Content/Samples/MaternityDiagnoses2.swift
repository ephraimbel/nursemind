import Foundation

// Curator-model maternity diagnosis entries (batch 2) — audited gaps in the
// existing MaternityDiagnoses set: pregnancy-associated venous thromboembolism
// (a leading cause of maternal death, with pregnancy-specific assessment and
// anticoagulation rules) and amniotic fluid volume disorders. No patient-
// specific dose math per Apple 1.4.2. Sources: Open RN + OpenStax Maternal-
// Newborn (CC BY 4.0), CDC public domain, ACOG concept citations.

private let openrnMat2 = CitationSource(
    id: "openrn_matnew2",
    shortName: "Open RN Maternal-Newborn Nursing",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/maternal/",
    lastRetrieved: "2026-07-03"
)
private let openstaxMat2 = CitationSource(
    id: "openstax_matnew2",
    shortName: "OpenStax Maternal-Newborn Nursing",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/maternal-newborn-nursing",
    lastRetrieved: "2026-07-03"
)
private let cdcRepro2 = CitationSource(
    id: "cdc_repro2",
    shortName: "CDC Reproductive Health and Pregnancy guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/reproductivehealth/",
    lastRetrieved: "2026-07-03"
)
private let acogConcept2 = CitationSource(
    id: "acog_concept2",
    shortName: "ACOG Practice Bulletins (concept citation only — text not reproduced)",
    publisher: "American College of Obstetricians and Gynecologists",
    license: .factCitationOnly,
    url: "https://www.acog.org/clinical/clinical-guidance",
    lastRetrieved: "2026-07-03"
)

private let obPerfusionTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let obAdaptationTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .safety)

// MARK: - Venous thromboembolism in pregnancy

public enum PregnancyVTEDiagnosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pregnancy-vte",
        title: "Venous thromboembolism in pregnancy (DVT / PE)",
        subtitle: "Pregnancy is a hypercoagulable state · a leading cause of maternal death",
        nclexTags: obPerfusionTags,
        definition: AttributedProse(
            "Deep vein thrombosis and pulmonary embolism are among the leading causes of maternal death in high-resource settings. Pregnancy and the postpartum period substantially increase thromboembolic risk, and the presentation is easy to dismiss because breathlessness and leg swelling are common in normal pregnancy.",
            citationIDs: ["openrn_matnew2", "acog_concept2"]
        ),
        pathophysiology: AttributedProse(
            "Pregnancy fulfills all three arms of Virchow's triad: hypercoagulability (rising clotting factors and falling anticoagulant activity, a physiologic preparation for delivery), venous stasis (the gravid uterus compressing pelvic veins, with a left-sided predominance of DVT), and endothelial injury (greatest around delivery). Risk is highest in the postpartum weeks, not just during pregnancy — a point that shapes prophylaxis and teaching.",
            citationIDs: ["openrn_matnew2"]
        ),
        presentation: [
            AttributedBullet("DVT: unilateral leg pain, swelling, warmth, and tenderness — most commonly the left leg in pregnancy; asymmetry is the key clue against normal bilateral edema.", citationIDs: ["openrn_matnew2"]),
            AttributedBullet("PE: sudden dyspnea, pleuritic chest pain, tachycardia, tachypnea, hypoxia, and sometimes a sense of impending doom — the same pattern that must never be filed under 'anxiety.'", citationIDs: ["openrn_matnew2"]),
            AttributedBullet("Additional risk factors layered on pregnancy: prior VTE, thrombophilia, cesarean birth, obesity, prolonged immobility, preeclampsia, hemorrhage, and infection.", citationIDs: ["acog_concept2"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Imaging drives the diagnosis: compression ultrasound for suspected DVT; ventilation-perfusion scanning or CT pulmonary angiography for suspected PE, chosen with attention to fetal/maternal radiation but never withheld when PE is a real concern.", citationIDs: ["acog_concept2"]),
            AttributedBullet("D-dimer rises physiologically in pregnancy, so standard thresholds are unreliable — imaging, not the lab, settles the question.", citationIDs: ["openrn_matnew2"])
        ],
        priorityAssessments: [
            AttributedBullet("For suspected PE: full vital signs including SpO₂ and respiratory rate, work of breathing, and continuous monitoring — treat the cluster (dyspnea + tachycardia + hypoxia) as an emergency.", citationIDs: ["openrn_matnew2"]),
            AttributedBullet("For suspected DVT: compare limbs for asymmetry in circumference, warmth, and tenderness; do not massage the leg.", citationIDs: ["openrn_matnew2"]),
            AttributedBullet("Ongoing bleeding surveillance once anticoagulated — especially around the peridelivery window when the balance between clot and hemorrhage is most delicate.", citationIDs: ["openrn_matnew2"])
        ],
        commonInterventions: [
            AttributedBullet("Anticoagulation in pregnancy uses heparins (low-molecular-weight or unfractionated), which do not cross the placenta; warfarin and direct oral anticoagulants are generally avoided in pregnancy for fetal safety.", citationIDs: ["acog_concept2", "openrn_matnew2"]),
            AttributedBullet("Timing around delivery is a coordinated plan: anticoagulation is managed to reduce bleeding at birth and around neuraxial anesthesia, then resumed postpartum per protocol — the nurse follows the explicit hold/resume orders closely.", citationIDs: ["acog_concept2"]),
            AttributedBullet("For confirmed PE: oxygen, positioning, hemodynamic support, and escalation per protocol; massive PE is managed by the critical-care/OB team.", citationIDs: ["openrn_matnew2"]),
            AttributedBullet("Prevention is the larger story: risk assessment on admission, early mobilization, mechanical prophylaxis (sequential compression) actually in use, and pharmacologic prophylaxis for higher-risk patients — cesarean and the postpartum period are key targets.", citationIDs: ["acog_concept2"]),
            AttributedBullet("Patient teaching: injection technique for home anticoagulation, bleeding precautions, the signs of DVT/PE to report immediately, and that risk continues for weeks after birth.", citationIDs: ["openrn_matnew2"])
        ],
        watchFor: [
            AttributedBullet("PE presenting as 'anxiety' or 'normal pregnancy breathlessness' — anchoring on a benign explanation is the classic fatal error.", citationIDs: ["openrn_matnew2"]),
            AttributedBullet("Bleeding from anticoagulation, particularly around delivery; and the anesthesia timing rules for neuraxial procedures.", citationIDs: ["acog_concept2"]),
            AttributedBullet("The postpartum window — the highest-risk period, when a discharged patient must know exactly what to watch for.", citationIDs: ["openrn_matnew2"]),
            AttributedBullet("Signs of massive PE: severe hypoxia, hypotension, and hemodynamic collapse — a maternal code emergency.", citationIDs: ["openrn_matnew2"])
        ],
        citations: [openrnMat2, openstaxMat2, acogConcept2],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Amniotic fluid volume disorders

public enum AmnioticFluidDisordersDiagnosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "amniotic-fluid-disorders",
        title: "Amniotic fluid disorders (oligohydramnios & polyhydramnios)",
        subtitle: "Too little or too much fluid · a window onto fetal kidneys, swallowing, and the placenta",
        nclexTags: obAdaptationTags,
        definition: AttributedProse(
            "Amniotic fluid volume reflects a balance largely maintained by fetal urine production and fetal swallowing. Too little fluid (oligohydramnios) and too much fluid (polyhydramnios) are each markers that something in that system — fetal, placental, or maternal — may be off, and each carries its own risks to pregnancy and birth.",
            citationIDs: ["openrn_matnew2", "acog_concept2"]
        ),
        pathophysiology: AttributedProse(
            "By mid-to-late pregnancy, fetal urine is the dominant source of amniotic fluid and fetal swallowing the dominant route of removal. Oligohydramnios points toward reduced production or a leak: uteroplacental insufficiency, fetal renal or urinary-tract anomalies, or ruptured membranes. Polyhydramnios points toward reduced fetal swallowing or increased production: conditions that impair swallowing (neurologic or GI obstruction such as esophageal atresia), maternal diabetes, fetal anemia, or multiple gestation. The volume is a symptom; the work is finding its cause.",
            citationIDs: ["openrn_matnew2"]
        ),
        presentation: [
            AttributedBullet("Both are usually found on ultrasound rather than by symptoms — assessed by amniotic fluid index or deepest vertical pocket.", citationIDs: ["acog_concept2"]),
            AttributedBullet("Oligohydramnios clues: a uterus measuring small for dates, reduced fetal movement, or a suspicion of ruptured membranes.", citationIDs: ["openrn_matnew2"]),
            AttributedBullet("Polyhydramnios clues: a uterus measuring large for dates, maternal abdominal discomfort or shortness of breath from over-distension, and difficulty palpating fetal parts or hearing heart tones.", citationIDs: ["openrn_matnew2"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Ultrasound quantification of fluid, plus a search for the cause: fetal anatomy survey, assessment for ruptured membranes, maternal glucose evaluation, and growth/placental assessment as indicated.", citationIDs: ["acog_concept2"]),
            AttributedBullet("The finding redirects care toward surveillance and cause-specific management rather than being a diagnosis unto itself.", citationIDs: ["openrn_matnew2"])
        ],
        priorityAssessments: [
            AttributedBullet("Fetal surveillance per plan — movement counts and antenatal testing; oligohydramnios in particular is associated with cord compression and non-reassuring fetal status.", citationIDs: ["openrn_matnew2"]),
            AttributedBullet("For oligohydramnios: evaluate for ruptured membranes and monitor for variable decelerations in labor (cord compression with less fluid cushion).", citationIDs: ["openrn_matnew2"]),
            AttributedBullet("For polyhydramnios: maternal respiratory comfort and uterine over-distension; assess for the associated risks below.", citationIDs: ["openrn_matnew2"])
        ],
        commonInterventions: [
            AttributedBullet("Management is cause-directed: control maternal diabetes for polyhydramnios, address ruptured membranes for oligohydramnios, and coordinate maternal-fetal medicine for fetal anomalies.", citationIDs: ["acog_concept2"]),
            AttributedBullet("Intensified antenatal fetal surveillance and a delivery-timing plan individualized to the cause and severity.", citationIDs: ["acog_concept2"]),
            AttributedBullet("In labor with oligohydramnios, anticipate closer fetal monitoring; amnioinfusion may be used per protocol for repetitive variable decelerations.", citationIDs: ["openrn_matnew2"]),
            AttributedBullet("Prepare for the birth-related risks each carries and teach the patient the plan and warning signs (leaking fluid, decreased fetal movement, contractions).", citationIDs: ["openrn_matnew2"])
        ],
        watchFor: [
            AttributedBullet("Polyhydramnios peripartum risks: preterm labor from over-distension, cord prolapse and abruption at membrane rupture (sudden decompression), malpresentation, and postpartum hemorrhage from an over-stretched uterus that doesn't contract well.", citationIDs: ["openrn_matnew2"]),
            AttributedBullet("Oligohydramnios risks: cord compression and non-reassuring fetal heart tracing, and — when early and severe — pulmonary and musculoskeletal consequences of restricted fetal space.", citationIDs: ["openrn_matnew2"]),
            AttributedBullet("The finding as a signal — new or worsening fluid abnormality warrants re-evaluation for an evolving fetal, placental, or maternal cause.", citationIDs: ["acog_concept2"]),
            AttributedBullet("At delivery with polyhydramnios: have hemorrhage measures ready, because uterine atony is more likely.", citationIDs: ["openrn_matnew2"])
        ],
        citations: [openrnMat2, openstaxMat2, acogConcept2],
        lastSourceFidelityReview: "2026-07-03"
    )
}
