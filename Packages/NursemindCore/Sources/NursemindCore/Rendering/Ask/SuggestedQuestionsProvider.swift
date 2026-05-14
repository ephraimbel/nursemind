import Foundation

/// Personalized "SUGGESTED" questions for the Ask empty state. Replaces the
/// prior six-line hardcoded list with a unit-and-role-aware draw of three
/// questions from a curated pool, rotated deterministically by calendar day
/// so the same user sees stable choices throughout a session but fresh ones
/// the next morning.
///
/// Personalization layers:
///   1. `role == .student` → the NCLEX-aligned pool, unit-agnostic. A student
///      studying for boards needs prioritization, delegation, and process
///      questions more than unit-specific clinical workflow.
///   2. `unit` → the per-unit pool (Med-Surg, ICU, ED, OB, Peds, NICU, etc.).
///   3. `unit == .icu` + `icuSubspecialty` → base ICU pool augmented with
///      subspecialty-specific questions (CVICU sees IABP/CABG questions,
///      Neuro ICU sees ICP/SAH questions, etc.).
///
/// The shuffle is seeded by `(calendar day) XOR djb2(role + unit + sub)` so:
///   • Within a day, every render returns the same three (no flicker if
///     the user navigates away and back).
///   • Different users (different role/unit/sub combinations) see different
///     orderings on the same day.
///   • New day → new seed → fresh suggestions.
///
/// The provider is a pure function with no I/O, no logging, no dependency
/// on `UserPreferences.shared` — callers pass the prefs they want.
public enum SuggestedQuestionsProvider {

    /// Return up to `count` personalized suggestions for the given role / unit
    /// / subspecialty triple and calendar day. The provider takes primitives
    /// rather than `UserPreferences` so it stays actor-isolation-free — pure
    /// function in, pure function out, callable from any context. Callers
    /// (e.g., the `AskHomeView` empty state, which is already MainActor)
    /// pluck the fields they need off `UserPreferences.shared` themselves.
    public static func questions(
        role: UserRole,
        unit: NursingUnit,
        icuSubspecialty: ICUSubspecialty? = nil,
        on day: Date = Date(),
        count: Int = 3
    ) -> [String] {
        let pool = pool(role: role, unit: unit, icuSubspecialty: icuSubspecialty)
        let seed = daySeed(
            for: day,
            userKey: userKey(role: role, unit: unit, icuSubspecialty: icuSubspecialty)
        )
        return pick(count, from: pool, seed: seed)
    }

    // MARK: - Pool selection

    private static func pool(
        role: UserRole,
        unit: NursingUnit,
        icuSubspecialty: ICUSubspecialty?
    ) -> [String] {
        // Students get NCLEX-aligned content regardless of which unit they
        // selected during onboarding — they're studying for the licensing
        // exam, not optimizing for a specific clinical workflow yet.
        if role == .student { return nclex }

        switch unit {
        case .medSurg:           return medSurg
        case .icu:               return icuPool(for: icuSubspecialty)
        case .er:                return emergency
        case .stepDown:          return stepDown
        case .lAndD:             return obstetric
        case .pediatrics:        return pediatric
        case .nicu:              return neonatal
        case .oncology:          return oncology
        case .orthopedics:       return orthopedics
        case .operatingRoom:     return perioperative
        case .psychMentalHealth: return psych
        case .homeHealth:        return homeHealth
        case .longTermCare:      return longTermCare
        case .clinic:            return clinic
        case .school:            return school
        case .other:             return medSurg
        }
    }

    /// ICU pool composition. With a subspecialty set, the base ICU pool is
    /// augmented (not replaced) with subspecialty-specific items so a CVICU
    /// nurse still sees core ICU questions (vasopressor titration, ARDS, etc.)
    /// alongside cardiac-specific ones (IABP, ECMO, post-CABG hemodynamics).
    private static func icuPool(for sub: ICUSubspecialty?) -> [String] {
        guard let sub = sub else { return icu }
        switch sub {
        case .mixed:                       return icu
        case .medical:                     return icu + medicalICU
        case .surgical:                    return icu + surgicalICU
        case .cardiac, .cardiothoracic:    return icu + cardiacICU
        case .neuro:                       return icu + neuroICU
        case .trauma:                      return icu + traumaICU
        case .burn:                        return icu + burnICU
        }
    }

