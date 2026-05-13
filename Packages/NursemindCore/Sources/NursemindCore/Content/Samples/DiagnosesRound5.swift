import Foundation

// Curator-model diagnosis entries (round 5 expansion — pediatric infectious / GI-surgical / adult psych / zoonotic).
// Sources: Open RN Med-Surg + Mental Health (CC BY 4.0), OpenStax Nursing
// (CC BY 4.0 with AI restriction), CDC (public domain), AAP / APA / IDSA concept citations.

private let openrnMSr5 = CitationSource(
    id: "openrn_ms_round5",
    shortName: "Open RN Health Alterations / Medical-Surgical Nursing",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=pediatric+psychiatric+infection",
    lastRetrieved: "2026-05-04"
)
private let openrnMHr5dx = CitationSource(
    id: "openrn_mh_round5_dx",
    shortName: "Open RN Mental Health Nursing",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingmhcc/?s=adhd+borderline+adjustment+stimulant",
    lastRetrieved: "2026-05-04"
)
private let cdcDxR5 = CitationSource(
    id: "cdc_dx_round5",
    shortName: "CDC clinical / infectious-disease guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let dsm5R5 = CitationSource(
    id: "dsm5_round5",
    shortName: "DSM-5-TR diagnostic criteria (concept citation)",
    publisher: "American Psychiatric Association",
    license: .factCitationOnly,
    url: "https://www.psychiatry.org/psychiatrists/practice/dsm",
    lastRetrieved: "2026-05-04"
)

private let pedsInfectionR5 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)
private let pedsGIR5 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .elimination)
private let psychR5 = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .cognition)
private let moodR5 = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .mood)
private let safetyDxR5 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)

// MARK: - Hand-Foot-Mouth Disease

