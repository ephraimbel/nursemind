import Foundation

// Mechanical circulatory support (IABP, percutaneous VAD) — SCAI/ACC/HFSA/STS
// 2015 expert consensus cited as concept citation; general critical-care
// monitoring from Open RN (CC BY 4.0). Tier-A RN review pending pre-launch.

private let scaiMCSConsensus = CitationSource(
    id: "mcs_scai_consensus_2015",
    shortName: "SCAI/ACC/HFSA/STS Clinical Expert Consensus on Percutaneous MCS — Rihal et al, 2015 (concept citation)",
    detail: "Clinical expert consensus statement on the use of percutaneous mechanical circulatory support devices in cardiovascular care",
    publisher: "Journal of the American College of Cardiology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/25861963/",
    lastRetrieved: "2026-07-02"
)

private let iabpPhysiology = CitationSource(
    id: "mcs_iabp_physiology",
    shortName: "Intra-aortic balloon counterpulsation physiology (concept citation)",
    detail: "Counterpulsation augments diastolic coronary perfusion and reduces afterload; established device physiology",
    publisher: "American Heart Association",
    license: .factCitationOnly,
    url: "https://www.ahajournals.org/",
    lastRetrieved: "2026-07-02"
)

private let openrnCritCareMCS = CitationSource(
    id: "mcs_openrn_critcare",
    shortName: "Open RN — Health Alterations: Critical Care chapters",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-07-02"
)

// MARK: - IABP

public enum IABPSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "iabp-care",
        title: "Intra-aortic balloon pump (IABP)",
        subtitle: "Counterpulsation, timing, nursing surveillance",
        eyebrow: "REFERENCE · ICU",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .prose(title: "What the balloon does", AttributedProse("An IABP is a helium-filled balloon in the descending thoracic aorta, its tip sitting just distal to the left subclavian artery. It works by counterpulsation: the balloon inflates in diastole, displacing blood toward the coronary arteries and augmenting coronary perfusion pressure, then deflates just before systole, dropping aortic pressure so the left ventricle ejects against less resistance. The net effect described in the percutaneous MCS consensus is modestly increased cardiac output, improved coronary flow, and reduced myocardial oxygen demand — support for cardiogenic shock, refractory ischemia, and bridging to definitive therapy.", citationIDs: ["mcs_iabp_physiology", "mcs_scai_consensus_2015"])),
            .keyValueTable(title: "Console and waveform concepts", [
                KeyValueRow(key: "Trigger", value: "The signal timing inflation and deflation — usually the ECG (R wave) or the arterial pressure waveform. Reliable trigger = reliable timing."),
                KeyValueRow(key: "Assist ratio", value: "How many beats are assisted — 1:1 (every beat), 1:2, 1:3. Weaning typically walks the ratio down per provider order."),
                KeyValueRow(key: "Diastolic augmentation", value: "On an assisted beat, the augmented diastolic peak should generally exceed the unassisted systolic peak — the visual signature of effective counterpulsation."),
                KeyValueRow(key: "Assisted end-diastolic pressure", value: "Deflation should pull the end-diastolic pressure below the patient's own — that pressure drop is the afterload reduction."),
                KeyValueRow(key: "Timing errors (concepts)", value: "Early inflation encroaches on systole; late inflation wastes augmentation; early deflation loses the afterload benefit; late deflation makes the ventricle eject against an inflated balloon — the most harmful error. Recognized on the waveform and escalated."),
                KeyValueRow(key: "Balloon fill / helium alarms", value: "Loss of augmentation, a leak alarm, or blood in the tubing prompt immediate escalation — the pump should not sit idle, because a motionless balloon promotes thrombus.")
            ]),
            .bullets(title: "Nursing monitoring", [
                AttributedBullet("Limb perfusion on the cannulated leg every hour: pedal pulses (Doppler if needed), color, temperature, sensation, capillary refill — compared against the other leg.", citationIDs: ["mcs_scai_consensus_2015", "mcs_openrn_critcare"]),
                AttributedBullet("Insertion site each hour for bleeding, hematoma, and catheter migration against the documented external marking.", citationIDs: ["mcs_openrn_critcare"]),
                AttributedBullet("Waveform review each hour: augmentation present, timing appropriate, assist ratio as ordered. Timing errors are identified conceptually and escalated to the provider or perfusion team.", citationIDs: ["mcs_iabp_physiology"]),
                AttributedBullet("Head of bed kept low (commonly no higher than about 30°) and no hip flexion on the insertion side — flexing the femoral site can kink or migrate the catheter. Logroll for repositioning.", citationIDs: ["mcs_openrn_critcare"]),
                AttributedBullet("Left radial pulse and urine output every hour — proximal migration can occlude the left subclavian (lost or dampened left radial pulse); distal migration can occlude the renal arteries (falling urine output).", citationIDs: ["mcs_openrn_critcare"]),
                AttributedBullet("Anticoagulation labs and platelet trends per protocol; balloon pumps are associated with thrombocytopenia.", citationIDs: ["mcs_scai_consensus_2015"])
            ]),
            .bullets(title: "Complications to watch for", [
                AttributedBullet("Limb ischemia — the most common vascular complication: cool, pale, pulseless, painful leg distal to the insertion site. Escalate immediately.", citationIDs: ["mcs_scai_consensus_2015"]),
                AttributedBullet("Bleeding at the insertion site or retroperitoneally — watch for back/flank pain with falling hemoglobin and hypotension.", citationIDs: ["mcs_scai_consensus_2015", "mcs_openrn_critcare"]),
                AttributedBullet("Balloon rupture — blood or rust-colored flecks in the helium tubing, loss of augmentation, leak alarms. The pump is stopped and the team notified emergently; a ruptured balloon can entrap.", citationIDs: ["mcs_openrn_critcare"]),
                AttributedBullet("Catheter migration — loss of the left radial pulse (proximal) or an abrupt drop in urine output (distal) are the classic bedside flags.", citationIDs: ["mcs_openrn_critcare"]),
                AttributedBullet("Thrombocytopenia and hemolysis from mechanical trauma to platelets and red cells.", citationIDs: ["mcs_scai_consensus_2015"]),
                AttributedBullet("Infection at the insertion site — a large indwelling arterial device; sterile dressing care and daily site assessment apply.", citationIDs: ["mcs_openrn_critcare"])
            ])
        ],
        citations: [iabpPhysiology, scaiMCSConsensus, openrnCritCareMCS],
        lastSourceFidelityReview: "2026-07-02"
    )
}

