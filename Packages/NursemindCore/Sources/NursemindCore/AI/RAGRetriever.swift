import Foundation
import CryptoKit

/// Retrieves relevant library entries for a question, then formats them as the
/// `[c001] (source: ...) text` chunks the model expects, plus the full
/// `CitationSource` list to attach to the final answer.
///
/// Ranks cited passages across the complete bundled library; context stays bounded.
public struct RAGRetriever: Sendable {
    private let registry: ContentRegistry

    public init(registry: ContentRegistry = .shared) {
        self.registry = registry
    }

    public struct Result: Sendable {
        public let formattedContext: String
        public let citations: [CitationSource]
        public let entries: [LibraryEntry]
        public let confidenceFloor: Bool

        public var validCitationIDs: Set<String> {
            Set(citations.indices.map { String(format: "c%03d", $0 + 1) })
        }
    }

    private struct Chunk: Sendable {
        let entry: LibraryEntry
        let text: String
        let sources: [CitationSource]
        let terms: Set<String>
        let titleTerms: Set<String>
    }

    private final class IndexCache: @unchecked Sendable {
        let lock = NSLock()
        var chunks: [Chunk]?
        var postings: [String: [Int]] = [:]
        var vocabulary: [String] = []
        var vocabularyBytes: [[UInt8]] = []
    }

    private let cache = IndexCache()
    public static let contextCharacterLimit = 16_000

    public func prewarm() {
        _ = indexedChunks()
    }

    private func indexedChunks() -> [Chunk] {
        cache.lock.lock()
        defer { cache.lock.unlock() }
        if let chunks = cache.chunks { return chunks }
        let chunks = registry.all.flatMap { entry in
            let titleTerms = Self.terms(entry.title)
            return formatEntry(entry).compactMap { text, sources -> Chunk? in
                // Display permission does not imply permission to send text to
                // an LLM, so a display-only source never reaches the model. A
                // passage it shares with a permitted source is our own authored
                // line that the permitted source supports on its own, so it
                // stays, attributed to the permitted sources only.
                let permitted = sources.filter { $0.license != .ccBy4WithAIRestriction }
                guard !permitted.isEmpty else { return nil }
                return Chunk(entry: entry, text: text, sources: permitted,
                             terms: Self.terms(text), titleTerms: titleTerms)
            }
        }
        for (index, chunk) in chunks.enumerated() {
            for term in chunk.terms.union(chunk.titleTerms) { cache.postings[term, default: []].append(index) }
        }
        cache.vocabulary = Set(chunks.flatMap(\.titleTerms)).sorted()
        cache.vocabularyBytes = cache.vocabulary.map { Array($0.utf8) }
        cache.chunks = chunks
        return chunks
    }