public enum HFMDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hand-foot-mouth-disease",
        title: "Hand-foot-mouth disease",
        subtitle: "Coxsackievirus A16 / enterovirus A71 · self-limited childhood illness",
        nclexTags: pedsInfectionR5,
        definition: AttributedProse(
            "Common viral illness of young children causing painful oral ulcers and a vesicular rash on the hands, feet, and sometimes buttocks. Most often caused by coxsackievirus A16; enterovirus A71 can cause more severe disease per primary source.",
            citationIDs: ["cdc_dx_round5"]
        ),
        pathophysiology: AttributedProse(
            "Enteroviruses spread by fecal-oral and respiratory routes. Incubation 3–6 days. Vesicles develop on oropharyngeal mucosa and acral surfaces. Most cases resolve in 7–10 days; complications (rare) include aseptic meningitis, encephalitis, myocarditis (especially with EV-A71).",
            citationIDs: ["cdc_dx_round5", "openrn_ms_round5"]
        ),
        presentation: [
            AttributedBullet("Low-grade fever, sore throat, malaise.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Painful oral ulcers — tongue, gums, inside cheeks.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Vesicular rash on palms, soles, and sometimes buttocks (does not itch but may be tender).", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Decreased oral intake from mouth pain — dehydration risk.", citationIDs: ["openrn_ms_round5"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis based on classic distribution and age.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("PCR of vesicle or stool can confirm enterovirus type if needed.", citationIDs: ["cdc_dx_round5"])
        ],
        priorityAssessments: [
            AttributedBullet("Hydration — urine output, mucous membranes, skin turgor; weigh daily.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Pain — ability to tolerate fluids and soft foods.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Neurologic signs — for EV-A71 (rare): persistent fever, neck stiffness, confusion → escalate.", citationIDs: ["cdc_dx_round5"])
        ],
        commonInterventions: [
            AttributedBullet("Supportive care — acetaminophen or ibuprofen for fever and pain (no aspirin in children); cool soft foods; popsicles.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Magic mouthwash per provider for oral pain.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Strict hand hygiene; avoid sharing utensils/toys; surface disinfection.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Children may return to childcare when fever-free, drooling has resolved, and lesions are crusted per primary source.", citationIDs: ["cdc_dx_round5"])
        ],
        watchFor: [
            AttributedBullet("Dehydration — most common reason for ED visit; tachycardia, dry mucous membranes, decreased UOP.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("EV-A71 complications (rare) — neurologic signs or shock.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Pregnancy exposure — usually mild but discuss with provider.", citationIDs: ["cdc_dx_round5"])
        ],
        citations: [cdcDxR5, openrnMSr5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Fifth Disease (Erythema Infectiosum)

public enum FifthDiseaseSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "fifth-disease",
        title: "Fifth disease (erythema infectiosum)",
        subtitle: "Parvovirus B19 · slapped-cheek rash · self-limited",
        nclexTags: pedsInfectionR5,
        definition: AttributedProse(
            "Common childhood viral illness caused by parvovirus B19. Classic \"slapped-cheek\" facial erythema followed by lacy reticular rash on trunk and extremities per primary source.",
            citationIDs: ["cdc_dx_round5"]
        ),
        pathophysiology: AttributedProse(
            "Parvovirus B19 spreads by respiratory droplets. Patient is most contagious BEFORE rash appears; once the rash is visible, the patient is no longer infectious. Virus targets erythroid progenitors — can cause aplastic crisis in patients with hemolytic anemia (sickle cell, thalassemia, hereditary spherocytosis).",
            citationIDs: ["cdc_dx_round5"]
        ),
        presentation: [
            AttributedBullet("Mild prodrome — low fever, headache, runny nose 7–10 days before rash.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("\"Slapped-cheek\" — bright red erythema on cheeks; spares nasolabial folds.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Lacy reticular rash on trunk and limbs; may recur for weeks with sun, heat, exercise.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Adults: arthralgia / arthritis (symmetric small joints) is more prominent than rash.", citationIDs: ["openrn_ms_round5"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis in classic presentation.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("B19 IgM serology if pregnant exposure or aplastic crisis or arthropathy with diagnostic uncertainty.", citationIDs: ["cdc_dx_round5"])
        ],
        priorityAssessments: [
            AttributedBullet("In hemolytic anemia: HEMATOCRIT — aplastic crisis risk; check Hgb / retic.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("In pregnancy: assess gestational age, refer to OB; risk of fetal hydrops if exposed in 1st-2nd trimester per primary source.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("In immunocompromised: chronic anemia possible.", citationIDs: ["openrn_ms_round5"])
        ],
        commonInterventions: [
            AttributedBullet("Supportive — antipyretics, hydration, rest.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Once rash appears, child is NOT contagious and may attend school.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Hematology consult for aplastic crisis (transfusion may be needed); OB consult for pregnancy exposure (serial fetal ultrasound for hydrops).", citationIDs: ["cdc_dx_round5"])
        ],
        watchFor: [
            AttributedBullet("Aplastic crisis in patients with hemolytic anemia — sudden Hgb drop, low retic, severe fatigue.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Fetal hydrops in pregnancy — risk highest with first/second trimester infection.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Adult arthralgia can persist for weeks-months.", citationIDs: ["openrn_ms_round5"])
        ],
        citations: [cdcDxR5, openrnMSr5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Roseola

public enum RoseolaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "roseola",
        title: "Roseola (exanthem subitum)",
        subtitle: "HHV-6 / HHV-7 · high fever then rash · febrile-seizure trigger",
        nclexTags: pedsInfectionR5,
        definition: AttributedProse(
            "Common viral illness of infants and toddlers (typically 6–24 months) caused by human herpesvirus 6 (HHV-6) or HHV-7. Characterized by 3–5 days of high fever followed by abrupt defervescence and a rose-colored maculopapular rash.",
            citationIDs: ["cdc_dx_round5"]
        ),
        pathophysiology: AttributedProse(
            "HHV-6/7 transmitted by respiratory droplets and saliva. After primary infection, the virus remains latent in lymphocytes. Most older children and adults have antibody from prior asymptomatic infection.",
            citationIDs: ["cdc_dx_round5"]
        ),
        presentation: [
            AttributedBullet("High fever (often 39.5–40.5 °C / 103–105 °F) for 3–5 days; child may otherwise look well between fever spikes.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Fever drops abruptly; pink-rose maculopapular rash appears on TRUNK first, then face/extremities; rash blanches and is non-pruritic.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Rash typically lasts 1–2 days and resolves without sequelae.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Febrile seizures occur in ~10–15% of affected children due to rapid temperature rise.", citationIDs: ["cdc_dx_round5"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis after rash appears and fever resolves.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Serology / PCR rarely needed except in immunocompromised.", citationIDs: ["cdc_dx_round5"])
        ],
        priorityAssessments: [
            AttributedBullet("During fever phase: assess hydration, look for source of fever (rule out bacteremia).", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Watch for febrile seizures — most common with very rapid temperature change.", citationIDs: ["openrn_ms_round5"])
        ],
        commonInterventions: [
            AttributedBullet("Supportive — antipyretics (acetaminophen / ibuprofen ≥6 mo), hydration, rest.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Educate caregivers on febrile-seizure first aid: place child on side, do not restrain, remove dangerous objects, call 911 if >5 min or first seizure.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Reassure — once rash appears, illness is essentially over.", citationIDs: ["cdc_dx_round5"])
        ],
        watchFor: [
            AttributedBullet("Febrile seizure — frightening but typically benign; first seizure warrants ED evaluation per primary source.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("In immunocompromised: HHV-6 can reactivate and cause encephalitis or pneumonitis.", citationIDs: ["openrn_ms_round5"])
        ],
        citations: [cdcDxR5, openrnMSr5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Scarlet Fever

public enum ScarletFeverSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "scarlet-fever",
        title: "Scarlet fever",
        subtitle: "Group A Streptococcus + erythrogenic toxin · sandpaper rash",
        nclexTags: pedsInfectionR5,
        definition: AttributedProse(
            "Streptococcal pharyngitis with a diffuse erythematous \"sandpaper\" rash caused by erythrogenic exotoxins of group A Streptococcus pyogenes. Most common in children 5–15 years per primary source.",
            citationIDs: ["cdc_dx_round5"]
        ),
        pathophysiology: AttributedProse(
            "GAS produces erythrogenic toxin → diffuse capillary dilation and rash. Untreated GAS pharyngitis is associated with rheumatic fever and post-streptococcal glomerulonephritis. Antibiotics prevent rheumatic fever but not glomerulonephritis.",
            citationIDs: ["cdc_dx_round5"]
        ),
        presentation: [
            AttributedBullet("Sudden fever, sore throat, headache, abdominal pain, vomiting (especially in younger children).", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Diffuse erythematous \"sandpaper\" rash starting on neck/chest, spreading to trunk and extremities; spares palms/soles.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Pastia's lines — accentuated erythema in skin folds (axilla, antecubital, groin).", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Strawberry tongue — red papillated tongue after white coating sloughs.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Circumoral pallor — sparing around the mouth.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Desquamation of palms/soles 1–3 weeks later (peeling).", citationIDs: ["cdc_dx_round5"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Rapid antigen test for GAS or throat culture (gold standard).", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Clinical features (Centor / McIsaac criteria) support testing.", citationIDs: ["cdc_dx_round5"])
        ],
        priorityAssessments: [
            AttributedBullet("Throat exam — exudates, palatal petechiae, anterior cervical lymphadenopathy.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Hydration — sore throat may limit intake.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Skin assessment — rash distribution; later for desquamation.", citationIDs: ["openrn_ms_round5"])
        ],
        commonInterventions: [
            AttributedBullet("Antibiotics per provider — penicillin V or amoxicillin (first line); azithromycin or clindamycin if PCN allergy per primary source.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Antipyretics, throat lozenges, cool fluids, soft diet.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Replace toothbrush after 24 hr of antibiotics; child may return to school 24 hr after antibiotic start AND afebrile per primary source.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("COMPLETE the full antibiotic course — prevents rheumatic fever.", citationIDs: ["openrn_ms_round5"])
        ],
        watchFor: [
            AttributedBullet("Acute rheumatic fever — 2–4 wk after untreated GAS; carditis, polyarthritis, chorea, erythema marginatum.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Post-strep glomerulonephritis — 1–2 wk after; cola-colored urine, edema, HTN.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Peritonsillar / retropharyngeal abscess — \"hot potato\" voice, drooling, neck pain.", citationIDs: ["openrn_ms_round5"])
        ],
        citations: [cdcDxR5, openrnMSr5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Tetanus

public enum TetanusSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "tetanus",
        title: "Tetanus",
        subtitle: "Clostridium tetani · trismus · rigidity · spasms",
        nclexTags: pedsInfectionR5,
        definition: AttributedProse(
            "Acute, often fatal disease caused by an exotoxin (tetanospasmin) produced by Clostridium tetani. Characterized by muscle stiffness and painful spasms. Vaccine-preventable per primary source.",
            citationIDs: ["cdc_dx_round5"]
        ),
        pathophysiology: AttributedProse(
            "C. tetani spores enter through wounds (especially deep or contaminated). The bacterium produces tetanospasmin, which travels retrograde up motor neurons and blocks release of inhibitory neurotransmitters (GABA, glycine), leading to unopposed motor activity → rigidity and spasms.",
            citationIDs: ["cdc_dx_round5"]
        ),
        presentation: [
            AttributedBullet("Trismus (\"lockjaw\") — earliest sign in ~50%.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Risus sardonicus — sardonic facial expression from facial muscle spasm.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Opisthotonos — arched back from generalized rigidity.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Painful muscle spasms triggered by minimal stimuli (light, sound, touch).", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Autonomic dysfunction — labile BP, tachycardia, sweating, fever.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Mental status remains intact.", citationIDs: ["cdc_dx_round5"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — based on history of wound, immunization status, and classic muscle findings.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("No reliable lab test; spatula test (touching posterior pharynx triggers reflex bite rather than gag).", citationIDs: ["cdc_dx_round5"])
        ],
        priorityAssessments: [
            AttributedBullet("Airway — ICU-level care; aspiration and laryngospasm risk.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Stimulation — minimize light, noise, touch (triggers spasms); quiet darkened room.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Wound — debridement; identify entry point.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Immunization history — last Td/Tdap.", citationIDs: ["cdc_dx_round5"])
        ],
        commonInterventions: [
            AttributedBullet("Tetanus immune globulin (TIG) per provider — neutralizes circulating toxin (does not reverse bound toxin).", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Tdap series — active immunity (active disease does not confer immunity).", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Wound debridement; metronidazole IV (preferred) or penicillin per primary source.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Spasm control — benzodiazepines (high doses), magnesium, neuromuscular blockade if intubated; sedation goals.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Autonomic instability — labetalol, magnesium, fluids.", citationIDs: ["cdc_dx_round5"])
        ],
        watchFor: [
            AttributedBullet("Laryngospasm / airway obstruction — be prepared for emergency intubation.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Autonomic crisis — labile hemodynamics, dysrhythmia.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Prevention — Td booster every 10 years; Tdap once and in pregnancy; wound prophylaxis per CDC schedule.", citationIDs: ["cdc_dx_round5"])
        ],
        citations: [cdcDxR5, openrnMSr5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hirschsprung Disease

public enum HirschsprungSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hirschsprung-disease",
        title: "Hirschsprung disease",
        subtitle: "Congenital aganglionic megacolon · failure to pass meconium",
        nclexTags: pedsGIR5,
        definition: AttributedProse(
            "Congenital absence of ganglion cells in the distal colon causing functional obstruction. The aganglionic segment cannot relax, leading to proximal dilation. Most often diagnosed in the newborn period with failure to pass meconium per primary source.",
            citationIDs: ["openrn_ms_round5"]
        ),
        pathophysiology: AttributedProse(
            "Failed neural-crest cell migration during gestation leaves a segment of distal colon without parasympathetic ganglia. The aganglionic segment remains contracted and cannot propel stool. The colon proximal to it dilates (megacolon).",
            citationIDs: ["openrn_ms_round5"]
        ),
        presentation: [
            AttributedBullet("Newborn — failure to pass meconium within 24–48 hours of birth (classic).", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Abdominal distension, bilious vomiting, feeding intolerance.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Older infant / child — chronic constipation, failure to thrive, ribbon-like stools.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Rectal exam — empty rectum with explosive evacuation upon withdrawal.", citationIDs: ["openrn_ms_round5"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Contrast enema — transition zone between narrowed (aganglionic) and dilated (normal) bowel.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Rectal suction biopsy — gold standard; absence of ganglion cells.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Anorectal manometry — failure of internal anal sphincter relaxation.", citationIDs: ["openrn_ms_round5"])
        ],
        priorityAssessments: [
            AttributedBullet("Abdominal exam — distension, bowel sounds, masses; measure abdominal girth.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Hydration and electrolytes — vomiting can cause significant losses.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Watch for enterocolitis — life-threatening; fever, foul stools, distension, sepsis.", citationIDs: ["openrn_ms_round5"])
        ],
        commonInterventions: [
            AttributedBullet("NPO; NG decompression; IV fluids; electrolyte correction.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Saline rectal irrigations per provider until surgery.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Surgical correction — resection of aganglionic segment with pull-through (often staged with temporary colostomy).", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Ostomy teaching for caregivers; long-term continence support.", citationIDs: ["openrn_ms_round5"])
        ],
        watchFor: [
            AttributedBullet("HIRSCHSPRUNG-ASSOCIATED ENTEROCOLITIS — fever, abdominal distension, foul explosive stools, sepsis; emergency.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Post-op — anastomotic leak, stricture, ongoing constipation, fecal incontinence.", citationIDs: ["openrn_ms_round5"])
        ],
        citations: [openrnMSr5, cdcDxR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Intussusception

public enum IntussusceptionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "intussusception",
        title: "Intussusception",
        subtitle: "Telescoping bowel · 6 mo–2 yr · currant-jelly stool",
        nclexTags: pedsGIR5,
        definition: AttributedProse(
            "Telescoping of one segment of intestine into another, leading to obstruction and compromised blood flow. Most commonly involves the ileocecal junction in infants and toddlers (peak 6 months–2 years) per primary source.",
            citationIDs: ["openrn_ms_round5"]
        ),
        pathophysiology: AttributedProse(
            "Proximal bowel telescopes (intussusceptum) into distal bowel (intussuscipiens), drawing mesentery with it. Compromised venous and lymphatic flow → edema and bleeding (currant-jelly stool). Untreated can progress to ischemia, necrosis, perforation, and sepsis.",
            citationIDs: ["openrn_ms_round5"]
        ),
        presentation: [
            AttributedBullet("Episodic, severe, colicky abdominal pain — child often draws knees to chest, screams, then exhausted between episodes.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Vomiting (initially non-bilious, becomes bilious as obstruction worsens).", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("\"Currant-jelly\" stools — late finding of mucus + blood.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Sausage-shaped mass palpable in RUQ.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Lethargy, dehydration, shock if late.", citationIDs: ["openrn_ms_round5"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Ultrasound — \"target\" or \"bull's-eye\" sign (test of choice in children).", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Abdominal radiograph may show obstruction or paucity of gas in RUQ.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Air or contrast enema is BOTH diagnostic and therapeutic in stable patients.", citationIDs: ["openrn_ms_round5"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — shock; abdominal exam — tenderness, distension, peritoneal signs.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Hydration status; type & cross.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Stool — observe for currant-jelly appearance.", citationIDs: ["openrn_ms_round5"])
        ],
        commonInterventions: [
            AttributedBullet("NPO; IV access × 2; fluid resuscitation; NG decompression.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Air or hydrostatic enema reduction by radiology — first line in stable patients (~80–90% successful per primary source).", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Surgical reduction or resection if enema fails, perforation present, or peritonitis.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Post-reduction observation — recurrence rate 5–15%.", citationIDs: ["openrn_ms_round5"])
        ],
        watchFor: [
            AttributedBullet("PERFORATION — sudden severe pain, peritoneal signs, free air on imaging; surgical emergency.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Recurrence after non-operative reduction — usually within 24 hr.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Pathologic lead point — Meckel diverticulum, polyp, lymphoma — more likely in older children; surgical evaluation.", citationIDs: ["openrn_ms_round5"])
        ],
        citations: [openrnMSr5, cdcDxR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pyloric Stenosis

public enum PyloricStenosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pyloric-stenosis",
        title: "Pyloric stenosis (hypertrophic)",
        subtitle: "Projectile vomiting · 3–6 wk-old · olive-shaped mass · alkalosis",
        nclexTags: pedsGIR5,
        definition: AttributedProse(
            "Hypertrophy of the pyloric muscle causes gastric outlet obstruction. Classically presents in firstborn male infants 3–6 weeks of age with progressive non-bilious projectile vomiting per primary source.",
            citationIDs: ["openrn_ms_round5"]
        ),
        pathophysiology: AttributedProse(
            "Progressive thickening of the pyloric circular muscle obstructs gastric emptying. Persistent vomiting of stomach contents (HCl) leads to hypochloremic, hypokalemic metabolic alkalosis with paradoxic aciduria.",
            citationIDs: ["openrn_ms_round5"]
        ),
        presentation: [
            AttributedBullet("Progressive, non-bilious projectile vomiting after feeds; hungry afterward.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Weight loss or failure to gain; dehydration (sunken fontanelle, dry mucous membranes, decreased UOP).", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Olive-shaped mass palpable in RUQ.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Visible peristaltic waves moving left to right across the abdomen after a feed.", citationIDs: ["openrn_ms_round5"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Ultrasound — pyloric muscle thickness ≥3–4 mm and/or length ≥14–16 mm (test of choice).", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Electrolytes — hypochloremic, hypokalemic metabolic alkalosis.", citationIDs: ["openrn_ms_round5"])
        ],
        priorityAssessments: [
            AttributedBullet("Hydration — weigh, fontanelle, mucous membranes, UOP, capillary refill.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Electrolytes — Cl, K, HCO3; correct BEFORE surgery (alkalosis impairs respiratory drive in anesthesia).", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Daily weights, strict I&O.", citationIDs: ["openrn_ms_round5"])
        ],
        commonInterventions: [
            AttributedBullet("NPO; IV access; IV fluids per provider — typically D5 + 0.45% NS with potassium added once UOP established per primary source.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Correct electrolytes and alkalosis BEFORE pyloromyotomy — surgery is not emergent.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Pyloromyotomy (Ramstedt procedure) — laparoscopic standard.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Post-op feeding advanced per protocol; vomiting in first 24 hr is common; full feeds typically by day 1–2.", citationIDs: ["openrn_ms_round5"])
        ],
        watchFor: [
            AttributedBullet("Severe dehydration / shock — late presentation can be life-threatening.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Anesthesia risk if alkalosis uncorrected — surgery delayed until K and HCO3 normalized.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Post-op — incomplete myotomy (continued vomiting), wound infection, mucosal perforation (rare).", citationIDs: ["openrn_ms_round5"])
        ],
        citations: [openrnMSr5, cdcDxR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cleft Lip / Palate

public enum CleftLipPalateSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cleft-lip-palate",
        title: "Cleft lip and palate",
        subtitle: "Congenital orofacial clefts · staged repair · feeding support",
        nclexTags: pedsInfectionR5,
        definition: AttributedProse(
            "Congenital defects resulting from incomplete fusion of the lip (by ~6 weeks gestation) or palate (by ~12 weeks gestation). Can occur together or separately. Affects feeding, hearing (ear infections), speech, and dentition. Multidisciplinary care is standard per primary source.",
            citationIDs: ["openrn_ms_round5"]
        ),
        pathophysiology: AttributedProse(
            "Incomplete fusion of facial processes during embryologic development. Multifactorial inheritance — genetic + environmental factors (maternal smoking, alcohol, certain antiepileptics, folate deficiency).",
            citationIDs: ["openrn_ms_round5"]
        ),
        presentation: [
            AttributedBullet("Visible cleft lip — unilateral or bilateral; with or without palate involvement.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Cleft palate may not be visible externally; assess with gloved finger or visualization.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Difficulty creating suction → feeding challenges.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Otitis media (recurrent) — eustachian tube dysfunction.", citationIDs: ["openrn_ms_round5"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Visualized at birth or on prenatal ultrasound.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Genetics consult to identify syndromic causes (Pierre Robin, 22q11 deletion, Stickler).", citationIDs: ["openrn_ms_round5"])
        ],
        priorityAssessments: [
            AttributedBullet("Feeding — weight gain, latch, fatigue, milk regurgitation through nose.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Hearing — periodic audiology screening due to otitis risk.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Bonding — parents may grieve appearance; provide emotional support and connect to support groups.", citationIDs: ["openrn_ms_round5"])
        ],
        commonInterventions: [
            AttributedBullet("Feeding — specialty bottles (Haberman / Pigeon, Mead Johnson) that compress to deliver milk; upright positioning; frequent burping; smaller more frequent feeds per primary source.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Cleft lip repair typically at ~3 months; cleft palate at 6–18 months (\"Rule of 10s\" — 10 weeks, 10 lb, Hgb 10 g/dL — historical guide).", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Post-op cleft lip — protect suture line: elbow restraints (\"no-no's\"), avoid pacifiers / suction / spoons in mouth, feed with side-of-mouth syringe or gentle bottle, position on back or side per primary source.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Multidisciplinary team — plastic surgery, ENT, audiology, speech therapy, orthodontia, genetics, social work.", citationIDs: ["openrn_ms_round5"])
        ],
        watchFor: [
            AttributedBullet("Aspiration during feeding; failure to thrive.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Recurrent otitis media → conductive hearing loss → speech delay.", citationIDs: ["openrn_ms_round5"]),
            AttributedBullet("Post-op trauma to suture line; infection.", citationIDs: ["openrn_ms_round5"])
        ],
        citations: [openrnMSr5, cdcDxR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - ADHD

public enum ADHDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "adhd",
        title: "Attention-deficit/hyperactivity disorder (ADHD)",
        subtitle: "Inattention · hyperactivity · impulsivity · DSM-5-TR",
        nclexTags: psychR5,
        definition: AttributedProse(
            "Persistent pattern of inattention and/or hyperactivity-impulsivity that interferes with functioning or development. Symptoms must be present in two or more settings (school, home, work) and onset before age 12 per primary source.",
            citationIDs: ["dsm5_round5", "openrn_mh_round5_dx"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial; involves dysregulation of dopamine and norepinephrine in prefrontal cortex affecting executive function, impulse control, and sustained attention. Strong genetic component.",
            citationIDs: ["openrn_mh_round5_dx"]
        ),
        presentation: [
            AttributedBullet("Inattention — careless mistakes, difficulty sustaining attention, doesn't seem to listen, poor organization, loses items, distracted, forgetful.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Hyperactivity — fidgets, can't stay seated, runs/climbs inappropriately, can't engage quietly, talks excessively, \"on the go.\"", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Impulsivity — blurts answers, can't wait turn, interrupts.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Adult presentation — internal restlessness, time-management issues, emotional dysregulation, occupational/relational impairment.", citationIDs: ["openrn_mh_round5_dx"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5-TR — ≥6 inattention OR hyperactivity-impulsivity symptoms (≥5 if ≥17 yr) for ≥6 mo, in ≥2 settings, with functional impairment, onset <12 yr.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Validated rating scales — Vanderbilt (peds), Conners, ASRS (adult).", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Rule out medical (thyroid, sleep apnea, hearing/vision), trauma, anxiety, depression, learning disability.", citationIDs: ["openrn_mh_round5_dx"])
        ],
        priorityAssessments: [
            AttributedBullet("Functional impairment — school grades, work performance, relationships, safety.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Comorbidity screen — anxiety, mood, ODD/CD, learning disability, sleep, substance use (adolescents/adults).", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Cardiac history before stimulant initiation — family history of sudden death, structural cardiac disease.", citationIDs: ["openrn_mh_round5_dx"])
        ],
        commonInterventions: [
            AttributedBullet("Behavioral therapy + parent/teacher training (first-line for preschoolers per AAP per primary source).", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Stimulants (methylphenidate, amphetamine derivatives) — most effective; require Schedule II prescription.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Non-stimulants — atomoxetine, guanfacine ER, clonidine ER for those with stimulant intolerance, tics, anxiety.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("School accommodations — IEP, 504 plan; exercise; structured routines; sleep hygiene.", citationIDs: ["openrn_mh_round5_dx"])
        ],
        watchFor: [
            AttributedBullet("Stimulant adverse effects — appetite suppression, weight loss, growth slowing, insomnia, tics, BP/HR elevation.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Stimulant misuse / diversion — adolescents and college students; secure storage, monitor pill counts.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Untreated ADHD — academic failure, MVCs, substance use, depression — ongoing treatment improves outcomes.", citationIDs: ["openrn_mh_round5_dx"])
        ],
        citations: [dsm5R5, openrnMHr5dx],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Borderline Personality Disorder

public enum BorderlinePDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "borderline-personality-disorder",
        title: "Borderline personality disorder (BPD)",
        subtitle: "Affective + interpersonal instability · self-harm · DBT",
        nclexTags: moodR5,
        definition: AttributedProse(
            "Pervasive pattern of instability in interpersonal relationships, self-image, and affect, with marked impulsivity, beginning by early adulthood per primary source.",
            citationIDs: ["dsm5_round5", "openrn_mh_round5_dx"]
        ),
        pathophysiology: AttributedProse(
            "Biopsychosocial — emotional dysregulation and interpersonal hypersensitivity. Strong association with childhood trauma, neglect, and invalidating environments. Heritability moderate.",
            citationIDs: ["openrn_mh_round5_dx"]
        ),
        presentation: [
            AttributedBullet("Frantic efforts to avoid abandonment.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Pattern of unstable, intense relationships — splitting (idealization / devaluation).", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Identity disturbance — unstable self-image.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Impulsivity — spending, sex, substance use, reckless driving, binge eating.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Recurrent suicidal behavior, gestures, threats, or self-harm.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Affective instability — intense, reactive moods lasting hours.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Chronic feelings of emptiness; intense anger; transient stress-related dissociation or paranoia.", citationIDs: ["dsm5_round5"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5-TR — ≥5 of 9 criteria; long-standing pattern, not better explained by another disorder.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Differential — bipolar (mood episodes typically last days-weeks not hours), PTSD, depression, substance use; comorbidity is the rule.", citationIDs: ["openrn_mh_round5_dx"])
        ],
        priorityAssessments: [
            AttributedBullet("Suicide and self-harm risk — ASK directly at every encounter; safety planning.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Substance use, eating, sleep, current life stressors.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Therapeutic relationship — expect splitting; consistent boundaries across team.", citationIDs: ["openrn_mh_round5_dx"])
        ],
        commonInterventions: [
            AttributedBullet("Dialectical behavior therapy (DBT) — first-line evidence-based; mindfulness, distress tolerance, emotion regulation, interpersonal effectiveness per primary source.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Mentalization-based therapy, schema-focused therapy — alternatives.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Pharmacotherapy — symptom-targeted (e.g., SSRIs for depression/anxiety, mood stabilizers for impulsivity, atypical antipsychotics for psychotic-spectrum sx); no FDA-approved medication for BPD itself per primary source.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Crisis planning — patient-driven safety plan; clear handoff between providers.", citationIDs: ["openrn_mh_round5_dx"])
        ],
        watchFor: [
            AttributedBullet("High suicide rate (~10% lifetime) — ongoing assessment, especially during transitions.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("SPLITTING — staff may be \"all good\" or \"all bad\"; team meetings and consistent limits are protective.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Comorbid PTSD, mood, substance use, eating disorders are common.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Avoid therapeutic nihilism — long-term outcomes are far better than once thought; recovery is realistic.", citationIDs: ["openrn_mh_round5_dx"])
        ],
        citations: [dsm5R5, openrnMHr5dx],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Adjustment Disorder

public enum AdjustmentDisorderSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "adjustment-disorder",
        title: "Adjustment disorder",
        subtitle: "Maladaptive response to identifiable stressor · time-limited",
        nclexTags: moodR5,
        definition: AttributedProse(
            "Emotional or behavioral symptoms in response to an identifiable stressor that develop within 3 months of the stressor and cause clinically significant distress or functional impairment, exceeding what would be expected for the stressor per primary source.",
            citationIDs: ["dsm5_round5", "openrn_mh_round5_dx"]
        ),
        pathophysiology: AttributedProse(
            "Stress-response disorder; individual coping resources are overwhelmed. Symptoms remit once the stressor or its consequences resolve (within 6 months), unless the stressor is chronic.",
            citationIDs: ["openrn_mh_round5_dx"]
        ),
        presentation: [
            AttributedBullet("Subtype: with depressed mood — sadness, hopelessness, tearfulness.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Subtype: with anxiety — worry, nervousness, separation fears.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Subtype: with disturbance of conduct — rule-breaking, fighting, reckless driving.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Subtype: with mixed disturbance of emotions and conduct.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Onset within 3 months of stressor; resolves within 6 months of stressor's end (acute) or persists if chronic stressor (chronic).", citationIDs: ["dsm5_round5"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5-TR — does NOT meet criteria for another mental disorder, not normal bereavement, not exacerbation of preexisting disorder.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Differential — major depression, GAD, PTSD, acute stress disorder, normal grief.", citationIDs: ["openrn_mh_round5_dx"])
        ],
        priorityAssessments: [
            AttributedBullet("Suicide / self-harm risk — adjustment disorder is a known suicide risk factor in adolescents.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Identify the precipitating stressor; assess coping resources, social support.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Substance use as coping; sleep; appetite.", citationIDs: ["openrn_mh_round5_dx"])
        ],
        commonInterventions: [
            AttributedBullet("Psychotherapy — supportive, cognitive-behavioral, problem-solving therapy is first-line per primary source.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Brief medication — sleep aid or short course of SSRI for severe symptoms when indicated, but pharmacotherapy is not first line.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Address the stressor — practical problem-solving, social support, return to baseline routines.", citationIDs: ["openrn_mh_round5_dx"])
        ],
        watchFor: [
            AttributedBullet("Progression to MDD or anxiety disorder if stressor chronic; reassess diagnosis periodically.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Suicide risk in adolescents — short timeline between stressor and suicide attempt is recognized pattern.", citationIDs: ["openrn_mh_round5_dx"])
        ],
        citations: [dsm5R5, openrnMHr5dx],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Stimulant Use Disorder

public enum StimulantUseDisorderSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "stimulant-use-disorder",
        title: "Stimulant use disorder",
        subtitle: "Cocaine / methamphetamine / prescription stimulants",
        nclexTags: psychR5,
        definition: AttributedProse(
            "Problematic pattern of use of a stimulant (cocaine, methamphetamine, amphetamine-type prescription stimulants) leading to clinically significant impairment or distress, with at least 2 of 11 DSM-5-TR criteria over a 12-month period per primary source.",
            citationIDs: ["dsm5_round5", "openrn_mh_round5_dx"]
        ),
        pathophysiology: AttributedProse(
            "Stimulants block reuptake (cocaine) or trigger release (amphetamines) of dopamine, norepinephrine, and serotonin. Chronic use → dopaminergic neuroadaptation, tolerance, withdrawal, and persistent impairments in reward processing and impulse control.",
            citationIDs: ["openrn_mh_round5_dx"]
        ),
        presentation: [
            AttributedBullet("Acute intoxication — euphoria, tachycardia, hypertension, hyperthermia, mydriasis, agitation, paranoia, hallucinations (especially tactile — \"meth bugs\").", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Withdrawal — \"crash\": dysphoria, fatigue, hypersomnia or insomnia, vivid dreams, increased appetite, psychomotor slowing or agitation per primary source.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Chronic — dental decay (\"meth mouth\"), skin lesions from picking, weight loss, malnutrition, cognitive impairment.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Cocaine — nasal septum perforation (intranasal), cardiac complications.", citationIDs: ["openrn_mh_round5_dx"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5-TR — ≥2/11 criteria over 12 months: tolerance, withdrawal, taking more than intended, cravings, role failure, social problems, hazardous use, etc.", citationIDs: ["dsm5_round5"]),
            AttributedBullet("Severity: mild (2–3), moderate (4–5), severe (≥6).", citationIDs: ["dsm5_round5"])
        ],
        priorityAssessments: [
            AttributedBullet("Acute intoxication — vital signs, ECG, mental status, agitation, hyperthermia → ED-level care.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Cardiac — chest pain, ACS in young patients with cocaine use; check troponin.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Suicide risk — high during withdrawal crash.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Co-occurring mental health (depression, ADHD, PTSD), opioid use (combined with stimulants \"speedball\"), nutrition.", citationIDs: ["openrn_mh_round5_dx"])
        ],
        commonInterventions: [
            AttributedBullet("Acute intoxication — benzodiazepines for agitation; cooling for hyperthermia; supportive care; AVOID beta-blockers in acute cocaine intoxication (unopposed alpha) per primary source.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Withdrawal — supportive care; no FDA-approved pharmacotherapy for stimulant use disorder; contingency management has best evidence per primary source.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Behavioral therapy — contingency management, CBT, motivational interviewing, community reinforcement approach.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Treat co-occurring mental health and link to recovery supports, harm-reduction (naloxone for fentanyl-contaminated supply, drug checking).", citationIDs: ["openrn_mh_round5_dx"])
        ],
        watchFor: [
            AttributedBullet("Cardiovascular collapse — hyperadrenergic state; MI, dissection, dysrhythmia, stroke.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Stimulant psychosis — paranoia, agitation, hallucinations; resolves with abstinence but may persist in chronic use.", citationIDs: ["openrn_mh_round5_dx"]),
            AttributedBullet("Fentanyl contamination — counterfeit stimulants increasingly contain fentanyl; naloxone training is essential.", citationIDs: ["cdc_dx_round5"])
        ],
        citations: [dsm5R5, openrnMHr5dx, cdcDxR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Rocky Mountain Spotted Fever

public enum RMSFSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "rocky-mountain-spotted-fever",
        title: "Rocky Mountain spotted fever (RMSF)",
        subtitle: "Rickettsia rickettsii · tick-borne · empirical doxycycline",
        nclexTags: pedsInfectionR5,
        definition: AttributedProse(
            "Tick-borne illness caused by Rickettsia rickettsii. Most commonly reported in the southeastern, southcentral, and central United States despite the name. Untreated mortality is significant; empirical doxycycline at clinical suspicion is standard of care per primary source.",
            citationIDs: ["cdc_dx_round5"]
        ),
        pathophysiology: AttributedProse(
            "R. rickettsii infects vascular endothelial cells → systemic vasculitis → capillary leak, microthrombi, end-organ damage. Transmitted by Dermacentor variabilis (American dog tick) and other ticks.",
            citationIDs: ["cdc_dx_round5"]
        ),
        presentation: [
            AttributedBullet("Sudden fever, headache, myalgia, malaise, GI symptoms — early presentation is non-specific.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Rash typically appears day 2–5: macular → maculopapular → petechial; classically starts on WRISTS and ANKLES, spreads centripetally to trunk, palms, and soles.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("\"Spotless\" RMSF — rash absent or late in 10–15%; do not wait for rash to treat.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Late: AMS, coma, ARDS, AKI, DIC, multi-organ failure.", citationIDs: ["cdc_dx_round5"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical suspicion + tick exposure or endemic area — TREAT EMPIRICALLY; do NOT wait for confirmation per primary source.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Serology (IFA IgG/IgM) — paired acute and convalescent (3–4 weeks apart); single titer often non-diagnostic.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Skin biopsy with IHC; PCR — sensitivity is variable.", citationIDs: ["cdc_dx_round5"])
        ],
        priorityAssessments: [
            AttributedBullet("Tick exposure history — outdoor activity in endemic area, tick attachment.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Vital signs — fever, tachycardia, hypotension; daily skin exam (rash evolution).", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Labs — CBC (thrombocytopenia common), Na (hyponatremia), LFTs, renal function, coagulation.", citationIDs: ["cdc_dx_round5"])
        ],
        commonInterventions: [
            AttributedBullet("DOXYCYCLINE first line at ALL ages including pediatrics per CDC — short courses do NOT cause significant tooth staining per primary source.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Continue doxycycline at least 3 days after defervescence and clinical improvement (typical course 7–14 days).", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Supportive care — fluids, antipyretics, monitor for ARDS / DIC / AKI.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Tick removal — fine-tipped tweezers, grasp close to skin, steady upward pressure; do NOT crush or burn.", citationIDs: ["cdc_dx_round5"])
        ],
        watchFor: [
            AttributedBullet("Severe disease — multi-organ failure; mortality without treatment up to 25%, with prompt treatment <1% per primary source.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Delay = death — most deaths occur when treatment is started >5 days after symptom onset.", citationIDs: ["cdc_dx_round5"]),
            AttributedBullet("Differential — meningococcemia, viral exanthem, Lyme, Ehrlichia, Anaplasma; empirical doxycycline covers most rickettsial / ehrlichial illness.", citationIDs: ["cdc_dx_round5"])
        ],
        citations: [cdcDxR5, openrnMSr5],
        lastSourceFidelityReview: "2026-05-04"
    )
}
