import Foundation

// Curator-model lab entries (round 31 — neurology diagnostics).

private let openrnLabsR31 = CitationSource(
    id: "openrn_labs_round31",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let specialtyLabsR31 = CitationSource(
    id: "specialty_labs_round31",
    shortName: "AAN + ILAE + specialty concept citations",
    publisher: "AAN · ILAE · specialty",
    license: .factCitationOnly,
    url: "https://www.aan.com/Guidelines/",
    lastRetrieved: "2026-05-13"
)

private let labsTagsR31 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .neurologicalRegulation
)

public enum CSFAnalysisSample {
    public static let entry: LabEntry = LabEntry(
        id: "csf-analysis",
        title: "Cerebrospinal fluid (CSF) analysis",
        subtitle: "Lumbar puncture diagnostic · cells + protein + glucose + opening pressure + microbiologic + cytology + oligoclonal bands · pattern interpretation",
        specimen: "CSF via lumbar puncture (typically 4 tubes 1-2 mL each); opening pressure measured during LP; tube 1 — cell count, tube 2 — chemistry (protein/glucose), tube 3 — microbiology, tube 4 — additional studies",
        nclexTags: labsTagsR31,
        referenceRanges: [
            ReferenceRangeRow(value: "Opening pressure 70-200 mm H2O (adult lateral decubitus)", label: "Normal range; elevated in idiopathic intracranial hypertension, cryptococcal meningitis, mass + obstruction, intracerebral hemorrhage; low in CSF leak", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Appearance: clear + colorless", label: "Normal; xanthochromia (yellow) in SAH (>2-3 hours post bleed); cloudy in infection (high cells); bloody from traumatic tap vs SAH (3-tube test, xanthochromia distinguishes)", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "WBC: 0-5 cells/μL adult (slightly higher in neonates)", label: "Lymphocytic pleocytosis — viral meningoencephalitis, TB, fungal, autoimmune; neutrophilic — bacterial meningitis (typically >1000); eosinophilic — parasitic", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "RBC: 0-5 cells/μL (excluding traumatic tap)", label: "Elevated in SAH, traumatic tap, hemorrhagic encephalitis (HSV); xanthochromia + RBC count drop tube 1 to tube 4 distinguishes traumatic from true bleed", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Protein: 15-45 mg/dL", label: "Elevated in infection (especially bacterial), GBS (albuminocytologic dissociation — high protein + normal cells), MS, neoplasia, traumatic tap, age-related", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Glucose: 40-70 mg/dL OR 50-66% of serum glucose", label: "LOW in bacterial meningitis + TB + fungal + carcinomatous meningitis + autoimmune; normal in viral; check concurrent serum glucose", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Gram stain + culture", label: "Bacterial meningitis identification; specific stains for fungi + AFB; PCR for HSV/enterovirus/specific bacteria", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Oligoclonal bands (CSF)", label: "Positive in MS (~95%), other autoimmune CNS, chronic infections; need parallel serum sample (CSF-specific bands diagnostic)", citationIDs: ["specialty_labs_round31"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal CSF",
                summary: "Normal CSF — most CNS pathologies ruled out; consider other causes of symptoms. Some conditions can have normal CSF early or in mild cases per primary source.",
                nursingActions: [
                    "Document baseline; correlate with clinical presentation + imaging.",
                    "Repeat if high clinical suspicion + initial negative.",
                    "Consider PCR + serology in viral encephalitis suspicion."
                ],
                citationIDs: ["specialty_labs_round31"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Bacterial meningitis pattern",
                summary: "High WBC (>1000) with NEUTROPHIL predominance + low glucose + high protein + positive gram stain/culture → bacterial meningitis EMERGENCY per primary source.",
                nursingActions: [
                    "EMERGENT EMPIRIC ANTIBIOTICS — vancomycin + ceftriaxone (+ ampicillin if age >50 or immunocompromised for Listeria + dexamethasone for adult pneumococcal); don't delay for LP results.",
                    "Identify pathogen — gram stain + culture + PCR (multiplex meningitis panel).",
                    "Targeted therapy once organism + susceptibility known.",
                    "ICU + supportive care + ICP management + seizure control.",
                    "Public health notification + close contact prophylaxis for meningococcal.",
                    "Audiology follow-up — hearing loss complication."
                ],
                citationIDs: ["specialty_labs_round31"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Lymphocytic pleocytosis",
                summary: "Lymphocytic predominance — viral, TB, fungal, autoimmune, neoplastic per primary source.",
                nursingActions: [
                    "Comprehensive workup — viral PCR (HSV, enterovirus, varicella), TB (AFB stain + culture + GeneXpert + CSF ADA), fungal (cryptococcal antigen + India ink + fungal cultures), autoimmune encephalitis antibodies, cytology if neoplasia suspected.",
                    "EMPIRIC acyclovir IV if HSV encephalitis suspected — START EARLY, don't wait for PCR.",
                    "ID + neurology + neurosurgery (if needed) multidisciplinary.",
                    "Brain imaging + MRI for parenchymal involvement."
                ],
                citationIDs: ["specialty_labs_round31"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Bacterial meningitis (neutrophilic + low glucose + high protein)",
                causes: ["Streptococcus pneumoniae (most common adult)", "Neisseria meningitidis (young adults + outbreaks)", "Haemophilus influenzae (mostly pediatric, declined with Hib vaccine)", "Listeria monocytogenes (elderly + immunocompromised + pregnant)", "Group B Streptococcus (neonates + adults)", "Staphylococcus aureus (post-surgical + traumatic)", "Gram-negatives (especially nosocomial post-surgical)"],
                citationIDs: ["specialty_labs_round31"]
            ),
            CauseGroup(
                title: "Viral meningitis/encephalitis (lymphocytic + normal glucose + mildly elevated protein)",
                causes: ["Enteroviruses (most common viral meningitis)", "Herpes simplex (encephalitis — emergent)", "Varicella-zoster", "Arboviruses (West Nile, EEE, WEE)", "HIV (acute seroconversion)", "Mumps (rare due to vaccination)"],
                citationIDs: ["specialty_labs_round31"]
            ),
            CauseGroup(
                title: "Chronic meningitis (lymphocytic + low glucose + high protein)",
                causes: ["Tuberculosis (AFB stain + culture + GeneXpert + CSF ADA)", "Fungal — Cryptococcus (CrAg + India ink), Coccidioides, Histoplasma, Blastomyces", "Neurosyphilis (CSF VDRL + FTA-ABS)", "Lyme neuroborreliosis", "Brucellosis", "Carcinomatous meningitis (CSF cytology)"],
                citationIDs: ["specialty_labs_round31"]
            ),
            CauseGroup(
                title: "Non-infectious",
                causes: ["Subarachnoid hemorrhage (RBCs + xanthochromia 2-3 hours+)", "Multiple sclerosis (CSF-specific oligoclonal bands + IgG index)", "Autoimmune encephalitis (anti-NMDA, LGI1, CASPR2, others)", "Guillain-Barré (high protein + normal cell count = albuminocytologic dissociation)", "Neoplasia + carcinomatous meningitis (cytology)", "Vasculitis", "Sarcoidosis", "Hydrocephalus + idiopathic intracranial hypertension"],
                citationIDs: ["specialty_labs_round31"]
            )
        ],
        nursingActions: [
            AttributedBullet("CSF analysis includes opening pressure + cell count + protein + glucose + gram stain + culture + PCR + cytology + oligoclonal bands + specific tests based on suspicion.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("Concurrent SERUM glucose — calculate CSF/serum ratio (normal 0.6); low ratio bacterial/TB/fungal meningitis.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("OLIGOCLONAL BANDS — need PAIRED CSF + serum samples; CSF-specific bands indicate intrathecal IgG synthesis (MS, autoimmune, chronic infection).", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("XANTHOCHROMIA — yellow tint of CSF supernatant after centrifugation; develops 2-3 hours post SAH bleed; persists 2-3 weeks; distinguishes from traumatic tap.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("TRAUMATIC TAP — RBCs decrease tube 1 to tube 4; SAH RBCs remain elevated; xanthochromia present in SAH after 2-3 hours.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("BIOFIRE meningitis/encephalitis multiplex PCR — rapid identification of common pathogens; complement traditional methods.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("Imaging BEFORE LP if focal deficits + altered mental status + immunocompromise + papilledema — herniation risk.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("Anticoagulation + platelet count — coagulopathy increases hemorrhage risk; reverse before LP if possible.", citationIDs: ["specialty_labs_round31"])
        ],
        watchFor: [
            AttributedBullet("EMERGENT — bacterial meningitis (don't delay antibiotics for LP), HSV encephalitis (empiric acyclovir), SAH (CTA), elevated ICP from mass (herniation risk if LP done without imaging).", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("Post-LP HEADACHE — common; positional (worse upright); managed with hydration + caffeine + analgesics; persistent → blood patch.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("INFECTION — meningitis from LP rare; sterile technique.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("BLEEDING — hematoma rare; coagulation status + platelets pre-procedure.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("TRAUMATIC TAP — confounds analysis; correct for RBCs in WBC count.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("ANTIBIOTIC-PRE-TREATED meningitis — gram stain less sensitive but culture + PCR + biomarkers still useful; clinical context.", citationIDs: ["specialty_labs_round31"])
        ],
        citations: [openrnLabsR31, specialtyLabsR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum EEGInterpretationSample {
    public static let entry: LabEntry = LabEntry(
        id: "eeg-interpretation",
        title: "Electroencephalogram (EEG) interpretation",
        subtitle: "Scalp electrodes record cortical electrical activity · routine 20-40 min · video-EEG continuous · sleep + epilepsy + encephalopathy diagnosis · sedation/photic provocation",
        specimen: "Scalp electrodes (10-20 international system); routine EEG 20-40 minutes; sleep-deprived EEG; ambulatory 24-72 hours; long-term continuous video-EEG (epilepsy monitoring unit)",
        nclexTags: labsTagsR31,
        referenceRanges: [
            ReferenceRangeRow(value: "Normal wake adult", label: "Alpha rhythm (8-13 Hz) posterior dominant when awake + eyes closed; beta (>13 Hz) frontal; symmetric + reactive (alpha attenuates with eye opening)", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Normal sleep stages", label: "N1 (drowsy) — slowing, vertex waves; N2 — sleep spindles + K complexes; N3 (deep) — delta waves >75 μV; REM — low-voltage mixed frequency similar to wake", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Generalized slowing", label: "Diffuse delta + theta — generalized encephalopathy (toxic-metabolic, infection, dementia, brain injury)", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Focal slowing", label: "Lateralized — focal lesion (stroke, tumor, abscess, post-ictal); requires imaging", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Epileptiform discharges", label: "Spikes + sharp waves; focal (focal-onset epilepsy) vs generalized (idiopathic generalized epilepsy, JME, absence); interictal → supports epilepsy diagnosis", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Status epilepticus patterns", label: "Continuous OR recurrent seizure activity; ICTAL patterns; rhythmic delta or spike-wave; emergent treatment", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Specific syndromes", label: "Hypsarrhythmia (West syndrome / infantile spasms — chaotic high-amplitude); 3-Hz spike-wave (absence epilepsy); PLEDs (focal slowing — HSV encephalitis, stroke); extreme delta brush (anti-NMDA encephalitis); triphasic waves (hepatic encephalopathy)", citationIDs: ["specialty_labs_round31"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal EEG",
                summary: "Normal EEG — alpha rhythm posterior dominant when awake + eyes closed; symmetric; reactive; sleep architecture preserved per primary source.",
                nursingActions: [
                    "Reassure patient if seizure workup; normal interictal EEG does NOT exclude epilepsy (sensitivity ~50% routine; higher with multiple recordings, sleep-deprived, ambulatory, video-EEG).",
                    "Provocation testing — hyperventilation 3 minutes + photic stimulation; ~10% epilepsy elicited only with provocation.",
                    "Repeat or long-term ambulatory/video-EEG if clinical suspicion high but routine EEG negative.",
                    "Consider non-epileptic event diagnosis (psychogenic, syncope, etc.)."
                ],
                citationIDs: ["specialty_labs_round31"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Status epilepticus or active seizure",
                summary: "Continuous or recurrent ictal patterns OR non-convulsive status epilepticus — EMERGENT treatment per primary source.",
                nursingActions: [
                    "EMERGENT — benzodiazepine (lorazepam 4 mg IV) first-line; second-line (fosphenytoin/phenytoin 20 mg/kg, valproate 40 mg/kg, levetiracetam 60 mg/kg, lacosamide 200-400 mg); refractory → continuous infusion (midazolam, propofol, pentobarbital).",
                    "Continuous video-EEG monitoring to confirm seizure cessation.",
                    "Identify trigger — non-adherence, infection, electrolytes, hypoglycemia, intracranial pathology, drug overdose, withdrawal.",
                    "Imaging + comprehensive workup.",
                    "Airway protection + ICU + supportive care."
                ],
                citationIDs: ["specialty_labs_round31"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Epileptiform abnormalities",
                summary: "Interictal epileptiform discharges (spikes, sharp waves) + clinical features support epilepsy diagnosis + classification (focal vs generalized) per primary source.",
                nursingActions: [
                    "Epilepsy diagnosis + classification (focal vs generalized) guides AED selection.",
                    "Initiate AED if recurrent seizures, single seizure with high recurrence risk, or specific syndromes.",
                    "Comprehensive evaluation — MRI brain, comprehensive history, comorbidities, triggers.",
                    "Patient education — seizure precautions (driving restrictions per state), bathing safety (showers vs baths), water + heights + power tools, work + school, pregnancy planning + folic acid.",
                    "Multidisciplinary — neurology + epileptologist (refractory)."
                ],
                citationIDs: ["specialty_labs_round31"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Abnormal slowing patterns",
                causes: ["Generalized slowing — toxic-metabolic encephalopathy (uremia, hepatic, electrolyte, hypoxia), drug intoxication, post-ictal, dementia, brain injury", "Focal slowing — stroke, tumor, abscess, post-ictal, focal cerebritis", "Triphasic waves — hepatic encephalopathy classic", "Periodic lateralized epileptiform discharges (PLEDs) — HSV encephalitis, acute stroke, severe focal pathology", "Burst-suppression — severe brain injury, hypoxic-ischemic, anesthesia, deep coma"],
                citationIDs: ["specialty_labs_round31"]
            ),
            CauseGroup(
                title: "Epileptiform patterns",
                causes: ["Focal spike + sharp waves — focal-onset epilepsy (temporal lobe most common)", "3-Hz generalized spike-wave — absence epilepsy + JME", "Polyspike + wave — JME + other generalized epilepsy", "Hypsarrhythmia — West syndrome / infantile spasms", "Extreme delta brush — anti-NMDA encephalitis", "Photic-paroxysmal response — photosensitive epilepsy"],
                citationIDs: ["specialty_labs_round31"]
            ),
            CauseGroup(
                title: "Status epilepticus",
                causes: ["Convulsive — generalized tonic-clonic continuous or recurrent", "Non-convulsive — altered mental status without overt motor activity; continuous video-EEG to diagnose", "Refractory — failure of 2+ antiepileptics; requires anesthesia", "Super-refractory — continued seizures despite 24+ hours of anesthesia"],
                citationIDs: ["specialty_labs_round31"]
            )
        ],
        nursingActions: [
            AttributedBullet("Routine EEG limited sensitivity (~50%) for epilepsy; multiple EEGs OR sleep-deprived OR ambulatory OR video-EEG increase yield.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("ACTIVATION procedures during routine EEG — hyperventilation 3 minutes + photic stimulation; elicit ~10% additional epileptiform activity.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("CONTINUOUS VIDEO-EEG (cEEG) — gold standard for status epilepticus + non-convulsive seizures + epileptogenic zone localization + characterizing events.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("AMBULATORY EEG (24-72 hours) — captures events outside hospital; useful in seizure documentation + classification.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("Patient PREPARATION — clean hair; avoid hairspray, gels, products; usual medications including AEDs UNLESS instructed otherwise for activation studies; sleep-deprived EEG requires reduced sleep night before.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("Standard 10-20 SYSTEM — electrode placement based on % distance from anatomic landmarks; 21 electrodes routine.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("MEDICATIONS affecting EEG — benzodiazepines + barbiturates (beta activity, suppression), antipsychotics, lithium, theophylline (epileptiform); document.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("STATUS EPILEPTICUS — continuous EEG essential for non-convulsive forms; treat aggressively with established protocols.", citationIDs: ["specialty_labs_round31"])
        ],
        watchFor: [
            AttributedBullet("NORMAL EEG doesn't exclude epilepsy — multiple recordings + sleep-deprived + activation + ambulatory + video-EEG.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("NON-CONVULSIVE STATUS EPILEPTICUS — common in ICU + altered mental status; continuous EEG to diagnose.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("PSYCHOGENIC NON-EPILEPTIC SEIZURES (PNES) — events without ictal EEG correlate; video-EEG with seizure capture diagnostic; psychiatric not neurologic management.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("INFANTILE SPASMS — emergent treatment with ACTH or vigabatrin; hypsarrhythmia on EEG.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("PROGNOSIS in coma — burst-suppression + electrocerebral silence + status epilepticus pattern + lack of reactivity all suggest poor prognosis; integrate with clinical + imaging.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("BRAIN DEATH determination — electrocerebral silence supportive but not required for diagnosis; clinical exam + apnea test gold standard.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("SUDDEN UNEXPECTED DEATH IN EPILEPSY (SUDEP) — risk in poorly controlled epilepsy; counsel patients + families.", citationIDs: ["specialty_labs_round31"])
        ],
        citations: [openrnLabsR31, specialtyLabsR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ParaneoplasticAbPanelSample {
    public static let entry: LabEntry = LabEntry(
        id: "paraneoplastic-antibody-panel",
        title: "Paraneoplastic + autoimmune encephalitis antibody panel",
        subtitle: "Anti-Hu/Ri/Yo/Tr/Ma2 (classical paraneoplastic) + NMDA-R/LGI1/CASPR2/AMPA/GABA-B (autoimmune encephalitis) · CSF + serum · syndrome-specific tumor screening",
        specimen: "SERUM + CSF (both preferred — antibodies vary; some intracellular = serum, some cell surface = CSF/serum); commercial panels available; turnaround days-weeks",
        nclexTags: labsTagsR31,
        referenceRanges: [
            ReferenceRangeRow(value: "Negative", label: "Paraneoplastic + autoimmune encephalitis less likely; reconsider other etiologies of neurologic syndrome", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Anti-Hu (ANNA-1)", label: "Paraneoplastic — sensory neuropathy + limbic encephalitis + cerebellar + autonomic; small cell lung cancer (SCLC) most common; intracellular antibody; CSF + serum", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Anti-Yo (PCA-1)", label: "Paraneoplastic cerebellar degeneration; gynecologic + breast cancers; Purkinje cell antibody", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Anti-Ri (ANNA-2)", label: "Paraneoplastic — opsoclonus-myoclonus syndrome + brainstem; breast + lung cancers", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Anti-Ma2", label: "Paraneoplastic limbic + diencephalic + brainstem encephalitis; testicular cancer in young men; older adults — other cancers", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Anti-CV2 (CRMP5)", label: "Paraneoplastic — uveitis + retinitis + cerebellar + peripheral neuropathy + chorea; SCLC + thymoma", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Anti-NMDA receptor", label: "Autoimmune encephalitis — psychiatric + seizures + dyskinesia + autonomic + decreased LOC; young women + ovarian teratoma (~50%); CSF more sensitive than serum", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Anti-LGI1 (leucine-rich glioma-inactivated 1)", label: "Limbic encephalitis with FACIO-BRACHIAL DYSTONIC SEIZURES + hyponatremia (SIADH); older adults; some malignancy association", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Anti-CASPR2", label: "Morvan syndrome (peripheral nerve hyperexcitability + autonomic + insomnia) + limbic encephalitis; thymoma in some", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Anti-GABA-B", label: "Limbic encephalitis with prominent SEIZURES + temporal lobe; SCLC association", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Anti-AMPA receptor", label: "Limbic encephalitis with behavioral changes + memory + seizures; thymoma + breast + SCLC", citationIDs: ["specialty_labs_round31"]),
            ReferenceRangeRow(value: "Anti-GAD65 (glutamic acid decarboxylase)", label: "Stiff-person syndrome + cerebellar ataxia + epilepsy + limbic encephalitis; T1DM commonly coexists; usually NOT paraneoplastic at low titers; HIGH titers may suggest neuro autoimmunity", citationIDs: ["specialty_labs_round31"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative panel",
                summary: "Negative panel — paraneoplastic + autoimmune encephalitis less likely but possible (seronegative cases exist); reconsider other etiologies per primary source.",
                nursingActions: [
                    "Continue workup — alternative infectious + autoimmune + neoplastic + metabolic causes.",
                    "If clinical features compatible — repeat testing, consider seronegative autoimmune encephalitis, empiric immunotherapy trial.",
                    "Tumor screening if syndrome compatible — pelvic/abdominal + chest CT, DOTATATE PET, transvaginal ultrasound.",
                    "Multidisciplinary — neurology + oncology + ID."
                ],
                citationIDs: ["specialty_labs_round31"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Positive antibody — workup + treatment",
                summary: "Positive paraneoplastic + autoimmune encephalitis antibodies — initiate evaluation + treatment per primary source.",
                nursingActions: [
                    "SYNDROME-SPECIFIC TUMOR SCREENING — Anti-Hu/CV2 → chest CT + bronchoscopy for SCLC; Anti-Yo → pelvic + breast imaging; Anti-Ma2 → testicular US (young) OR other (older); Anti-NMDA-R → ovarian ultrasound + pelvic MRI for teratoma; Anti-LGI1 → minimal tumor screening; etc.",
                    "TUMOR REMOVAL if found — first-line treatment in paraneoplastic + transforms outcomes.",
                    "IMMUNOTHERAPY — IVIG 2 g/kg + high-dose steroids + plasma exchange first-line; rituximab + cyclophosphamide for refractory.",
                    "MAINTENANCE immunotherapy for cell-surface antibodies (NMDA-R, LGI1, CASPR2, AMPA, GABA-B) — rituximab q6 months OR mycophenolate; lifelong vs years.",
                    "Cell-surface antibodies generally respond better to immunotherapy than intracellular paraneoplastic antibodies.",
                    "ICU management — autonomic instability + seizures + dyskinesia.",
                    "Rehabilitation — cognitive + motor + psychiatric recovery often slow.",
                    "Multidisciplinary — neurology + oncology + gynecology + critical care + psychiatry + rehabilitation."
                ],
                citationIDs: ["specialty_labs_round31"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Classical paraneoplastic syndromes (intracellular antibodies)",
                causes: ["Anti-Hu — SCLC; limbic encephalitis + sensory neuropathy + cerebellar + autonomic", "Anti-Yo — gynecologic + breast cancers; cerebellar degeneration", "Anti-Ri — breast + lung; opsoclonus-myoclonus + brainstem", "Anti-Ma2 — testicular (young men) + other cancers (older); limbic encephalitis + diencephalon", "Anti-CV2/CRMP5 — SCLC + thymoma; uveitis + cerebellar + neuropathy + chorea", "Anti-amphiphysin — breast cancer; stiff-person syndrome"],
                citationIDs: ["specialty_labs_round31"]
            ),
            CauseGroup(
                title: "Autoimmune encephalitis (cell-surface antibodies)",
                causes: ["Anti-NMDA-R — young women + ovarian teratoma; psychiatric + seizures + dyskinesia + autonomic", "Anti-LGI1 — elderly + facio-brachial dystonic seizures + hyponatremia", "Anti-CASPR2 — Morvan syndrome + limbic + thymoma in some", "Anti-GABA-B — SCLC + limbic encephalitis with seizures", "Anti-AMPA — thymoma + breast + SCLC; limbic encephalitis", "Anti-DPPX — gastrointestinal + CNS hyperexcitability", "Anti-glycine receptor — PERM (progressive encephalomyelitis with rigidity)", "Anti-IgLON5 — sleep-related + parkinsonian"],
                citationIDs: ["specialty_labs_round31"]
            ),
            CauseGroup(
                title: "Tumor screening by syndrome",
                causes: ["Limbic encephalitis — chest CT (SCLC), testicular US (Ma2), pelvic imaging (teratoma)", "Cerebellar degeneration — gynecologic + breast (Yo), chest (Hu)", "Sensory neuropathy — chest CT for SCLC (Hu)", "Stiff-person — breast (amphiphysin)", "Opsoclonus-myoclonus — chest (breast lung Ri); pediatric — neuroblastoma", "DOTATATE PET — neuroendocrine tumors", "FDG PET — comprehensive malignancy screening if standard imaging negative + high clinical suspicion"],
                citationIDs: ["specialty_labs_round31"]
            )
        ],
        nursingActions: [
            AttributedBullet("BOTH SERUM + CSF preferred — cell-surface antibodies may be CSF-positive only (NMDA-R); intracellular more often serum-positive.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("CELL-SURFACE vs INTRACELLULAR — cell-surface antibodies (NMDA-R, LGI1, CASPR2, AMPA, GABA-B) are PATHOGENIC + RESPOND TO IMMUNOTHERAPY; intracellular (Hu, Yo, Ri, Ma2, CV2) are markers + don't directly cause disease + respond poorly to immunotherapy.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("TUMOR SCREENING by syndrome — directed imaging + selective tests; PET-CT if standard negative; periodic screening for occult malignancy (~2-5 years if antibody persists).", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("TUMOR REMOVAL transforms outcomes in paraneoplastic — emergent surgical + oncologic management.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("IMMUNOTHERAPY — first-line steroids + IVIG OR plasmapheresis; second-line rituximab + cyclophosphamide; maintenance with cell-surface antibodies.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("Treatment-responsive autoimmune encephalitis (especially anti-NMDA-R) — significant recovery possible.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("Differential — seronegative autoimmune encephalitis (clinical syndrome + response to immunotherapy + exclusion of alternatives).", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("Multidisciplinary care + oncology coordination — paraneoplastic management combines tumor treatment + neurology + immunotherapy.", citationIDs: ["specialty_labs_round31"])
        ],
        watchFor: [
            AttributedBullet("EARLY TREATMENT improves outcomes — empirically while awaiting antibody results in suspected autoimmune encephalitis.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("POST-HSV anti-NMDA-R encephalitis — secondary autoimmune phenomenon weeks-months after HSV recovery; relapse with new psychiatric/motor symptoms; check NMDA-R antibodies.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("CHECKPOINT INHIBITOR-INDUCED neurologic immune-related adverse events — autoimmune encephalitis, myasthenia gravis, GBS, hypophysitis, myocarditis with neurologic; cancer immunotherapy era.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("OCCULT MALIGNANCY — periodic re-screening for tumor when antibody is paraneoplastic + initial workup negative.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("FALSE POSITIVE antibodies — low titers in healthy individuals OR other autoimmune conditions; clinical context essential.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("SERONEGATIVE autoimmune encephalitis — clinical features + response to immunotherapy + exclusion; some antibodies not yet identified.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("PROGNOSIS — cell-surface antibodies + tumor removal + early treatment best; intracellular paraneoplastic worse despite tumor treatment.", citationIDs: ["specialty_labs_round31"]),
            AttributedBullet("PEDIATRIC differences — opsoclonus-myoclonus (neuroblastoma in young children); anti-NMDA-R encephalitis pediatric (often no tumor).", citationIDs: ["specialty_labs_round31"])
        ],
        citations: [openrnLabsR31, specialtyLabsR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}