    // MARK: - Deterministic shuffle

    /// Hash key derived from the user's choices. Excludes display name so
    /// renaming doesn't reshuffle the suggestions — only changes to role,
    /// unit, or subspecialty do.
    private static func userKey(
        role: UserRole,
        unit: NursingUnit,
        icuSubspecialty: ICUSubspecialty?
    ) -> String {
        let sub = icuSubspecialty?.rawValue ?? ""
        return "\(role.rawValue)|\(unit.rawValue)|\(sub)"
    }

    /// Day-stable seed. `String.hashValue` is per-launch-randomized in Swift
    /// 4.2+; we use djb2 (a classic stable hash) so the seed is reproducible
    /// across app launches on the same day.
    private static func daySeed(for date: Date, userKey: String) -> UInt64 {
        let startOfDay = Calendar.current.startOfDay(for: date)
        let secondsPerDay: TimeInterval = 86_400
        let dayInt = UInt64(max(0, Int64(startOfDay.timeIntervalSince1970 / secondsPerDay)))
        let userHash = UInt64(bitPattern: Int64(djb2(userKey)))
        return dayInt &+ userHash
    }

    private static func djb2(_ s: String) -> Int {
        var hash = 5381
        for byte in s.utf8 {
            // hash * 33 + byte, overflow-safe
            hash = ((hash &<< 5) &+ hash) &+ Int(byte)
        }
        return hash
    }

    /// Seeded shuffle → take first `count`. Stable: same seed always yields
    /// the same order.
    private static func pick(_ count: Int, from pool: [String], seed: UInt64) -> [String] {
        guard !pool.isEmpty, count > 0 else { return [] }
        var rng = SeededRNG(seed: seed)
        let shuffled = pool.shuffled(using: &rng)
        return Array(shuffled.prefix(count))
    }

    // MARK: - Curated pools
    //
    // Every line should be answerable by the AI co-pilot grounded in the
    // library (cite-or-refuse). Voice: practitioner-first, action-oriented
    // ("How do I…", "When do I…", "What's the priority for…"). No
    // workplace positioning ("at the bedside", "on shift", "at the
    // station") per CLAUDE.md marketing rules.

    private static let medSurg: [String] = [
        "How do I monitor a heparin drip safely?",
        "What are the SIRS criteria?",
        "How do I assess for postop hemorrhage?",
        "When should I worry about a pulmonary embolism?",
        "What's the bowel regimen for opioid-induced constipation?",
        "How do I interpret a potassium of 6.5?",
        "What are the nursing implications for IV vancomycin?",
        "How do I differentiate cellulitis from DVT?",
        "When is hyponatremia an emergency?",
        "What are the early warning signs of urosepsis?",
        "How do I manage uncontrolled hypertension safely?",
        "Walk me through SBAR for a hypotensive patient."
    ]

    private static let icu: [String] = [
        "How do I titrate norepinephrine to MAP?",
        "What's the MAP target in septic shock?",
        "How do I troubleshoot a patient fighting the ventilator?",
        "What are the diagnostic criteria for ARDS?",
        "When do I prone a patient?",
        "How do I interpret a rising lactate?",
        "How do I manage refractory shock?",
        "What's the diagnostic workup for new ICU AFib?",
        "How do I read an ABG quickly?",
        "When is therapeutic hypothermia indicated post-arrest?",
        "What's the sepsis bundle for the first hour?",
        "How do I manage refractory hypoxemia?"
    ]

    private static let medicalICU: [String] = [
        "How do I manage a DKA patient on insulin drip?",
        "What's the workup for acute liver failure?",
        "How do I manage refractory hyperkalemia?",
        "When do I worry about hepatorenal syndrome?",
        "What's the priority for status epilepticus?",
        "How do I read a portal venous gas?"
    ]

    private static let surgicalICU: [String] = [
        "What's the post-laparotomy hemodynamic target?",
        "How do I assess for abdominal compartment syndrome?",
        "When do I worry about an anastomotic leak?",
        "How do I manage post-op delirium?",
        "What's the workup for new post-op fever?",
        "How do I assess wound dehiscence?"
    ]

