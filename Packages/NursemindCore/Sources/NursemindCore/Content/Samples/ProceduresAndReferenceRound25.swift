import Foundation

// Curator-model procedures + reference (round 25 — pediatric procedures + developmental milestones + safety).

private let openrnPRR25 = CitationSource(
    id: "openrn_pr_round25",
    shortName: "Open RN Pediatrics + Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pediatric/",
    lastRetrieved: "2026-05-13"
)
private let cdcPRR25 = CitationSource(
    id: "cdc_pr_round25",
    shortName: "CDC + AAP + NHTSA pediatric guidance",
    publisher: "CDC · AAP · NHTSA",
    license: .publicDomain,
    url: "https://www.cdc.gov/ncbddd/actearly/index.html",
    lastRetrieved: "2026-05-13"
)
private let specialtyPRR25 = CitationSource(
    id: "specialty_pr_round25",
    shortName: "AAP + AAOS + La Leche + Vaccine Safety concept citations",
    publisher: "AAP · AAOS · La Leche · Vaccine Safety Datalink",
    license: .factCitationOnly,
    url: "https://www.aap.org/en/practice-management/care-delivery-approaches/",
    lastRetrieved: "2026-05-13"
)

private let procTagsR25 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)
private let refTagsR25 = NCLEXTags(
    category: .healthPromotion,
    subcategory: .healthPromotion,
    priorityConcept: .safety
)

