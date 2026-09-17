import Foundation

private let cc_depth_fetroja = CitationSource(
    id: "cc_depth_fetroja",
    shortName: "FDA SPL — FETROJA (cefiderocol)",
    detail: "SPL set 75c0c785-38e0-4049-a6fb-b77581f5b35c, version 11, effective 20260224. Adult prescribing-information excerpts and source-grounded summaries; sections 1, 2, 4–7 and 12.4 (antibiotics) or 12.1 (infusions). Dosing blocks are label reference, not patient-specific orders. Tables reformatted for readability. Pediatric dosing excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "FDA prescribing information distributed by DailyMed; National Library of Medicine",
    license: .cc0,
    url: "https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=75c0c785-38e0-4049-a6fb-b77581f5b35c",
    lastRetrieved: "2026-09-17"
)

private let cc_depth_avycaz = CitationSource(
    id: "cc_depth_avycaz",
    shortName: "FDA SPL — AVYCAZ (ceftazidime and avibactam)",
    detail: "SPL set d9c2803f-dc9c-4b19-b4a3-8303bc8c15fd, version 25, effective 20250430. Adult prescribing-information excerpts and source-grounded summaries; sections 1, 2, 4–7 and 12.4 (antibiotics) or 12.1 (infusions). Dosing blocks are label reference, not patient-specific orders. Tables reformatted for readability. Pediatric dosing excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "FDA prescribing information distributed by DailyMed; National Library of Medicine",
    license: .cc0,
    url: "https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=d9c2803f-dc9c-4b19-b4a3-8303bc8c15fd",
    lastRetrieved: "2026-09-17"
)