    public func retrieve(for query: String, limit: Int = 5, specialty: NursingSpecialty? = nil) -> Result {
        var terms = Self.terms(ClinicalSynonyms.expand(query: query.lowercased()))
        let corpus = indexedChunks()
        for term in terms.sorted() where cache.postings[term] == nil {
            if let correction = FuzzyMatch.bestCorrection(for: term, in: cache.vocabularyBytes) {
                terms.insert(cache.vocabulary[correction])
            }
        }
        let seedEntries = registry.search(query, limit: 10, specialty: specialty)
        let seedScores = Dictionary(uniqueKeysWithValues: seedEntries.enumerated().map { ($0.element.id, 4.0 / Double($0.offset + 1)) })
        var scores: [Int: Double] = [:]
        for term in terms {
            let matches = cache.postings[term, default: []]
            let weight = log(1 + Double(corpus.count) / Double(1 + matches.count))
            for index in matches {
                let chunk = corpus[index]
                scores[index, default: 0] += weight * (chunk.titleTerms.contains(term) ? 2 : 0)
                if chunk.terms.contains(term) { scores[index, default: 0] += weight }
            }
        }
        for (index, chunk) in corpus.enumerated() {
            if let boost = seedScores[chunk.entry.id] { scores[index, default: 0] += boost }
        }
        let bestScore = scores.values.max() ?? 0
        var ranked = scores.filter { $0.value > 0 && $0.value >= bestScore * 0.6 }
            .sorted { $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value }
        // Entry scoping by population: a question that does not ask about
        // children never sees the pediatric variant of a topic next to the
        // adult one, and a pediatric question never sees the adult-only
        // variant, so the model has nothing to conflate. A population-
        // specific entry still answers on its own when it is all there is.
        let requested = Self.requestedPopulation(query: query, specialty: specialty)
        let scoped = ranked.filter { Self.serves(requested, entry: corpus[$0.key].entry) }
        if !scoped.isEmpty { ranked = scoped }

        var citations: [CitationSource] = []
        var entries: [LibraryEntry] = []
        var lines: [String] = []
        var usedCharacters = 0
        var perEntry: [String: Int] = [:]
        for (index, _) in ranked {
            let chunk = corpus[index]
            let isNew = perEntry[chunk.entry.id] == nil
            guard (!isNew || entries.count < max(0, limit)),
                  perEntry[chunk.entry.id, default: 0] < 8,
                  lines.count < 24 else { continue }
            var proposedCitations = citations
            let markers = chunk.sources.map { source -> String in
                if !proposedCitations.contains(where: { $0.id == source.id }) { proposedCitations.append(source) }
                let index = proposedCitations.firstIndex(where: { $0.id == source.id })!
                return String(format: "[c%03d]", index + 1)
            }.joined(separator: " ")
            let line = "\(markers) \(Self.evidenceText(chunk))"
            guard usedCharacters + line.count + 1 <= Self.contextCharacterLimit else { continue }
            citations = proposedCitations
            if isNew { entries.append(chunk.entry) }
            perEntry[chunk.entry.id, default: 0] += 1
            lines.append(line)
            usedCharacters += line.count + 1
        }
        return Result(formattedContext: lines.joined(separator: "\n"), citations: citations,
                      entries: entries, confidenceFloor: lines.isEmpty)
    }

    // MARK: - Population scoping

    enum Population: Equatable {
        case pediatric, pregnancy, adult, general
    }