public enum PavlikHarnessSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "pavlik-harness",
        title: "Pavlik harness application + monitoring (DDH)",
        subtitle: "DDH treatment age <6 months · 23 hrs/day × 6-12 weeks · positions hips flexed + abducted · ortho supervision · skin care",
        nclexTags: procTagsR25,
        indications: AttributedProse(
            "Developmental dysplasia of the hip (DDH) — Pavlik harness is first-line treatment for infants <6 months; positions hips in flexion + abduction → relocates dislocated / dislocatable hip + maintains position to allow normal acetabular development per primary source.",
            citationIDs: ["specialty_pr_round25"]
        ),
        contraindications: AttributedProse(
            "Age >6 months (less effective; consider closed reduction + spica cast); irreducible dislocation despite harness × 3-4 weeks; non-adherent caregivers; certain neuromuscular disorders limiting tolerance.",
            citationIDs: ["specialty_pr_round25"]
        ),
        equipment: [
            AttributedBullet("Pavlik harness — orthopedic-fitted; sized for infant; chest strap, shoulder straps, anterior + posterior straps, foot stirrups.", citationIDs: ["openrn_pr_round25"]),
            AttributedBullet("Cotton onesie / undershirt under harness — protect skin; counsel that it can be changed without removing harness.", citationIDs: ["openrn_pr_round25"]),
            AttributedBullet("Diaper-changing supplies — diapers go UNDER straps; do NOT remove harness for diaper changes.", citationIDs: ["openrn_pr_round25"]),
            AttributedBullet("Skin care — emollient / barrier cream for skin folds; cotton padding for pressure points if needed.", citationIDs: ["openrn_pr_round25"])
        ],
        preProcedure: [
            AttributedBullet("Confirm DDH diagnosis with imaging (ultrasound or X-ray as appropriate for age).", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Pediatric orthopedist applies + adjusts initial harness per primary source.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Parent education on harness wear, skin care, diaper changes, when to call.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Schedule weekly orthopedic follow-up initially.", citationIDs: ["specialty_pr_round25"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Initial fitting (orthopedist)", body: "Hips positioned in flexion 90-100° + abduction 40-60°; chest strap + shoulder straps secure; anterior straps to maintain hip flexion; posterior straps to allow abduction; foot stirrups support feet.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 2, title: "Wear schedule", body: "23 hours/day × 6-12 weeks initially; ONE hour/day off (under physician supervision) for bathing only; lifelong stricter wear may be needed initially.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 3, title: "Skin care", body: "Cotton onesie under harness; check skin folds + pressure points daily for breakdown; barrier cream PRN; LOOK for redness / blisters / sores; alert orthopedist promptly.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 4, title: "Diaper changes", body: "Do NOT remove harness; diapers go UNDER straps; clean baby + change diaper while in harness; ensure straps are not soiled.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 5, title: "Bathing", body: "1 hour off harness daily for sponge bath OR full bath after orthopedist clears; do NOT submerge harness; dry thoroughly before reapplying.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 6, title: "Carrying + positioning", body: "Carry baby with hips flexed + abducted (M-position carriers compatible); use car seat designed for harness wear OR specialty consultation for car seat fitting.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 7, title: "Follow-up", body: "Weekly orthopedic visits initially; adjustments to harness as baby grows; ultrasound monitoring of hip development.", citationIDs: ["specialty_pr_round25"])
        ],
        postProcedure: [
            AttributedBullet("Document harness application + initial response (Ortolani / Barlow + ultrasound findings).", citationIDs: ["openrn_pr_round25"]),
            AttributedBullet("Parent education materials + 24/7 contact for orthopedist.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Schedule weekly orthopedic follow-up + ultrasound monitoring.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("If harness fails by 3-4 weeks (persistent dislocation) — closed reduction + spica cast under anesthesia.", citationIDs: ["specialty_pr_round25"])
        ],
        documentation: [
            AttributedBullet("Pre-treatment hip exam + imaging findings; harness fit + initial position; parental education provided.", citationIDs: ["openrn_pr_round25"]),
            AttributedBullet("Weekly progress — Ortolani / Barlow + ultrasound; harness adjustments; skin condition.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Skin breakdown + management.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Discontinuation criteria — stable hip, normal ultrasound, ortho clearance.", citationIDs: ["specialty_pr_round25"])
        ],
        watchFor: [
            AttributedBullet("AVASCULAR NECROSIS of femoral head — most concerning Pavlik complication; ~5-15%; lifetime hip dysfunction; vigilant orthopedic monitoring per primary source.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("FEMORAL NERVE PALSY — Pavlik over-flexion of hips; manifests as decreased knee flexion / quadriceps weakness; reversible if recognized + harness adjusted.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("SKIN BREAKDOWN — under straps + skin folds + foot stirrups; daily skin checks; barrier cream; prompt orthopedist contact.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("PERSISTENT DISLOCATION despite Pavlik × 3-4 weeks — failure; closed reduction + spica cast under anesthesia.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("PARENT BURNOUT — caring for harness-wearing baby is challenging; counsel + support; respite resources.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("HARNESS NON-ADHERENCE — counsel importance of 23-hour wear; failure rates higher with non-adherence.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("RE-DISLOCATION after Pavlik discontinuation — close follow-up; some need brace continuation.", citationIDs: ["specialty_pr_round25"])
        ],
        citations: [openrnPRR25, cdcPRR25, specialtyPRR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum FLACCSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "flacc",
        title: "FLACC pain scale + pediatric pain assessment",
        subtitle: "5-item observational scale for non-verbal / pre-verbal children · face / legs / activity / cry / consolability · score 0-10",
        nclexTags: procTagsR25,
        indications: AttributedProse(
            "Pain assessment in non-verbal / pre-verbal children OR cognitively impaired pediatric patients (typically 2 months - 7 years OR developmentally delayed older children). FLACC = Face, Legs, Activity, Cry, Consolability. 0-10 score similar to adult numeric scales per primary source.",
            citationIDs: ["specialty_pr_round25"]
        ),
        contraindications: AttributedProse(
            "Limited usefulness in patients with severe motor disability who cannot demonstrate behaviors; specialized scales (rFLACC, NCCPC-PV) for non-communicating cognitively impaired older children.",
            citationIDs: ["specialty_pr_round25"]
        ),
        equipment: [
            AttributedBullet("FLACC scoring sheet or EHR-integrated tool.", citationIDs: ["openrn_pr_round25"]),
            AttributedBullet("Adequate observation time (minimum 1-3 minutes).", citationIDs: ["openrn_pr_round25"]),
            AttributedBullet("Knowledge of patient baseline behavior.", citationIDs: ["openrn_pr_round25"])
        ],
        preProcedure: [
            AttributedBullet("Observe child in different states (rest + activity + procedure + after intervention).", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Establish baseline behavior with parent / caregiver input.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Rule out other causes of distress (hunger, wet diaper, fear, separation anxiety) before assuming pain.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Combine with parent / caregiver input — they know baseline.", citationIDs: ["specialty_pr_round25"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "F — Face", body: "0 = No particular expression / smiling; 1 = Occasional grimace / frown / withdrawn / disinterested; 2 = Frequent / constant frown, clenched jaw, quivering chin.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 2, title: "L — Legs", body: "0 = Normal position / relaxed; 1 = Uneasy / restless / tense; 2 = Kicking / legs drawn up.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 3, title: "A — Activity", body: "0 = Lying quietly / normal position / moves easily; 1 = Squirming / shifting back-and-forth / tense; 2 = Arched / rigid / jerking.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 4, title: "C — Cry", body: "0 = No cry (awake or asleep); 1 = Moans / whimpers / occasional complaint; 2 = Crying steadily / screams / sobs / frequent complaints.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 5, title: "C — Consolability", body: "0 = Content / relaxed; 1 = Reassured by occasional touching, hugging, talking-to / distractible; 2 = Difficult to console / comfort.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 6, title: "Total score (0-10)", body: "Sum 5 items: 0 = no pain; 1-3 mild pain; 4-6 moderate pain; 7-10 severe pain. Treat moderate-severe pain per primary source.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 7, title: "Reassess after intervention", body: "Pre + post analgesic to assess response; aim for ≤3 (mild) at minimum; document.", citationIDs: ["specialty_pr_round25"])
        ],
        postProcedure: [
            AttributedBullet("Document FLACC score + observed behaviors + setting.", citationIDs: ["openrn_pr_round25"]),
            AttributedBullet("Implement pain management — non-pharm first (positioning, swaddling, distraction, sucrose for infants, parent presence) + analgesics per primary source.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Reassess at expected peak of analgesic; document response.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Coordinate with team + parents on plan.", citationIDs: ["specialty_pr_round25"])
        ],
        documentation: [
            AttributedBullet("Score + individual item descriptions + setting + intervention + reassessment.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Trend scores over time to evaluate response.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Communication with team + family about pain plan + goals.", citationIDs: ["specialty_pr_round25"])
        ],
        watchFor: [
            AttributedBullet("UNDERTREATED PAIN — historically underrecognized + undertreated in children; verify pain assessment + treatment per primary source.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("OPIOID side effects — start low + titrate; respiratory depression risk; co-sleep with infant on opioids in NICU; constipation prophylaxis.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("OTHER pediatric pain scales — Wong-Baker FACES (3-7+ years for self-report); Numeric Rating Scale (>8 years self-report); CRIES (newborn 0-32 weeks); NIPS (newborn).", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("rFLACC (revised) — for cognitively impaired children; modified FLACC + adds individualized behaviors.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("PARENT / CAREGIVER input — invaluable; they know baseline; integrate into assessment.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("PROCEDURAL pain — pre-medicate with topical lidocaine, sucrose for infants, EMLA, vapocoolant; positioning + parent presence; counsel children appropriately.", citationIDs: ["specialty_pr_round25"])
        ],
        citations: [openrnPRR25, cdcPRR25, specialtyPRR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum VaccineHesitancyCounselingSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "vaccine-hesitancy-counseling",
        title: "Vaccine hesitancy counseling (motivational interviewing)",
        subtitle: "PRESUMPTIVE recommendation > open question · address specific concerns · do not dismiss · trust + relationship · multiple visits often",
        nclexTags: procTagsR25,
        indications: AttributedProse(
            "All pediatric well visits + vaccination opportunities; particularly important for vaccine-hesitant families. Vaccine hesitancy is WHO top 10 global health threat. Counseling approach affects vaccination rates per primary source.",
            citationIDs: ["specialty_pr_round25"]
        ),
        contraindications: AttributedProse(
            "None — counseling is essential. Approach varies per individual + family + cultural context.",
            citationIDs: ["specialty_pr_round25"]
        ),
        equipment: [
            AttributedBullet("Time + privacy for unhurried discussion.", citationIDs: ["openrn_pr_round25"]),
            AttributedBullet("Vaccine information statements (VIS); CDC + AAP educational materials.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Reliable resources — CDC, AAP, WHO; counter-misinformation websites (vaccinateyourfamily.org, voicesforvaccines.org).", citationIDs: ["specialty_pr_round25"])
        ],
        preProcedure: [
            AttributedBullet("Identify vaccine hesitancy spectrum — refusing all (~1%), selective / delayed (~10-15%), accepting with concerns (~50%), enthusiastic (~30%).", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Establish trust + therapeutic relationship.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Listen to specific concerns (NOT generic).", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Cultural + religious sensitivity.", citationIDs: ["specialty_pr_round25"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "PRESUMPTIVE recommendation", body: "Use directive language — \"Your child needs MMR + DTaP + chickenpox today\" — vs \"What do you want to do about vaccines?\" Increases vaccination rates significantly per primary source.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 2, title: "Acknowledge concerns", body: "If parent expresses hesitation — \"I hear that you have concerns. Tell me more about what's worrying you.\" Listen + validate before responding.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 3, title: "Address specific concerns", body: "Common concerns — autism (refuted by extensive evidence), adjuvants / preservatives (safety established), too-many-too-soon (immune system handles many antigens daily), natural immunity (disease risks > vaccine risks), conspiracy (acknowledge mistrust + share evidence). Tailor response to specific concern.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 4, title: "Use motivational interviewing", body: "Open-ended questions, affirmations, reflective listening, summarize. Build patient autonomy + self-determination toward decision.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 5, title: "Share evidence + your recommendation", body: "Cite trusted sources — CDC, AAP, WHO. Share your professional recommendation clearly: \"I recommend vaccinating today because...\".", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 6, title: "Address misinformation specifically", body: "Wakefield 1998 study on autism — RETRACTED; multiple large studies (>1 million children) show no link. Thimerosal removed from childhood vaccines (except some flu); never linked to autism. Aluminum adjuvants — minute amounts; safe history; required for some vaccine immune response.", citationIDs: ["specialty_pr_round25"]),
            ProcedureStep(number: 7, title: "Document + revisit", body: "Document refusal; do NOT dismiss patient (AAP guidance — maintain relationship for future opportunities); offer to revisit at every visit.", citationIDs: ["specialty_pr_round25"])
        ],
        postProcedure: [
            AttributedBullet("Document discussion + parental decision + plan for follow-up.", citationIDs: ["openrn_pr_round25"]),
            AttributedBullet("Provide written materials (VIS, AAP refusal-to-vaccinate document, condition-specific resources).", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("Schedule follow-up visit specifically to revisit vaccination discussion.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("If continued refusal — document; do NOT dismiss patient; AAP recommends maintaining relationship; counsel risks; reaffirm at every visit.", citationIDs: ["specialty_pr_round25"])
        ],
        documentation: [
            AttributedBullet("Specific concerns expressed; counseling provided; parental decision; follow-up plan.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("AAP \"Refusal to Vaccinate\" form — documents informed refusal + risks.", citationIDs: ["specialty_pr_round25"])
        ],
        watchFor: [
            AttributedBullet("VACCINE-PREVENTABLE DISEASE in unvaccinated child — measles, pertussis, varicella, meningococcus; hospitalization + death possible; vigilance.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("CLUSTER outbreaks in undervaccinated communities — increasing measles + pertussis outbreaks linked to vaccine hesitancy per CDC per primary source.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("OPEN DISCUSSION more effective than dismissal — many vaccine-hesitant parents change their minds over multiple visits.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("PROVIDER ATTITUDE matters — physician strong recommendation is the SINGLE MOST IMPORTANT FACTOR in vaccination decisions.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("CULTURAL + religious sensitivity — exemptions vary by state; engage cultural / religious leaders for community-level discussions.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("MEDICAL contraindications — anaphylaxis, severe immunocompromise (live vaccines), ENCEPHALOPATHY post-DTaP — TRUE contraindications few; address misconceptions about contraindications.", citationIDs: ["specialty_pr_round25"]),
            AttributedBullet("EQUITY + access — sometimes hesitancy is access (transportation, time off work) not philosophical; address barriers.", citationIDs: ["specialty_pr_round25"])
        ],
        citations: [openrnPRR25, cdcPRR25, specialtyPRR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CDCMilestonesSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "cdc-milestone-checklist",
        title: "CDC developmental milestones (Learn the Signs. Act Early.)",
        subtitle: "75th percentile thresholds (NEW 2022) · 2 mo - 5 yr · Act Early if missed milestones · ASQ + standardized screening at well visits",
        eyebrow: "REFERENCE · PEDIATRICS",
        nclexTags: refTagsR25,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "CDC + AAP \"Learn the Signs. Act Early.\" program. Updated 2022 milestones reflect 75th percentile (vs older 50th percentile) — children should reach milestones by these ages; missing them warrants developmental screening + early intervention referral. CRITICAL — early identification of autism + developmental delay → better outcomes per primary source.",
                citationIDs: ["specialty_pr_round25"]
            )),
            .keyValueTable(title: "Key motor + social milestones (75th percentile, CDC 2022)", [
                KeyValueRow(key: "2 months", value: "Smiles socially; calms when comforted; lifts head briefly; coos / makes sounds"),
                KeyValueRow(key: "4 months", value: "Reaches for + brings hands to mouth; coos / babbles; pushes up on arms; rolls tummy to back"),
                KeyValueRow(key: "6 months", value: "Sits without support (with hand prop); babbles; recognizes familiar faces; passes objects hand-to-hand"),
                KeyValueRow(key: "9 months", value: "Sits without support; pulls to stand; says \"mama\" / \"dada\" non-specifically; pincer grasp emerging; stranger anxiety"),
                KeyValueRow(key: "12 months", value: "Pulls to stand + cruises; first words; waves bye-bye; understands no; pincer grasp; drinks from cup"),
                KeyValueRow(key: "15 months", value: "Walks well; says 1-3 words; follows simple instructions; uses spoon / cup; points to objects"),
                KeyValueRow(key: "18 months", value: "Walks well; says ≥3 words; copies activities; scribbles; pretend play emerging; runs"),
                KeyValueRow(key: "2 years", value: "Says 2-word sentences; walks up stairs holding rail; kicks ball; follows 2-step instructions; runs; identifies body parts"),
                KeyValueRow(key: "3 years", value: "Speaks in 3-word sentences; understandable to strangers; copies circle; pedals tricycle; jumps; toilet trains"),
                KeyValueRow(key: "4 years", value: "Tells stories; understands time concepts; balances on one foot; counts to 10; cooperative play"),
                KeyValueRow(key: "5 years", value: "Speaks fluently; counts ≥10 objects; copies triangle; ties shoes (with help); understands rules of games")
            ]),
            .bullets(title: "RED FLAGS by age — Act Early", [
                AttributedBullet("2 months — no smile, no cooing, no eye contact, no response to loud sounds.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("4 months — doesn't bring objects to mouth; doesn't push up on arms; doesn't smile / coo.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("6 months — doesn't reach for objects; doesn't show affection; doesn't laugh; doesn't roll over.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("9 months — doesn't bear weight on legs with support; doesn't sit; doesn't babble; doesn't recognize familiar people.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("12 months — doesn't crawl; doesn't pull to stand; doesn't say single words; doesn't wave bye-bye / point.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("18 months — doesn't walk; doesn't speak ≥6 words; doesn't notice / care when caregiver leaves / returns.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("2 years — doesn't use 2-word phrases; doesn't follow simple instructions; doesn't walk steadily; LOSS of skills previously had.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("3 years — drools or has unclear speech; doesn't speak in sentences; doesn't make eye contact; loses skills.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("ANY age — LOSS OF previously acquired skills (regression) — particularly concerning for autism, neurodegenerative, child abuse / neglect.", citationIDs: ["specialty_pr_round25"])
            ]),
            .bullets(title: "Standardized screening at well visits", [
                AttributedBullet("ASQ-3 (Ages + Stages Questionnaire 3rd edition) — at 9, 18, 30 months per AAP per primary source.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("M-CHAT-R (Modified Checklist for Autism in Toddlers, Revised) — at 18 + 24 months for autism screening.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("PEDS / SWYC — alternative screening tools.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("Concern at any age → referral to early intervention (Birth-3) OR school district (3+).", citationIDs: ["specialty_pr_round25"])
            ]),
            .bullets(title: "Early intervention referral", [
                AttributedBullet("Birth-3 services — federal IDEA Part C; eligibility based on developmental delay + diagnosis; multidisciplinary (PT, OT, SLP, special education).", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("3+ years — IDEA Part B; school district preschool special education program.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("Referral does NOT require physician approval but should be coordinated with PCP + family.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("Earlier intervention = better outcomes; do NOT \"wait and see\" with significant delays.", citationIDs: ["specialty_pr_round25"])
            ]),
            .bullets(title: "Common conditions identified through screening", [
                AttributedBullet("AUTISM SPECTRUM DISORDER — language + social + repetitive behaviors; M-CHAT screening; multidisciplinary diagnosis; ABA + speech + occupational therapy.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("INTELLECTUAL DISABILITY — global delays; karyotype + microarray; multidisciplinary care.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("LANGUAGE DELAY — receptive + expressive evaluation by SLP; address hearing loss (audiology); 1:1 vs group services.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("MOTOR DELAY — PT evaluation; address neurologic causes (cerebral palsy, muscular dystrophy, spinal cord); orthotics if needed.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("ADHD — typically identified later (school age); behavioral + medication management.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("HEARING LOSS — congenital or acquired; OAE + audiology; hearing aids + early intervention.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("FETAL ALCOHOL SPECTRUM DISORDER — FAS criteria; learning + behavioral support.", citationIDs: ["specialty_pr_round25"])
            ])
        ],
        citations: [openrnPRR25, cdcPRR25, specialtyPRR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CarSeatSafetySample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "car-seat-safety",
        title: "Car seat + child passenger safety (CPS)",
        subtitle: "REAR-FACING ≥2 yrs · forward-facing 5-point harness · booster until ~10-12 yrs / 4'9\" · NEVER front seat with airbag <13 yrs · NHTSA + AAP",
        eyebrow: "REFERENCE · PEDIATRIC SAFETY",
        nclexTags: refTagsR25,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Motor vehicle crashes are leading cause of death in children. Proper child passenger safety (CPS) — appropriate car seat for age + size + correct installation + use — reduces fatal injury by 70%+ in infants + 54% in toddlers per primary source. AAP 2018 update + NHTSA guidance.",
                citationIDs: ["specialty_pr_round25"]
            )),
            .keyValueTable(title: "Stage 1 — REAR-FACING (birth - 2 years minimum, ideally longer)", [
                KeyValueRow(key: "Age", value: "Birth to 2 years AT MINIMUM (preferably until weight / height limit of seat — 35-40 lbs typical convertible)"),
                KeyValueRow(key: "Type", value: "Infant-only (rear-facing only) OR convertible (rear-facing initially)"),
                KeyValueRow(key: "Recline", value: "Newborn ~45° angle; older infant slightly more upright per seat instructions"),
                KeyValueRow(key: "Harness", value: "5-point harness; straps at OR BELOW shoulders; chest clip at armpit level; snug enough that you cannot pinch a fold"),
                KeyValueRow(key: "Position", value: "BACK SEAT ONLY; rear-facing; never in front seat with active airbag"),
                KeyValueRow(key: "Why rear-facing?", value: "Distributes crash forces over child's whole body; protects head + neck; 4× safer than forward-facing in 1-2 year-olds")
            ]),
            .keyValueTable(title: "Stage 2 — FORWARD-FACING (5-point harness, ~2-5 years)", [
                KeyValueRow(key: "Age", value: "When child outgrows rear-facing seat by weight or height; AAP recommends as long as possible until weight / height limit of forward-facing seat (typically 40-65 lbs)"),
                KeyValueRow(key: "Harness", value: "5-point harness; straps at OR ABOVE shoulders; chest clip at armpit level; snug"),
                KeyValueRow(key: "Position", value: "BACK SEAT ONLY")
            ]),
            .keyValueTable(title: "Stage 3 — BOOSTER (~5-12 years; until 4'9\")", [
                KeyValueRow(key: "Age", value: "When child outgrows forward-facing seat by weight or height; until ADULT seatbelt fits properly (~4'9\" / 10-12 years)"),
                KeyValueRow(key: "Type", value: "High-back booster (better for vehicles without head restraints) OR backless booster (acceptable with head restraint)"),
                KeyValueRow(key: "Seat belt fit", value: "Lap belt low across upper thighs (not stomach); shoulder belt across chest + collarbone (not neck or face); back fully against booster")
            ]),
            .keyValueTable(title: "Stage 4 — ADULT SEAT BELT", [
                KeyValueRow(key: "Age", value: "Typically 10-12 years AND ≥4'9\" / 145 cm (5-step test)"),
                KeyValueRow(key: "5-step test", value: "1. Back fully against vehicle seat. 2. Knees bend comfortably at edge. 3. Lap belt low across upper thighs. 4. Shoulder belt across chest + collarbone (not neck). 5. Child can stay in this position for ENTIRE trip"),
                KeyValueRow(key: "Front seat", value: "BACK SEAT recommended until age 13; airbag injury risk particularly to younger children")
            ]),
            .bullets(title: "Common installation errors", [
                AttributedBullet("INSTALLATION too loose — should not move >1 inch front-to-back at base.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("HARNESS too loose — should not be able to pinch a vertical fold of strap material at shoulder.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("CHEST CLIP too low — should be at ARMPIT level, not stomach (which can cause organ injury in crash).", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("WRONG seat for age / size — using forward-facing too early (before 2 years), using booster before child has outgrown forward-facing.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("BULKY clothing under harness — winter coats compress in crash → harness becomes loose. Remove coat OR coat over harness OR thin layer underneath.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("AFTERMARKET ACCESSORIES — head positioners, strap covers, infant inserts not approved by manufacturer can interfere with safety.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("NEVER FRONT SEAT with active airbag — children <13 years; airbag deployment can severely injure or kill.", citationIDs: ["specialty_pr_round25"])
            ]),
            .bullets(title: "Special situations", [
                AttributedBullet("PREMATURE infants — car seat challenge before discharge; HOB at 30-45° to assess for desaturation; specialized car bed if cannot tolerate seat per primary source.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("MEDICAL conditions — spica casts, body braces, hip dysplasia (Pavlik harness) — specialty CPS technician for fitting; specialty seats available.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("ROADSIDE EMERGENCIES — child in car seat; secure correctly; do NOT remove unless absolutely necessary.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("AFTER A CRASH — moderate-severe crash → REPLACE car seat (per NHTSA + manufacturer); minor crash usually OK.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("EXPIRATION — car seats expire 6-10 years from manufacture date; do NOT use expired seats.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("USED car seats — only if known history (not in crash, no recalls, not expired); generally avoid hand-me-down without verification.", citationIDs: ["specialty_pr_round25"])
            ]),
            .bullets(title: "Resources for families", [
                AttributedBullet("CERTIFIED CHILD PASSENGER SAFETY TECHNICIAN (CPST) — find at safekids.org or nhtsa.gov; install + check car seats; many offer free service.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("NHTSA car seat inspection events — local + free.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("LOW-INCOME programs — many states + nonprofits provide free / low-cost car seats.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("CAR SEAT REGISTRATION — register with manufacturer for recall notifications.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("EDUCATION at well visits + before discharge home; counsel families on stage transitions.", citationIDs: ["specialty_pr_round25"])
            ])
        ],
        citations: [openrnPRR25, cdcPRR25, specialtyPRR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BreastfeedingCounselingSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "breastfeeding-counseling",
        title: "Breastfeeding counseling + lactation support",
        subtitle: "AAP exclusive 6 months · feeding cues · LATCH · supplementation indications · maternal medications · jaundice + dehydration",
        eyebrow: "REFERENCE · PEDIATRICS / OB",
        nclexTags: refTagsR25,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "American Academy of Pediatrics (AAP) recommends EXCLUSIVE BREASTFEEDING for first 6 months + continuation with complementary foods through ≥1 year + as long as mutually desired. Breastfeeding has substantial maternal + infant health benefits; lactation support reduces early discontinuation per primary source.",
                citationIDs: ["specialty_pr_round25"]
            )),
            .bullets(title: "Benefits of breastfeeding", [
                AttributedBullet("INFANT — reduced risk of acute infections (otitis media, RSV, GI infections, pneumonia), SIDS, atopic disease, T1DM, T2DM, obesity, leukemia.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("MATERNAL — reduced postpartum hemorrhage, faster return to pre-pregnancy weight, reduced breast + ovarian + endometrial cancer, reduced T2DM + cardiovascular disease, delayed return of menses (LAM contraception when criteria met).", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("ECONOMIC + ENVIRONMENTAL — no formula cost, less waste, convenient.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("BONDING + maternal mental health — neurochemical effects of oxytocin / prolactin.", citationIDs: ["specialty_pr_round25"])
            ]),
            .bullets(title: "Successful initiation", [
                AttributedBullet("SKIN-TO-SKIN within 1 hour of birth — promotes initiation + reduces hypoglycemia + thermoregulation.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("Help with first feeding — proper latch, positioning (cradle, cross-cradle, football, side-lying).", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("FEED ON DEMAND — 8-12 times in 24 hours initially; recognize EARLY hunger cues (rooting, sucking on hands, restlessness) before crying.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("LATCH assessment — wide-open mouth, lower lip flanged out, chin touching breast, more areola visible above than below; AUDIBLE swallowing; nipple should NOT be flat / lipstick-shaped after.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("LATCH score (0-10) — Latch, Audible swallowing, Type of nipple, Comfort, Hold/Help; objective assessment.", citationIDs: ["specialty_pr_round25"])
            ]),
            .bullets(title: "Adequate intake markers (newborn)", [
                AttributedBullet("WET DIAPERS — by day 5-7, ≥6 wet diapers per 24 hours.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("STOOLS — meconium → transitional → yellow seedy by day 4-5; ≥3-4 stools per 24 hours.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("WEIGHT — initial loss up to 7-10% of birth weight is normal (more is concerning); regain birth weight by 10-14 days; gain 4-7 oz / week thereafter.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("FEEDING duration — varies; usually 10-30 min per breast; let baby finish first breast before offering second.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("CONTENT after feeding — relaxed, satisfied, sleeps 1-3 hours.", citationIDs: ["specialty_pr_round25"])
            ]),
            .bullets(title: "Common challenges + interventions", [
                AttributedBullet("SORE NIPPLES — usually poor latch; lactation consultant to assess + correct; lanolin / hydrogel pads for comfort.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("ENGORGEMENT — typically days 3-5; cool compresses between feedings, warm compresses before; NSAIDs; breast pumping if uncomfortable.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("MASTITIS — fever, breast pain, redness; CONTINUE breastfeeding from affected side (helps clear); cephalexin / dicloxacillin; warm compresses; rest.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("INSUFFICIENT MILK SUPPLY — most concern is perception, not actual; verify with diaper / weight; lactation consultant; galactagogues (fenugreek limited evidence; metoclopramide / domperidone selective).", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("OVERSUPPLY — block feeding (one side per session); ensure complete drainage; lactation consult.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("INVERTED / FLAT nipples — Niplette, breast shells, breast pump pre-feeding; lactation consultant.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("RETURNING TO WORK — pumping schedule, storage guidelines, return-to-work counseling, employer breastfeeding accommodations (federal mandate).", citationIDs: ["specialty_pr_round25"])
            ]),
            .bullets(title: "Supplementation indications", [
                AttributedBullet("EXCESSIVE WEIGHT LOSS (>7-10%); inadequate output; PERSISTENT hypoglycemia; severe hyperbilirubinemia interfering with feeding.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("Maternal contraindication — HIV, HSV active lesion on breast, active untreated TB, brucellosis, certain medications, illicit drug use, certain chemotherapy / radioactive isotopes.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("FORMULA supplementation should be done thoughtfully + lactation consult to optimize breastfeeding; expressed breast milk preferred when possible.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("Avoid early formula supplementation (without indication) — can interfere with breastfeeding establishment.", citationIDs: ["specialty_pr_round25"])
            ]),
            .bullets(title: "Maternal medications", [
                AttributedBullet("Most medications COMPATIBLE with breastfeeding — CDC + LactMed databases; counsel about specific meds.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("Compatible — most antibiotics, NSAIDs, antihistamines, SSRIs (sertraline preferred), thyroid meds, insulin, most antihypertensives.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("CAUTION / contraindicated — chemotherapy, radioactive isotopes, certain anti-epileptics (phenobarbital, primidone), illicit drugs, alcohol (limit), nicotine, codeine (CYP2D6 ultra-rapid metabolizers), some antipsychotics, marijuana.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("VACCINES — most safe (live + inactivated); MMR + varicella for at-risk mothers if indicated.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("ALCOHOL — wait 2-3 hours per drink before feeding; \"pump and dump\" only for comfort if engorgement.", citationIDs: ["specialty_pr_round25"])
            ]),
            .bullets(title: "Resources + support", [
                AttributedBullet("LACTATION CONSULTANT (IBCLC) referral for any feeding concerns; many hospitals + outpatient.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("LA LECHE LEAGUE — peer support groups; international.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("WIC — supplemental nutrition + lactation support for low-income families.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("Hospital BABY-FRIENDLY designation — evidence-based breastfeeding promotion.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("FAMILY + cultural support — partner involvement, extended family education, cultural sensitivity.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("Federal workplace lactation rights — break time + private space (NOT bathroom) for pumping.", citationIDs: ["specialty_pr_round25"])
            ])
        ],
        citations: [openrnPRR25, cdcPRR25, specialtyPRR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PediatricPainScalesSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "pediatric-pain-scales",
        title: "Pediatric pain assessment scales (by age)",
        subtitle: "FLACC for non-verbal · Wong-Baker FACES for 3-7 yrs · NRS / VAS for ≥8 yrs · CRIES for newborns · NIPS for premature · pain is 5th vital sign",
        eyebrow: "REFERENCE · PEDIATRICS",
        nclexTags: refTagsR25,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Pediatric pain has been historically undertreated due to communication challenges + adult-centric assessment tools. Multiple validated pain scales by age + cognitive status — choose appropriate tool. Self-report when possible; observational when not. Pain is 5th vital sign; addressed at every encounter per primary source.",
                citationIDs: ["specialty_pr_round25"]
            )),
            .keyValueTable(title: "Age-appropriate pain scales", [
                KeyValueRow(key: "PRETERM (24-32 weeks)", value: "PIPP (Premature Infant Pain Profile) — gestational age, behavioral state, oxygen saturation, heart rate, brow bulge, eye squeeze, nasolabial furrow"),
                KeyValueRow(key: "TERM newborn (0-1 month)", value: "NIPS (Neonatal Infant Pain Scale) — facial expression, cry, breathing, arms, legs, state of arousal; 0-7 score; OR CRIES (Crying, Requires O2, Increased vital signs, Expression, Sleep)"),
                KeyValueRow(key: "Infant - young child (2 mo - 7 yr / non-verbal)", value: "FLACC — Face, Legs, Activity, Cry, Consolability; 0-10; observational"),
                KeyValueRow(key: "Preschool - school-age (3-7 yr)", value: "Wong-Baker FACES Pain Rating Scale — 6 cartoon faces from no pain to worst pain; child points; self-report"),
                KeyValueRow(key: "School age + (≥8 yr)", value: "Numeric Rating Scale (NRS) 0-10 OR Visual Analog Scale (VAS) 0-100mm line — adult-style self-report"),
                KeyValueRow(key: "Cognitively impaired", value: "rFLACC (revised FLACC) — individualized behaviors added to standard FLACC; OR NCCPC-PV (Non-Communicating Children's Pain Checklist - Postoperative)")
            ]),
            .bullets(title: "Wong-Baker FACES — practical use", [
                AttributedBullet("6 cartoon faces representing 0 (no hurt) to 10 (hurts worst); explain to child; ask which face shows how much they hurt.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("Useful from age 3-7 years; some older children prefer this over NRS.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("Cultural + language adaptable.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("Some controversy about happy / sad faces conflating mood with pain — alternative \"Faces Pain Scale-Revised\" (FPS-R) uses neutral faces for purer pain assessment.", citationIDs: ["specialty_pr_round25"])
            ]),
            .bullets(title: "Non-pharmacologic pain management", [
                AttributedBullet("INFANT — swaddling, sucking on pacifier, sucrose 24% solution (effective for procedural pain; 1-2 mL on tongue 2 min before procedure), skin-to-skin / kangaroo care, breastfeeding during procedure.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("CHILD — distraction (toys, videos, conversation, music, games), parent presence, comfort positioning (sitting up vs lying), mock procedure / procedure preparation, age-appropriate explanation.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("PROCEDURAL — topical lidocaine (LMX, EMLA — ~30 min onset), vapocoolant spray (immediate), buzzy bee + ice (immediate), positioning (lap holds for vaccines), parent comfort holds.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("CHRONIC — CBT, mindfulness, biofeedback, PT, yoga, school-based interventions, mental health support.", citationIDs: ["specialty_pr_round25"])
            ]),
            .bullets(title: "Pharmacologic pain management", [
                AttributedBullet("ACETAMINOPHEN — 10-15 mg/kg PO/PR q4-6h; max 75 mg/kg/day (4 g/day adult); first-line for mild-moderate pain.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("IBUPROFEN — 5-10 mg/kg PO q6-8h; ≥6 months; max 40 mg/kg/day; mild-moderate pain + anti-inflammatory.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("KETOROLAC — 0.5 mg/kg IV q6h; postoperative; max 5 days; renal precautions.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("MORPHINE — 0.05-0.1 mg/kg IV q4h; opioid for moderate-severe pain; PCA for older children.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("FENTANYL — 1-2 mcg/kg IV q1-2h; rapid onset / offset; procedural sedation + analgesia.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("HYDROMORPHONE — 0.015-0.02 mg/kg IV q3-4h; alternative to morphine.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("AVOID CODEINE in children — variable CYP2D6 metabolism + pediatric deaths from ultra-rapid metabolizers; FDA boxed warning.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("AVOID TRAMADOL in children <12 years; FDA boxed warning per primary source.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("REGIONAL ANESTHESIA — caudal blocks, peripheral nerve blocks for surgical pain; reduce systemic opioid needs.", citationIDs: ["specialty_pr_round25"])
            ]),
            .bullets(title: "Special considerations", [
                AttributedBullet("CHRONIC PAIN — JIA, sickle cell crisis, cancer pain, post-surgical chronic pain; multidisciplinary; pediatric pain specialty.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("PAIN IN CRITICALLY ILL — COMFORT-B scale; sedation + analgesia balance; minimize iatrogenic pain.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("PROCEDURAL pain — pre-medicate even for \"minor\" procedures; vaccines, blood draws, IV starts; non-pharm + topical anesthetic + sucrose for infants.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("OPIOID side effects — respiratory depression risk lower with adequate monitoring; constipation prophylaxis; nausea / vomiting; stop after acute pain resolves to avoid dependence.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("PARENT / family involvement — central; presence reduces pain perception; parent-controlled analgesia in selected.", citationIDs: ["specialty_pr_round25"]),
                AttributedBullet("CULTURAL + developmental sensitivity — pain expression varies by culture; assess in age-appropriate way.", citationIDs: ["specialty_pr_round25"])
            ])
        ],
        citations: [openrnPRR25, cdcPRR25, specialtyPRR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}