// MARK: - Percutaneous VAD (Impella)

public enum PercutaneousVADSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "percutaneous-vad-impella",
        title: "Percutaneous ventricular assist devices (Impella)",
        subtitle: "Axial-flow support, purge system, hemolysis surveillance",
        eyebrow: "REFERENCE · ICU",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .prose(title: "What the device does", AttributedProse("An Impella is a catheter-mounted axial-flow pump placed retrograde across the aortic valve, its inlet in the left ventricle and its outlet in the ascending aorta. A miniature impeller continuously pulls blood out of the ventricle and ejects it into the aorta — actively unloading the ventricle rather than merely assisting it, which is why the percutaneous MCS consensus describes greater hemodynamic support than balloon counterpulsation. Flow is continuous, not pulsatile, so the arterial waveform flattens as the device carries more of the output.", citationIDs: ["mcs_scai_consensus_2015"])),
            .keyValueTable(title: "Concepts the console makes visible", [
                KeyValueRow(key: "Purge system", value: "A continuous dextrose-based purge fluid (often heparinized per institutional protocol) flows through the motor housing to keep blood out of the motor. Purge pressure and flow are monitored continuously; purge alarms are never silenced and ignored."),
                KeyValueRow(key: "Performance level (P-level)", value: "Sets impeller speed and therefore flow. Changes are provider- or perfusionist-directed, not a bedside nursing adjustment."),
                KeyValueRow(key: "Placement signal / waveform", value: "The console infers catheter position from its pressure signals. Position alarms suggest the inlet or outlet has drifted to the wrong side of the aortic valve."),
                KeyValueRow(key: "Positioning dependence", value: "Support depends entirely on correct position across the valve. Migration — with patient movement, transport, or coughing — degrades flow, triggers suction or position alarms, and can worsen hemolysis; echocardiography confirms position.")
            ]),
            .bullets(title: "Nursing monitoring", [
                AttributedBullet("MAP is the primary perfusion number — with continuous flow, a narrow pulse pressure and a dampened waveform are expected, and NIBP cuffs may struggle; an arterial line is standard.", citationIDs: ["mcs_scai_consensus_2015", "mcs_openrn_critcare"]),
                AttributedBullet("Hemolysis surveillance: plasma-free hemoglobin and LDH trends per protocol, haptoglobin, and urine color — tea- or cola-colored urine at the bedside is reported promptly. Rising hemolysis markers can indicate device malposition.", citationIDs: ["mcs_scai_consensus_2015"]),
                AttributedBullet("Purge alarms are escalated immediately — interruption of purge flow risks blood entering the motor and pump failure.", citationIDs: ["mcs_scai_consensus_2015"]),
                AttributedBullet("Limb perfusion distal to the femoral insertion site every hour: pulses, color, temperature, capillary refill.", citationIDs: ["mcs_scai_consensus_2015", "mcs_openrn_critcare"]),
                AttributedBullet("Insertion site each hour for bleeding and hematoma; the access sheath is large-bore arterial access.", citationIDs: ["mcs_openrn_critcare"]),
                AttributedBullet("Straight leg on the insertion side with limited head-of-bed elevation per unit protocol; logroll repositioning to protect device position.", citationIDs: ["mcs_openrn_critcare"]),
                AttributedBullet("Suction alarms — often volume or position related — are reported with the patient's volume status and any recent movement; the team, not the bedside nurse alone, decides the response.", citationIDs: ["mcs_scai_consensus_2015"])
            ]),
            .bullets(title: "Complications to watch for", [
                AttributedBullet("Hemolysis — the signature complication of axial-flow pumps: falling hemoglobin with rising plasma-free hemoglobin and LDH, dark urine, possible acute kidney injury.", citationIDs: ["mcs_scai_consensus_2015"]),
                AttributedBullet("Device migration — position alarms, falling flows, new or worsening hemolysis; confirmed by echo and repositioned by the provider.", citationIDs: ["mcs_scai_consensus_2015"]),
                AttributedBullet("Bleeding and vascular injury at the large-bore arterial access site, including retroperitoneal bleeding.", citationIDs: ["mcs_scai_consensus_2015"]),
                AttributedBullet("Limb ischemia distal to the femoral cannula.", citationIDs: ["mcs_scai_consensus_2015"]),
                AttributedBullet("Aortic valve injury or worsening aortic regurgitation from the catheter crossing the valve.", citationIDs: ["mcs_scai_consensus_2015"]),
                AttributedBullet("Arrhythmias from the inlet contacting ventricular structures.", citationIDs: ["mcs_scai_consensus_2015"]),
                AttributedBullet("Infection — indwelling vascular device with an external console connection; sterile site care and daily assessment apply.", citationIDs: ["mcs_openrn_critcare"])
            ])
        ],
        citations: [scaiMCSConsensus, openrnCritCareMCS],
        lastSourceFidelityReview: "2026-07-02"
    )
}
