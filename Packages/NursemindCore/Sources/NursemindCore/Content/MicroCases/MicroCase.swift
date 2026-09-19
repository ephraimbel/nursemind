import Foundation

/// One 60-second clinical-judgment case (PLAN.md R4). Structured on the NCSBN
/// Clinical Judgment Measurement Model: the stem and cues are what the nurse
/// sees, the prompt asks for one step, and every option's rationale is cited.
///
/// This is a daily ritual, not exam practice: no score, no streak, no timer.
/// Options are nursing actions (assess, notify, position, hold and verify);
/// never a dose. Cases ship compiled, so they work offline and carry no PHI.
public struct MicroCase: Identifiable, Hashable, Sendable {
    public enum Population: String, Sendable { case adult, pediatric, obstetric, neonatal }
    public enum CJMMStep: String, Sendable, CaseIterable {
        case recognizeCues, analyzeCues, prioritizeHypotheses, generateSolutions, takeAction, evaluateOutcomes

        public var label: String {
            switch self {
            case .recognizeCues:        return "Recognize cues"
            case .analyzeCues:          return "Analyze cues"
            case .prioritizeHypotheses: return "Prioritize"
            case .generateSolutions:    return "Generate solutions"
            case .takeAction:           return "Take action"
            case .evaluateOutcomes:     return "Evaluate"
            }
        }
    }
    public enum ReviewTier: String, Sendable { case tierA, tierB }

    public struct Option: Hashable, Sendable {
        public let text: String
        /// Why this option is or is not the best step; cited.
        public let rationale: AttributedBullet

        public init(_ text: String, rationale: String, citationIDs: [String]) {
            self.text = text
            self.rationale = AttributedBullet(rationale, citationIDs: citationIDs)
        }
    }

    public let id: String
    public let title: String
    public let population: Population
    public let step: CJMMStep
    /// What the nurse walks into. Kept under 80 words.
    public let stem: String
    /// Three to five observations, in the order the nurse would notice them.
    public let cues: [String]
    public let prompt: String
    public let options: [Option]
    public let bestOptionIndex: Int
    /// The lesson in eight words or fewer; shown after answering.
    public let takeaway: String
    public let relatedEntryIDs: [String]
    public let nclexTags: NCLEXTags?
    public let reviewTier: ReviewTier
    /// Calendar day this case is scheduled for, `yyyy-MM-dd`, unique.
    public let publishOn: String
    public let citations: [CitationSource]

    public init(
        id: String,
        title: String,
        population: Population,
        step: CJMMStep,
        stem: String,
        cues: [String],
        prompt: String,
        options: [Option],
        bestOptionIndex: Int,
        takeaway: String,
        relatedEntryIDs: [String],
        nclexTags: NCLEXTags? = nil,
        reviewTier: ReviewTier,
        publishOn: String,
        citations: [CitationSource]
    ) {
        self.id = id
        self.title = title
        self.population = population
        self.step = step
        self.stem = stem
        self.cues = cues
        self.prompt = prompt
        self.options = options
        self.bestOptionIndex = bestOptionIndex
        self.takeaway = takeaway
        self.relatedEntryIDs = relatedEntryIDs
        self.nclexTags = nclexTags
        self.reviewTier = reviewTier
        self.publishOn = publishOn
        self.citations = citations
    }

    public var best: Option { options[bestOptionIndex] }

    /// Citation number (1-based) per source id, for superscripts.
    public var citationIndex: [String: Int] {
        Dictionary(uniqueKeysWithValues: citations.enumerated().map { ($1.id, $0 + 1) })
    }

    public var populationLabel: String {
        switch population {
        case .adult:     return "ADULT"
        case .pediatric: return "PEDIATRIC"
        case .obstetric: return "OBSTETRIC"
        case .neonatal:  return "NEONATAL"
        }
    }
}

/// All compiled cases and the day → case mapping.
public final class MicroCaseRegistry: Sendable {
    public static let shared = MicroCaseRegistry(cases: MicroCaseCorpus.all)

    public let all: [MicroCase]
    private let byID: [String: MicroCase]
    private let byDay: [String: MicroCase]

    init(cases: [MicroCase]) {
        var byID: [String: MicroCase] = [:]
        var byDay: [String: MicroCase] = [:]
        for c in cases {
            assert(byID[c.id] == nil, "Duplicate micro-case id: \(c.id)")
            assert(byDay[c.publishOn] == nil, "Two micro-cases scheduled on \(c.publishOn)")
            byID[c.id] = c
            byDay[c.publishOn] = c
        }
        self.all = cases.sorted { $0.publishOn < $1.publishOn }
        self.byID = byID
        self.byDay = byDay
    }

    public func `case`(id: String) -> MicroCase? { byID[id] }

    /// The scheduled case for a day; past the scheduled window the corpus
    /// rotates by day ordinal so the ritual never goes dark.
    public func `case`(on date: Date, calendar: Calendar = .current) -> MicroCase? {
        guard !all.isEmpty else { return nil }
        if let exact = byDay[Self.dayKey(date, calendar: calendar)] { return exact }
        let ordinal = calendar.ordinality(of: .day, in: .era, for: date) ?? 0
        return all[ordinal % all.count]
    }

    /// Scheduled cases before `date`, most recent first, capped.
    public func pastCases(before date: Date, calendar: Calendar = .current, limit: Int = 30) -> [MicroCase] {
        let today = Self.dayKey(date, calendar: calendar)
        return Array(all.filter { $0.publishOn < today }.reversed().prefix(limit))
    }

    public static func dayKey(_ date: Date, calendar: Calendar = .current) -> String {
        let parts = calendar.dateComponents([.year, .month, .day], from: date)
        return String(format: "%04d-%02d-%02d", parts.year ?? 0, parts.month ?? 0, parts.day ?? 0)
    }
}