public enum CCDepthCefiderocolSample {
    public static let entry = DrugEntry(
        id: "cefiderocol",
        title: "Cefiderocol",
        subtitle: "Fetroja · adult IV antibacterial reference",
        category: "Siderophore cephalosporin antibacterial",
        isHighRisk: true,
        quickReference: [],
        indications: AttributedProse("FETROJA ® is indicated in patients 18 years of age or older for the treatment of complicated urinary tract infections (cUTIs), including pyelonephritis caused by the following susceptible Gram-negative microorganisms: Escherichia coli , Klebsiella pneumoniae , Proteus mirabilis , Pseudomonas aeruginosa , and Enterobacter cloacae complex [see Clinical Studies (14.1) ] .\n\nFETROJA is indicated in patients 18 years of age or older for the treatment of hospital-acquired bacterial pneumonia and ventilator-associated bacterial pneumonia, caused by the following susceptible Gram-negative microorganisms: Acinetobacter baumannii complex, Escherichia coli , Enterobacter cloacae complex, Klebsiella pneumoniae , Pseudomonas aeruginosa , and Serratia marcescens [see Clinical Studies (14.2) ].", citationIDs: ["cc_depth_fetroja"]),
        mechanism: AttributedProse("Cefiderocol binds extracellular ferric iron and enters Gram-negative bacteria through iron-uptake transport as well as porin channels. Binding to penicillin-binding proteins inhibits cell-wall biosynthesis. The label does not describe clinically relevant activity against most Gram-positive or anaerobic bacteria.", citationIDs: ["cc_depth_fetroja"]),
        dosing: [
            DosingBlock(label: "FDA adult label — CrCl 60–119 mL/min", body: "The recommended dosage of FETROJA is 2 grams administered every 8 hours by intravenous (IV) infusion over 3 hours in adults with a creatinine clearance (CLcr) of 60 to 119 mL/min. Dosage adjustment of FETROJA is recommended for patients with CLcr less than 60 mL/min, including patients receiving intermittent hemodialysis (HD) or continuous renal replacement therapy (CRRT), and for patients with CLcr 120 mL/min or greater [see Dosage and Administration (2.2) ]. The recommended duration of treatment with FETROJA is 7 to 14 days. The duration of therapy should be guided by the patient's clinical status.", citationIDs: ["cc_depth_fetroja"]),
            DosingBlock(label: "FDA adult label — renal adjustment, Table 1", body: "Creatinine clearance estimated with Cockcroft–Gault. Each listed dose is infused over 3 hours.\n30–59 mL/min: 1.5 grams every 8 hours.\n15–29 mL/min: 1 gram every 8 hours.\nLess than 15 mL/min, with or without intermittent hemodialysis: 0.75 grams every 12 hours.\nThe label specifies administration immediately after intermittent hemodialysis and monitoring of fluctuating renal function. This table does not replace the separate CRRT regimen.", citationIDs: ["cc_depth_fetroja"]),
            DosingBlock(label: "FDA adult label — augmented clearance", body: "For patients with CLcr greater than or equal to 120 mL/min, FETROJA 2 grams administered every 6 hours by IV infusion over 3 hours is recommended [see Use in Specific Populations (8.6) ] .", citationIDs: ["cc_depth_fetroja"]),
            DosingBlock(label: "CRRT requires the separate label table", body: "The label bases initial CRRT dosing on effluent flow, with potential tailoring for residual renal function and clinical status. CVVH, CVVHD and CVVHDF use different components of effluent flow. The prescribing and pharmacy teams must use section 2.2, Table 2; an intermittent-hemodialysis dose cannot be substituted.", citationIDs: ["cc_depth_fetroja"])
        ],
        contraindications: AttributedProse("FETROJA is contraindicated in patients with a known history of severe hypersensitivity to cefiderocol or other beta-lactam antibacterial drugs, or any other component of FETROJA [see Warnings and Precautions (5.2) and Adverse Reactions (6.1) ] .", citationIDs: ["cc_depth_fetroja"]),
        warnings: [
            AttributedBullet("Mortality warning: the label reports increased all-cause mortality versus best available therapy in a study of critically ill patients with carbapenem-resistant Gram-negative infections. The cause has not been established. The label calls for close monitoring of the clinical response in cUTI and HABP/VABP.", citationIDs: ["cc_depth_fetroja"]),
            AttributedBullet("Serious hypersensitivity, including anaphylaxis and severe skin reactions, has been reported with beta-lactam antibacterials. The label calls for a careful allergy history and discontinuation if an allergic reaction occurs.", citationIDs: ["cc_depth_fetroja"]),
            AttributedBullet("C. difficile-associated diarrhea can occur during or after antibacterial exposure. Persistent or severe diarrhea requires evaluation; it is not automatically an uncomplicated medication side effect.", citationIDs: ["cc_depth_fetroja"]),
            AttributedBullet("Seizures, encephalopathy and other CNS reactions are concerns, especially with epilepsy or excessive exposure in renal impairment. The label calls for renal-based dose adjustment and neurological evaluation if CNS adverse reactions occur.", citationIDs: ["cc_depth_fetroja"])
        ],
        adverseReactions: AttributedProse("Reported reactions include diarrhea, infusion-site reactions, rash, candidiasis, nausea, vomiting, liver-test elevations and electrolyte abnormalities. The pneumonia trial also reported hypomagnesemia and atrial fibrillation. Trial frequencies depend on the population and do not predict an individual patient’s risk.", citationIDs: ["cc_depth_fetroja"]),
        drugInteractions: [
            AttributedBullet("Cefiderocol may result in false-positive results in dipstick tests (urine protein, ketones, or occult blood). Use alternate clinical laboratory methods of testing to confirm positive tests.", citationIDs: ["cc_depth_fetroja"])
        ],
        citations: [cc_depth_fetroja],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CCDepthCeftazidimeAvibactamSample {
    public static let entry = DrugEntry(
        id: "ceftazidime-avibactam",
        title: "Ceftazidime–avibactam",
        subtitle: "Avycaz · adult IV antibacterial reference",
        category: "Cephalosporin / beta-lactamase inhibitor",
        isHighRisk: true,
        quickReference: [],
        indications: AttributedProse("FDA indication excerpts (the dosing below is restricted to adults):\n\nAVYCAZ (ceftazidime and avibactam) in combination with metronidazole, is indicated for the treatment of complicated intra-abdominal infections (cIAI) in adult and pediatric patients (at least 31 weeks gestational age) caused by the following susceptible gram-negative microorganisms: Escherichia coli , Klebsiella pneumoniae , Proteus mirabilis, Enterobacter cloacae, Klebsiella oxytoca, Citrobacter freundii complex, and Pseudomonas aeruginosa .\n\nAVYCAZ (ceftazidime and avibactam) is indicated for the treatment of complicated urinary tract infections (cUTI) including pyelonephritis in adult and pediatric patients (at least 31 weeks gestational age) caused by the following susceptible gram-negative microorganisms: Escherichia coli , Klebsiella pneumoniae, Enterobacter cloacae, Citrobacter freundii complex, Proteus mirabilis , and Pseudomonas aeruginosa .\n\nAVYCAZ (ceftazidime and avibactam) is indicated for the treatment of hospital-acquired bacterial pneumonia and ventilator-associated bacterial pneumonia (HABP/VABP) in adult and pediatric patients (at least 31 weeks gestational age) caused by the following susceptible gram-negative microorganisms: Klebsiella pneumoniae, Enterobacter cloacae, Escherichia coli, Serratia marcescens, Proteus mirabilis, Pseudomonas aeruginosa, and Haemophilus influenzae .", citationIDs: ["cc_depth_avycaz"]),
        mechanism: AttributedProse("Ceftazidime binds penicillin-binding proteins; avibactam inhibits certain beta-lactamases that degrade ceftazidime. The label describes activity against some KPC, AmpC and OXA enzymes, but not metallo-beta-lactamase-producing bacteria. Susceptibility and the infection site remain essential to selection.", citationIDs: ["cc_depth_avycaz"]),
        dosing: [
            DosingBlock(label: "FDA adult label — CrCl above 50 mL/min", body: "The recommended dosage of AVYCAZ is 2.5 grams (ceftazidime 2 grams and avibactam 0.5 grams) administered every 8 hours by intravenous (IV) infusion over 2 hours in patients 18 years of age and older with CrCl greater than 50 mL/min. For treatment of cIAI, metronidazole should be given concurrently.", citationIDs: ["cc_depth_avycaz"]),
            DosingBlock(label: "FDA adult label — renal adjustment, Table 3", body: "Adult creatinine clearance is estimated with Cockcroft–Gault. All doses below are infused over 2 hours.\n31–50 mL/min: 1.25 grams (ceftazidime 1 gram / avibactam 0.25 grams) every 8 hours.\n16–30 mL/min: 0.94 grams (0.75 grams / 0.19 grams) every 12 hours.\n6–15 mL/min: 0.94 grams every 24 hours.\n5 mL/min or less: 0.94 grams every 48 hours.\nBoth components are hemodialyzable; the label specifies administration after hemodialysis on dialysis days. For changing renal function, the label specifies at least daily CrCl monitoring and corresponding dose adjustment.", citationIDs: ["cc_depth_avycaz"]),
            DosingBlock(label: "Preparation and compatibility", body: "The supplied powder requires constitution and further dilution before infusion. Section 2.4 contains the preparation volumes; section 2.5 lists tested Y-site combinations and concentrations. Compatibility is specific to the listed conditions, not a general statement that other IV medicines may share the line.", citationIDs: ["cc_depth_avycaz"])
        ],
        contraindications: AttributedProse("AVYCAZ is contraindicated in patients with known serious hypersensitivity to the components of AVYCAZ (ceftazidime and avibactam), avibactam containing products, or other members of the cephalosporin class [see Warnings and Precautions ( 5.2 )] .", citationIDs: ["cc_depth_avycaz"]),
        warnings: [
            AttributedBullet("Reduced clinical response occurred in a cIAI subgroup with moderate renal impairment in the trial, where the dose was lower than the currently recommended regimen. This finding makes changes in renal function and correct adjustment particularly important; it was not observed in the corresponding cUTI and HABP/VABP subgroups.", citationIDs: ["cc_depth_avycaz"]),
            AttributedBullet("Serious and sometimes fatal hypersensitivity and serious skin reactions have occurred with beta-lactams. Review the cephalosporin, penicillin and carbapenem allergy history; the label specifies discontinuation for an allergic reaction.", citationIDs: ["cc_depth_avycaz"]),
            AttributedBullet("C. difficile-associated diarrhea ranges from mild diarrhea to fatal colitis and may occur more than two months after antibacterial exposure. Evaluate new diarrhea in the context of recent therapy.", citationIDs: ["cc_depth_avycaz"]),
            AttributedBullet("Seizures, nonconvulsive status epilepticus (NCSE), encephalopathy, coma, asterixis, neuromuscular excitability, and myoclonia have been reported in patients treated with ceftazidime, particularly in the setting of renal impairment. Adjust dosing based on creatinine clearance [ see Dosage and Administration ( 2.2 ) ] .", citationIDs: ["cc_depth_avycaz"])
        ],
        adverseReactions: AttributedProse("Adult trial reactions included diarrhea, nausea, vomiting and headache. The HABP/VABP population also had hypokalemia. Review the source’s indication-specific trial tables rather than applying a pooled frequency to every patient.", citationIDs: ["cc_depth_avycaz"]),
        drugInteractions: [
            AttributedBullet("Co-administration with probenecid is not recommended: inhibition of renal transport may reduce avibactam elimination; a clinical interaction study was not conducted.", citationIDs: ["cc_depth_avycaz"]),
            AttributedBullet("The administration of ceftazidime may result in a false-positive reaction for glucose in the urine with certain methods. It is recommended that glucose tests based on enzymatic glucose oxidase reactions be used.", citationIDs: ["cc_depth_avycaz"])
        ],
        citations: [cc_depth_avycaz],
        lastSourceFidelityReview: "2026-09-17"
    )
}