    private static let cardiacICU: [String] = [
        "What's the post-CABG hemodynamic target?",
        "How do I troubleshoot an intra-aortic balloon pump?",
        "When do I escalate to ECMO?",
        "How do I manage post-op AFib with RVR?",
        "What does an SvO2 of 50% tell me?",
        "How do I interpret cardiac index trends?"
    ]

    private static let neuroICU: [String] = [
        "What's the BP target post-stroke vs post-ICH?",
        "How often should I assess a craniotomy patient?",
        "How do I assess for cerebral vasospasm post-SAH?",
        "What's the cerebral perfusion pressure target?",
        "When do I worry about rising ICP?",
        "How do I assess a sudden GCS drop?"
    ]

    private static let traumaICU: [String] = [
        "What's the priority for a multi-system trauma patient?",
        "How do I assess for occult abdominal bleeding?",
        "When do I activate massive transfusion protocol?",
        "What's the FAST exam workflow?",
        "How do I manage a pelvic-fracture bleed?"
    ]

    private static let burnICU: [String] = [
        "How do I assess burn depth and total body surface area?",
        "What's the fluid resuscitation target for major burns?",
        "When does a burn need transfer to a burn center?",
        "How do I assess for inhalation injury?",
        "What's the priority for circumferential burns?"
    ]

    private static let emergency: [String] = [
        "What's the STEMI time-to-cath standard?",
        "How do I manage a hypertensive emergency?",
        "When should I activate stroke protocol?",
        "How do I manage a sickle cell crisis?",
        "What does an elevated D-dimer mean here?",
        "How do I triage a chest pain patient?",
        "What's the workup for syncope?",
        "How do I rapidly assess for trauma?",
        "When does a fever need a sepsis workup?",
        "What's the priority for status epilepticus?",
        "How do I assess an acute abdomen?",
        "What's the workup for sudden severe headache?"
    ]

    private static let stepDown: [String] = [
        "When does a step-down patient escalate back to ICU?",
        "How do I read continuous telemetry for new AFib?",
        "What's the workup for chest pain on a tele floor?",
        "How do I assess respiratory deterioration?",
        "What's the indication for a rapid response?",
        "How do I titrate an IV antihypertensive?",
        "What's the priority for new-onset stridor?",
        "How do I monitor a heparin drip safely?"
    ]

    private static let obstetric: [String] = [
        "What's the magnesium toxicity threshold?",
        "When does PIH become preeclampsia?",
        "How do I assess for postpartum hemorrhage?",
        "What's the priority for shoulder dystocia?",
        "How do I read a Category III fetal strip?",
        "What's the magnesium loading dose for severe preeclampsia?",
        "How do I assess for placental abruption?",
        "When is preterm labor an emergency?",
        "What's the workup for an unresponsive newborn?",
        "How do I manage uterine atony?"
    ]

    private static let pediatric: [String] = [
        "How do I calculate a pediatric fluid bolus?",
        "What's the workup for a febrile seizure?",
        "When does a fever in a neonate require sepsis workup?",
        "How do I assess pain in a non-verbal child?",
        "How do I manage a pediatric asthma exacerbation?",
        "When is a child's heart rate too low?",
        "What's the workup for unexplained bruising in a child?",
        "How do I dose acetaminophen vs ibuprofen by weight?",
        "What are the diagnostic criteria for Kawasaki disease?",
        "What's the priority for a pediatric airway emergency?"
    ]

    private static let neonatal: [String] = [
        "How do I assess for neonatal respiratory distress?",
        "What's the priority for a TTN baby?",
        "How do I differentiate sepsis from RDS in a preterm?",
        "When does a NICU baby need surfactant?",
        "What's the workup for jaundice in a preterm?",
        "How do I manage neonatal abstinence syndrome?",
        "What are the indications for therapeutic hypothermia in neonates?",
        "How do I monitor a baby on CPAP?"
    ]