    /// Who an entry is written for, read from its slug and title: "Pediatric
    /// DKA" and "peds-iv-fluids" are pediatric, "Adult DKA" is adult,
    /// "pregnancy-vte" is pregnancy, everything else is general.
    static func population(of entry: LibraryEntry) -> Population {
        let slug = entry.id.split(separator: ":").last.map(String.init) ?? entry.id
        let text = "\(slug) \(entry.title)".lowercased()
        if text.range(of: #"(^|[\s(-])(peds?|pediatric|paediatric|neonat\w*|newborn|infant|child(ren)?|adolescent)([\s):-]|$)"#, options: .regularExpression) != nil { return .pediatric }
        if text.range(of: #"(^|[\s(-])(pregnan\w*|obstetric|antepartum|postpartum|maternal)([\s):-]|$)"#, options: .regularExpression) != nil { return .pregnancy }
        if text.range(of: #"(^|[\s(-])adults?([\s):-]|$)"#, options: .regularExpression) != nil { return .adult }
        return .general
    }

    /// The population the question is about. Nil means unspecified, which
    /// reads as adult; the nurse's unit only speaks when the question is silent.
    static func requestedPopulation(query: String, specialty: NursingSpecialty?) -> Population? {
        let lower = query.lowercased()
        if lower.range(of: #"\b(peds?|pediatric|paediatric|child|children|kids?|infants?|neonat\w*|newborns?|nicu|picu|toddlers?|adolescents?|teens?|\d+\s*-?\s*(month|year)s?[- ]old)\b"#, options: .regularExpression) != nil { return .pediatric }
        if lower.range(of: #"\b(pregnan\w*|obstetric\w*|antepartum|postpartum|laboring|in labor|maternal)\b"#, options: .regularExpression) != nil { return .pregnancy }
        if lower.range(of: #"\badults?\b"#, options: .regularExpression) != nil { return .adult }
        switch specialty {
        case .peds?, .nicu?: return .pediatric
        case .ob?: return .pregnancy
        default: return nil
        }
    }

    /// Whether an entry belongs in the context for the requested population.
    /// General entries always do; a specific entry only when it matches, and
    /// an adult entry also when the question names no population.
    static func serves(_ requested: Population?, entry: LibraryEntry) -> Bool {
        switch population(of: entry) {
        case .general: return true
        case .adult: return requested == nil || requested == .adult
        case let specific: return requested == specific
        }
    }

    private static func evidenceText(_ chunk: Chunk) -> String {
        let names = chunk.sources.map { "\($0.shortName) (retrieved \($0.lastRetrieved))" }.joined(separator: "; ")
        // One physical line per passage makes the server's provenance boundary unambiguous.
        return "(entry: \(chunk.entry.title); source: \(names)) \(chunk.text)"
            .components(separatedBy: .newlines).joined(separator: " ")
    }

    func evidenceFingerprints() -> [String] {
        Set(indexedChunks().map { chunk in
            SHA256.hash(data: Data(Self.evidenceText(chunk).utf8)).map { String(format: "%02x", $0) }.joined()
        }).sorted()
    }

    static func retrievalQuery(_ question: String, history: [AskMessage]) -> String {
        let lower = question.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        let followUp = lower.range(of: #"^(and\b|what about\b|how about\b|what if\b)|\b(it|its|that|those|these|this medication|this drug)\b"#,
                                  options: .regularExpression) != nil
        guard followUp, let previous = history.last(where: { $0.role == .user && $0.refusal == nil }) else { return question }
        return "\(question) \(PHIScrubber.scrub(String(previous.content.prefix(400))).scrubbed)"
    }

    private static let stopWords: Set<String> = [
        "a", "an", "the", "is", "are", "was", "were", "be", "for", "of", "to", "in", "on", "at", "and", "or",
        "what", "which", "how", "why", "when", "where", "do", "does", "can", "could", "should", "would", "i", "my",
        "it", "its", "this", "that", "these", "those", "with", "without", "about", "tell", "me", "please", "explain"
    ]

    private static func terms(_ text: String) -> Set<String> {
        Set(text.lowercased().split(whereSeparator: { !$0.isLetter && !$0.isNumber }).map(String.init)
            .filter { $0.count > 1 && !stopWords.contains($0) })
    }

    /// Returns ordered (chunk_text, sources) pairs for one library entry,
    /// flattened from whatever typed structure the entry has.
    private func formatEntry(_ entry: LibraryEntry) -> [(String, [CitationSource])] {
        switch entry {
        case .drug(let d), .drip(let d):
            return formatDrug(d)
        case .lab(let l):
            return formatLab(l)
        case .procedure(let p):
            return formatProcedure(p)
        case .diagnosis(let dx):
            return formatDiagnosis(dx)
        case .reference(let r), .communication(let r), .scenario(let r):
            return formatReference(r)
        }
    }

    private func formatDrug(_ d: DrugEntry) -> [(String, [CitationSource])] {
        var out: [(String, [CitationSource])] = []
        out.append((
            "\(d.title) (\(d.category)\(d.isHighAlert ? ", ISMP high-alert" : d.isHighRisk ? ", high-risk medication" : "")). Indications: \(d.indications.text)",
            sources(d.indications.citationIDs, in: d.citations)
        ))
        out.append(("Mechanism: \(d.mechanism.text)", sources(d.mechanism.citationIDs, in: d.citations)))
        for block in d.dosing {
            out.append(("Dosing — \(block.label): \(block.body)", sources(block.citationIDs, in: d.citations)))
        }
        if let contras = d.contraindications {
            out.append(("Contraindications: \(contras.text)", sources(contras.citationIDs, in: d.citations)))
        }
        for warn in d.warnings {
            out.append(("Warning: \(warn.text)", sources(warn.citationIDs, in: d.citations)))
        }
        out.append(("Adverse reactions: \(d.adverseReactions.text)", sources(d.adverseReactions.citationIDs, in: d.citations)))
        for inter in d.drugInteractions {
            out.append(("Drug interaction: \(inter.text)", sources(inter.citationIDs, in: d.citations)))
        }
        if let nursing = d.nursingImplications {
            for bullet in nursing {
                out.append(("Nursing implication: \(bullet.text)", sources(bullet.citationIDs, in: d.citations)))
            }
        }
        if let teaching = d.patientTeaching {
            out.append(("Patient teaching: \(teaching.text)", sources(teaching.citationIDs, in: d.citations)))
        }
        return out
    }

    private func formatLab(_ l: LabEntry) -> [(String, [CitationSource])] {
        var out: [(String, [CitationSource])] = []
        out.append(("\(l.title) (\(l.specimen)). Reference ranges:", []))
        for row in l.referenceRanges {
            out.append(("Reference range (\(l.specimen)): \(row.value) — \(row.label)", sources(row.citationIDs, in: l.citations)))
        }
        for tier in l.interpretationTiers {
            out.append(("\(tier.label): \(tier.summary)", sources(tier.citationIDs, in: l.citations)))
            for action in tier.nursingActions {
                out.append(("\(tier.label) — nursing action: \(action)", sources(tier.citationIDs, in: l.citations)))
            }
        }
        for group in l.commonCauses {
            out.append(("\(group.title): \(group.causes.joined(separator: "; "))", sources(group.citationIDs, in: l.citations)))
        }
        if let actions = l.nursingActions {
            for bullet in actions {
                out.append(("Nursing action: \(bullet.text)", sources(bullet.citationIDs, in: l.citations)))
            }
        }
        for bullet in l.watchFor ?? [] {
            out.append(("Watch for: \(bullet.text)", sources(bullet.citationIDs, in: l.citations)))
        }
        return out
    }

    private func formatProcedure(_ p: ProcedureEntry) -> [(String, [CitationSource])] {
        var out: [(String, [CitationSource])] = []
        out.append(("\(p.title). Indications: \(p.indications.text)", sources(p.indications.citationIDs, in: p.citations)))
        if let contraindications = p.contraindications {
            out.append(("Contraindications: \(contraindications.text)", sources(contraindications.citationIDs, in: p.citations)))
        }
        for (label, bullets) in [("Equipment", p.equipment), ("Preparation", p.preProcedure),
                                 ("After procedure", p.postProcedure), ("Documentation", p.documentation ?? [])] {
            for bullet in bullets {
                out.append(("\(label): \(bullet.text)", sources(bullet.citationIDs, in: p.citations)))
            }
        }
        for step in p.steps {
            let title = step.title.map { "\($0): " } ?? ""
            out.append(("Step \(step.number) — \(title)\(step.body)", sources(step.citationIDs, in: p.citations)))
        }
        for watch in p.watchFor ?? [] {
            out.append(("Watch for: \(watch.text)", sources(watch.citationIDs, in: p.citations)))
        }
        return out
    }

    private func formatDiagnosis(_ dx: DiagnosisEntry) -> [(String, [CitationSource])] {
        var out: [(String, [CitationSource])] = []
        out.append(("\(dx.title). Definition: \(dx.definition.text)", sources(dx.definition.citationIDs, in: dx.citations)))
        if let pp = dx.pathophysiology {
            out.append(("Pathophysiology: \(pp.text)", sources(pp.citationIDs, in: dx.citations)))
        }
        for (label, bullets) in [("Diagnostic reference", dx.diagnosticCriteria ?? []), ("Watch for", dx.watchFor ?? [])] {
            for bullet in bullets {
                out.append(("\(label): \(bullet.text)", sources(bullet.citationIDs, in: dx.citations)))
            }
        }
        for sign in dx.presentation {
            out.append(("Presentation: \(sign.text)", sources(sign.citationIDs, in: dx.citations)))
        }
        if let assess = dx.priorityAssessments {
            for a in assess {
                out.append(("Priority assessment: \(a.text)", sources(a.citationIDs, in: dx.citations)))
            }
        }
        if let interv = dx.commonInterventions {
            for i in interv {
                out.append(("Common intervention: \(i.text)", sources(i.citationIDs, in: dx.citations)))
            }
        }
        return out
    }

    private func formatReference(_ r: ReferenceEntry) -> [(String, [CitationSource])] {
        var out: [(String, [CitationSource])] = []
        out.append(("\(r.title) [\(r.eyebrow)]", []))
        for section in r.sections {
            switch section {
            case .prose(let title, let prose):
                out.append(("\(title): \(prose.text)", sources(prose.citationIDs, in: r.citations)))
            case .bullets(let title, let bullets):
                for bullet in bullets {
                    out.append(("\(title): \(bullet.text)", sources(bullet.citationIDs, in: r.citations)))
                }
            case .keyValueTable:
                continue
            case .numberedSteps(let title, let steps, let citIDs):
                let collected = steps.enumerated().map { "\($0.offset+1). \($0.element)" }.joined(separator: " ")
                out.append(("\(title): \(collected)", sources(citIDs, in: r.citations)))
            }
        }
        return out
    }

    private func sources(_ ids: [String], in pool: [CitationSource]) -> [CitationSource] {
        ids.compactMap { id in pool.first(where: { $0.id == id }) }
    }
}
