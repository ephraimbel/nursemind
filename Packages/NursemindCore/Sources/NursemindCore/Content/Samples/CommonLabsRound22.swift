import Foundation

// Curator-model lab entries (round 22 — ENT / derm / allergy diagnostics).

private let openrnLabsR22 = CitationSource(
    id: "openrn_labs_round22",
    shortName: "Open RN Health Alterations + Pediatrics",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-12"
)
private let cdcLabsR22 = CitationSource(
    id: "cdc_labs_round22",
    shortName: "CDC + AAP guidance on rapid strep + cultures",
    publisher: "CDC · AAP",
    license: .publicDomain,
    url: "https://www.cdc.gov/groupastrep/diseases-hcp/strep-throat.html",
    lastRetrieved: "2026-05-12"
)
private let specialtyLabsR22 = CitationSource(
    id: "specialty_labs_round22",
    shortName: "IDSA + AAD + AAAAI / WAO concept citations",
    publisher: "IDSA · AAD · AAAAI · WAO",
    license: .factCitationOnly,
    url: "https://www.aaaai.org/practice-resources/practice-tools",
    lastRetrieved: "2026-05-12"
)

private let labsTagsR22 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .infection
)

public enum RapidStrepSample {
    public static let entry: LabEntry = LabEntry(
        id: "rapid-strep-test",
        title: "Rapid antigen detection test (RADT) + throat culture",
        subtitle: "GAS pharyngitis · Centor ≥3 for testing · RADT-neg → culture in children · 24-48h treatment to prevent rheumatic fever",
        specimen: "Throat swab (tonsils + posterior pharynx); avoid uvula / palate / oral cavity contamination",
        nclexTags: labsTagsR22,
        referenceRanges: [
            ReferenceRangeRow(value: "Negative RADT", label: "GAS not detected — culture if children/adolescents per IDSA per primary source", citationIDs: ["specialty_labs_round22"]),
            ReferenceRangeRow(value: "Positive RADT", label: "GAS detected — treat with penicillin / amoxicillin × 10 days", citationIDs: ["specialty_labs_round22"]),
            ReferenceRangeRow(value: "Throat culture positive", label: "Confirmed GAS — treat per primary source", citationIDs: ["specialty_labs_round22"]),
            ReferenceRangeRow(value: "Throat culture negative + symptoms", label: "Viral pharyngitis most likely; consider EBV (Monospot), GC, mycoplasma", citationIDs: ["specialty_labs_round22"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative — viral pharyngitis likely",
                summary: "No GAS detected. Most pharyngitis is viral — supportive care + symptomatic treatment; antibiotics NOT indicated for viral causes. Consider EBV (mono), GC (sexual hx), mycoplasma (atypical pneumonia) if atypical presentation per primary source.",
                nursingActions: [
                    "Supportive care — acetaminophen, ibuprofen, salt-water gargle, lozenges, hydration, rest.",
                    "Counsel viral course (5-7 days typical).",
                    "Workup atypical or persistent — Monospot, GC swab, atypical pneumonia testing.",
                    "Return to school / work when afebrile + feeling well."
                ],
                citationIDs: ["specialty_labs_round22"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Positive — treat GAS",
                summary: "Confirmed GAS infection. Penicillin V 500 mg PO BID-TID × 10 days OR amoxicillin 500 mg PO BID × 10 days. Treatment prevents acute rheumatic fever (not post-strep glomerulonephritis) + reduces transmission + symptom duration per primary source.",
                nursingActions: [
                    "Initiate antibiotic; document allergies.",
                    "Counsel COMPLETE 10-day course even if feeling better.",
                    "Return to school / work 24 hrs after starting effective antibiotic + afebrile.",
                    "Counsel partner / household — close contacts may need testing if symptomatic.",
                    "Watch for ARF symptoms (1-5 weeks later) — fever, joint pain, chorea, rash — though treatment prevents most cases.",
                    "PSGN signs (1-3 weeks later) — hematuria, edema, HTN — treatment does NOT prevent."
                ],
                citationIDs: ["specialty_labs_round22"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Indications to test",
                causes: ["Centor / McIsaac score ≥3", "Fever ≥38°C, tonsillar exudate, tender anterior cervical LAD, absent cough", "Outbreak", "Household contact of confirmed GAS", "Pediatric (lower threshold)"],
                citationIDs: ["specialty_labs_round22"]
            ),
            CauseGroup(
                title: "Reasons NOT to test",
                causes: ["Centor <2 (low GAS probability — symptomatic care only)", "Clear viral features (cough, rhinorrhea, conjunctivitis, oral ulcers, hoarseness)", "<3 years (GAS rare, rheumatic fever rare; routine testing not recommended)"],
                citationIDs: ["specialty_labs_round22"]
            )
        ],
        nursingActions: [
            AttributedBullet("PROPER SWAB technique — vigorous swab of BOTH tonsillar pillars + posterior pharynx; avoid touching uvula / cheek (contamination).", citationIDs: ["openrn_labs_round22"]),
            AttributedBullet("RADT sensitivity 70-90%; specificity 95%; results 5-10 min.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("PEDIATRIC RADT-NEGATIVE — confirm with culture (IDSA recommendation); adult RADT-negative generally accepted without culture.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("Throat culture turnaround 24-48 hrs; gold standard.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("Treatment-naïve at swab time — recent antibiotics reduce sensitivity.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("DO NOT test for clear viral features — wastes resources + risks unnecessary abx.", citationIDs: ["specialty_labs_round22"])
        ],
        watchFor: [
            AttributedBullet("CARRIER STATE — asymptomatic carriage common in children (~10%); positive test in carrier + acute viral pharyngitis can lead to over-treatment.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("RECURRENT POSITIVE despite treatment — non-adherence, antibiotic failure, carrier state with viral concurrent illness.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("FALSE NEGATIVE RADT — poor swab technique, low organism load, recent antibiotics; backup culture in children.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("EBV / MONO — \"strep with no response to penicillin\" → atypical lymphocytes + Monospot at 2-3 weeks; treating mono with amoxicillin causes rash.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("Pediatric — also test for influenza, COVID-19 if seasonal / consistent with epidemiology.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("PERSISTENT GAS positive after treatment — chronic carrier state; not usually retreated unless symptomatic.", citationIDs: ["specialty_labs_round22"])
        ],
        citations: [openrnLabsR22, cdcLabsR22, specialtyLabsR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum KOHPrepSample {
    public static let entry: LabEntry = LabEntry(
        id: "koh-prep",
        title: "KOH (potassium hydroxide) skin scraping",
        subtitle: "Bedside test for cutaneous fungal infection · scrapes scale → KOH dissolves keratin → see hyphae · also for scabies, candidiasis",
        specimen: "Skin scrapings from active edge of lesion; nail clippings for onychomycosis; hair shafts for tinea capitis",
        nclexTags: labsTagsR22,
        referenceRanges: [
            ReferenceRangeRow(value: "Negative", label: "No fungal elements seen — consider other diagnoses or false-negative", citationIDs: ["specialty_labs_round22"]),
            ReferenceRangeRow(value: "Positive — septate hyphae", label: "Dermatophyte infection (tinea)", citationIDs: ["specialty_labs_round22"]),
            ReferenceRangeRow(value: "Positive — budding yeast + pseudohyphae", label: "Candidiasis", citationIDs: ["specialty_labs_round22"]),
            ReferenceRangeRow(value: "Positive — \"spaghetti + meatballs\"", label: "Tinea versicolor (Malassezia)", citationIDs: ["specialty_labs_round22"]),
            ReferenceRangeRow(value: "Positive — mites / eggs / scybala", label: "Scabies (different test — mineral oil mount preferred)", citationIDs: ["specialty_labs_round22"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative KOH",
                summary: "No fungal elements seen; consider non-fungal diagnosis (psoriasis, eczema, nummular dermatitis, contact dermatitis) OR false-negative (recent antifungal use, poor specimen, low organism load) per primary source.",
                nursingActions: [
                    "Reconsider diagnosis if clinical features inconsistent with fungal.",
                    "Repeat KOH or fungal culture if high suspicion despite negative.",
                    "Discontinue any topical antifungal before retesting (interfere with detection)."
                ],
                citationIDs: ["specialty_labs_round22"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Positive — fungal infection confirmed",
                summary: "Confirms cutaneous fungal infection. Distinguish dermatophyte (hyphae) from Candida (budding yeast + pseudohyphae) from Malassezia (\"spaghetti + meatballs\"). Treatment depends on extent + location per primary source.",
                nursingActions: [
                    "Initiate topical antifungal for limited cutaneous disease (clotrimazole, terbinafine BID × 2-4 weeks).",
                    "Oral antifungal (terbinafine) for tinea capitis, onychomycosis, refractory / extensive cutaneous.",
                    "Counsel hygiene — keep area dry, separate towels, treat shoes for pedis.",
                    "Continue topical 1-2 weeks AFTER symptom resolution.",
                    "Confirm species with fungal culture for refractory or atypical."
                ],
                citationIDs: ["specialty_labs_round22"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Positive KOH",
                causes: ["Tinea (corporis, cruris, pedis, capitis)", "Cutaneous candidiasis", "Tinea versicolor (Malassezia)", "Onychomycosis (nail clippings)"],
                citationIDs: ["specialty_labs_round22"]
            ),
            CauseGroup(
                title: "False-negative",
                causes: ["Recent topical antifungal use", "Poor specimen (not from active edge)", "Low organism load", "Tinea capitis (need hair shafts)", "Topical steroid masking (tinea incognito)"],
                citationIDs: ["specialty_labs_round22"]
            )
        ],
        nursingActions: [
            AttributedBullet("SCRAPE active edge of lesion (most fungal load); avoid central clearing area.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("ONYCHOMYCOSIS — collect subungual debris with curette + clip distal nail.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("TINEA CAPITIS — collect hair shafts + scalp scrape.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("Place on slide; add 1-2 drops KOH 10-20%; cover slip; gentle heat (alcohol lamp) optional; microscopy at 10× then 40×.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("FUNGAL CULTURE — for refractory / atypical / species identification; Sabouraud dextrose agar; 2-4 weeks.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("Defer testing if patient on topical antifungal — at least 1 week off for accurate results.", citationIDs: ["specialty_labs_round22"])
        ],
        watchFor: [
            AttributedBullet("TINEA INCOGNITO — modified appearance from topical steroid use; KOH may still be positive but characteristic features blurred; stop steroid + retest.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("ONYCHOMYCOSIS DIAGNOSIS — only 50% of dystrophic nails are fungal; CONFIRM before starting expensive long oral antifungal courses.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("MIXED INFECTIONS — bacterial superinfection (especially pedis with maceration) — separate treatment needed.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("REFRACTORY CASES — culture for species identification + susceptibility; consider rare organisms.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("SCABIES — mineral oil mount preferred for mite visualization (KOH dissolves mite); skin scraping with #15 blade of burrow.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("Pediatric — fungal culture more sensitive than KOH for tinea capitis.", citationIDs: ["specialty_labs_round22"])
        ],
        citations: [openrnLabsR22, cdcLabsR22, specialtyLabsR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum IgEAllergyPanelSample {
    public static let entry: LabEntry = LabEntry(
        id: "ige-allergy-panel",
        title: "Total + specific IgE (RAST / ImmunoCAP)",
        subtitle: "Allergy workup · alternative to skin prick · safer in eczema / antihistamine users · less sensitive than skin testing",
        specimen: "Serum (no fasting); ImmunoCAP, RAST, or other specific IgE method",
        nclexTags: labsTagsR22,
        referenceRanges: [
            ReferenceRangeRow(value: "Total IgE <100 IU/mL (varies by age)", label: "Normal total IgE", citationIDs: ["specialty_labs_round22"]),
            ReferenceRangeRow(value: "Total IgE 100-1000", label: "Elevated — atopic disease, parasitic infection, immune disorders", citationIDs: ["specialty_labs_round22"]),
            ReferenceRangeRow(value: "Total IgE >1000", label: "Markedly elevated — severe atopic dermatitis, ABPA, hyper-IgE syndrome", citationIDs: ["specialty_labs_round22"]),
            ReferenceRangeRow(value: "Specific IgE <0.10 kUA/L (Class 0)", label: "Undetectable", citationIDs: ["specialty_labs_round22"]),
            ReferenceRangeRow(value: "Specific IgE 0.35-0.69 (Class 1)", label: "Low", citationIDs: ["specialty_labs_round22"]),
            ReferenceRangeRow(value: "Specific IgE 0.70-3.49 (Class 2)", label: "Moderate", citationIDs: ["specialty_labs_round22"]),
            ReferenceRangeRow(value: "Specific IgE 3.50-17.49 (Class 3)", label: "High", citationIDs: ["specialty_labs_round22"]),
            ReferenceRangeRow(value: "Specific IgE ≥17.5 (Class 4-6)", label: "Very high", citationIDs: ["specialty_labs_round22"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative specific IgE — not allergic",
                summary: "Allergic reaction to that specific allergen unlikely. Note: results don't prove tolerance; clinical correlation needed. Some non-IgE mediated reactions (eosinophilic esophagitis, certain food sensitivities) won't show on IgE testing per primary source.",
                nursingActions: [
                    "Counsel — negative test doesn't mean no reaction; food protein-induced reactions can be non-IgE.",
                    "Consider oral food challenge if clinical history suggests allergy despite negative IgE.",
                    "Allergist referral if clinical features persistent.",
                    "If symptoms persist after negative panel — consider non-allergic etiologies."
                ],
                citationIDs: ["specialty_labs_round22"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Positive — allergic sensitization",
                summary: "Specific IgE confirmed. POSITIVE IgE INDICATES SENSITIZATION not necessarily CLINICAL ALLERGY — must correlate with history. Levels correlate with reaction severity for some (food, insect venom) but not perfectly per primary source.",
                nursingActions: [
                    "Allergen AVOIDANCE — primary treatment; counsel cross-reactive foods.",
                    "EPINEPHRINE AUTOINJECTOR for food / venom anaphylaxis history; demonstrate use.",
                    "ANTIHISTAMINES (cetirizine, fexofenadine) for mild allergic rhinitis / conjunctivitis.",
                    "Nasal steroids + antihistamines for moderate-severe allergic rhinitis.",
                    "ALLERGIST referral — moderate-severe disease, food allergy management, immunotherapy candidacy.",
                    "Component-resolved diagnostics — fine-tune true allergy vs cross-reactivity (peanut components Ara h 1/2/3 for severe vs Ara h 8 for mild oral allergy)."
                ],
                citationIDs: ["specialty_labs_round22"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Elevated total IgE",
                causes: ["Atopic dermatitis, asthma, allergic rhinitis", "Parasitic infections (helminths)", "ABPA (allergic bronchopulmonary aspergillosis)", "Hyper-IgE syndrome (Job's)", "Eosinophilic disorders", "Some autoimmune diseases"],
                citationIDs: ["specialty_labs_round22"]
            ),
            CauseGroup(
                title: "Specific IgE clinical context",
                causes: ["Food allergy — peanut, tree nuts, milk, egg, soy, wheat, fish, shellfish", "Inhalants — dust mite, pollens, animal dander, mold", "Insect venom — bee, wasp, hornet, fire ant", "Drug allergy — penicillin (specific IgE has limitations), latex"],
                citationIDs: ["specialty_labs_round22"]
            )
        ],
        nursingActions: [
            AttributedBullet("Test for clinically suspected allergens — broad panels without clinical context cause false-positive distress.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("ImmunoCAP / specific IgE — preferred over older RAST for sensitivity + specificity.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("Useful alternative to skin testing when — severe eczema (no skin available), on antihistamines (which inhibit skin tests), dermatographism, anaphylaxis history (cannot tolerate skin prick).", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("Skin prick testing — slightly more sensitive + faster + less expensive; but requires off-antihistamines + skin available.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("COMPONENT-RESOLVED DIAGNOSTICS — specific protein components (Ara h 1/2/3 for peanut) — distinguish primary vs cross-reactive sensitization; refine risk.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("Total IgE alone not diagnostic — must pair with specific IgE + clinical history.", citationIDs: ["specialty_labs_round22"])
        ],
        watchFor: [
            AttributedBullet("FOOD ALLERGY — positive IgE without prior reaction = sensitization not allergy; oral food challenge in controlled setting confirms.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("VENOM ALLERGY — anaphylaxis on prior sting + positive IgE → IMMUNOTHERAPY (life-saving + curative).", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("EOSINOPHILIC GI DISEASES — eosinophilic esophagitis, etc.; specific IgE often negative but elimination diet helpful.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("DRUG ALLERGY — specific IgE has limited sensitivity for many drugs (penicillin); skin testing + graded challenge better.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("OUTGROWING ALLERGIES — milk, egg, wheat, soy commonly outgrown; serial IgE monitoring may guide reintroduction.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("PEANUT / TREE NUT / SHELLFISH / FISH — typically lifelong; close monitoring + EpiPen + dietary management.", citationIDs: ["specialty_labs_round22"]),
            AttributedBullet("LATEX-FOOD SYNDROME — banana, kiwi, avocado, chestnut cross-react; surgical / dental precautions.", citationIDs: ["specialty_labs_round22"])
        ],
        citations: [openrnLabsR22, cdcLabsR22, specialtyLabsR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}