    private static let oncology: [String] = [
        "What's the priority for tumor lysis syndrome?",
        "How do I manage chemo-induced nausea?",
        "What are the signs of neutropenic fever?",
        "How do I administer vesicant chemotherapy safely?",
        "What's the assessment for spinal cord compression in metastatic disease?",
        "When do I worry about superior vena cava syndrome?",
        "What's the workup for new-onset hypercalcemia in cancer?",
        "How do I differentiate cancer pain from bone metastasis pain?"
    ]

    private static let orthopedics: [String] = [
        "How do I assess for compartment syndrome?",
        "What's the workup for fat embolism after long bone fracture?",
        "How do I monitor neurovascular status post-op?",
        "What's the DVT prophylaxis after a total hip?",
        "How do I manage post-op pain after a total joint?",
        "When is a post-op fall an emergency?",
        "How do I assess wound dehiscence?"
    ]

    private static let perioperative: [String] = [
        "What's the malignant hyperthermia protocol?",
        "How do I assess for postanesthesia delirium?",
        "What are the criteria for PACU discharge?",
        "How do I manage post-op shivering?",
        "When is post-op hypotension an emergency?",
        "What's the priority for laryngospasm in PACU?",
        "How do I assess for emergence agitation?"
    ]

    private static let psych: [String] = [
        "What's the workup for serotonin syndrome?",
        "How do I assess for suicidality?",
        "What's the CIWA protocol for alcohol withdrawal?",
        "How do I de-escalate an agitated patient?",
        "What's the workup for new-onset psychosis?",
        "How do I manage lithium toxicity?",
        "When does agitation require chemical restraint?"
    ]

    private static let homeHealth: [String] = [
        "How do I assess medication adherence at home?",
        "What are the red flags during a home heart-failure visit?",
        "How do I assess wound healing in a community setting?",
        "When does a home patient need ED transfer?",
        "How do I educate on safe insulin storage and administration?",
        "What's the workup for a chronic non-healing wound?"
    ]

    private static let longTermCare: [String] = [
        "How do I assess for delirium vs dementia?",
        "What's the workup for a sudden change in mental status?",
        "How do I prevent pressure injuries?",
        "What's the priority for new urinary symptoms in an elderly resident?",
        "When does a resident's fall require ED transfer?",
        "How do I assess pain in a non-verbal dementia patient?",
        "What's the workup for new unintentional weight loss?"
    ]

    private static let clinic: [String] = [
        "How do I educate on home BP monitoring?",
        "What's the workup for new-onset hypertension in a young patient?",
        "When is outpatient diabetes management failing?",
        "How do I counsel on contraception options?",
        "What's the adult screening schedule after age 50?",
        "When does a primary-care patient need ED referral?"
    ]

    private static let school: [String] = [
        "How do I manage an asthma attack in school?",
        "What's the workup for a school-age student with chest pain?",
        "How do I assess concussion symptoms?",
        "When does a school injury need ED transfer?",
        "How do I educate teens on diabetes self-management?",
        "What's the workup for a fainting episode at school?"
    ]

    private static let nclex: [String] = [
        "What's the priority for a patient with chest pain?",
        "When do I delegate to a CNA vs an LPN?",
        "Walk me through SBAR communication.",
        "What's the difference between left and right heart failure?",
        "How do I prioritize four patients?",
        "What does the nursing process look like — assessment first?",
        "When is delegation outside my scope?",
        "How do I prep a patient for surgery?",
        "What are the 6 rights of medication administration?",
        "What's the difference between SIRS and sepsis?",
        "How do I assess pain in different age groups?",
        "What does culturally competent care look like?"
    ]
}

/// Tiny xorshift64 PRNG. Deterministic for a given seed; resistant to the
/// pathological all-zero state via a fallback constant.
private struct SeededRNG: RandomNumberGenerator {
    private var state: UInt64
    init(seed: UInt64) {
        // xorshift fails if state ever becomes zero — substitute a non-zero
        // sentinel so callers passing seed=0 still get a valid sequence.
        self.state = seed == 0 ? 0xDEADBEEF_CAFEBABE : seed
    }
    mutating func next() -> UInt64 {
        state ^= state &<< 13
        state ^= state &>> 7
        state ^= state &<< 17
        return state
    }
}
