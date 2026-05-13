import Foundation

/// Retrieves relevant library entries for a question, then formats them as the
/// `[c001] (source: ...) text` chunks the model expects, plus the full
/// `CitationSource` list to attach to the final answer.
///
/// v1: keyword search via ContentRegistry. v2: pgvector + OpenAI embeddings.
public struct RAGRetriever: Sendable {
    private let registry: ContentRegistry

    public init(registry: ContentRegistry = .shared) {
        self.registry = registry
    }

    public struct Result: Sendable {
        public let formattedContext: String
        public let citations: [CitationSource]
        public let entries: [LibraryEntry]
        public let confidenceFloor: Bool      // true when fewer than 1 entry matched
    }

    public func retrieve(for query: String, limit: Int = 5, specialty: NursingSpecialty? = nil) -> Result {
        let entries = registry.search(query, limit: limit, specialty: specialty)
        if entries.isEmpty {
            return Result(formattedContext: "No relevant library entries were found for this question.", citations: [], entries: [], confidenceFloor: true)
        }

        var chunks: [String] = []
        var citationOrder: [CitationSource] = []
        var seenCitationIDs = Set<String>()

        // IMPORTANT: assign citation IDs per-SOURCE, not per-chunk. Multiple chunks
        // can share the same `[cNNN]` if they come from the same source. This keeps
        // IDs stable, low-numbered, and trivially mappable to the citations array
        // by `cNNN → citations[N-1]` on the client.
        func idForSource(_ source: CitationSource) -> Int {
            if let existing = citationOrder.firstIndex(where: { $0.id == source.id }) {
                return existing + 1
            }
            citationOrder.append(source)
            seenCitationIDs.insert(source.id)
            return citationOrder.count
        }

        for (entryIdx, entry) in entries.enumerated() {
            let entryChunks = formatEntry(entry, startingCitationIndex: chunks.count)
            for (chunkText, sources) in entryChunks {
                // Skip sourceless chunks — we don't want the model citing [c000].
                guard let primarySource = sources.first else { continue }
                let primaryID = idForSource(primarySource)
                let chunkID = String(format: "c%03d", primaryID)
                chunks.append("[\(chunkID)] (source: \(primarySource.shortName)) \(chunkText)")
                // Register secondary sources so they appear in the references list.
                for source in sources.dropFirst() where !seenCitationIDs.contains(source.id) {
                    _ = idForSource(source)
                }
            }
            if entryIdx < entries.count - 1 {
                chunks.append("---")
            }
        }

        return Result(
            formattedContext: chunks.joined(separator: "\n"),
            citations: citationOrder,
            entries: entries,
            confidenceFloor: false
        )
    }

    /// Returns ordered (chunk_text, sources) pairs for one library entry,
    /// flattened from whatever typed structure the entry has.
    private func formatEntry(_ entry: LibraryEntry, startingCitationIndex: Int) -> [(String, [CitationSource])] {
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
            "\(d.title) (\(d.category)\(d.isHighAlert ? ", ISMP high-alert" : "")). Indications: \(d.indications.text)",
            sources(d.indications.citationIDs, in: d.citations)
        ))
        out.append(("Mechanism: \(d.mechanism.text)", sources(d.mechanism.citationIDs, in: d.citations)))
        for block in d.dosing {
            out.append(("Dosing — \(block.label): \(block.body)", sources(block.citationIDs, in: d.citations)))
        }
        if let contras = d.contraindications {
            out.append(("Contraindications: \(contras.text)", sources(contras.citationIDs, in: d.citations)))
        }
        for warn in d.warnings.prefix(4) {
            out.append(("Warning: \(warn.text)", sources(warn.citationIDs, in: d.citations)))
        }
        out.append(("Adverse reactions: \(d.adverseReactions.text)", sources(d.adverseReactions.citationIDs, in: d.citations)))
        for inter in d.drugInteractions.prefix(3) {
            out.append(("Drug interaction: \(inter.text)", sources(inter.citationIDs, in: d.citations)))
        }
        if let nursing = d.nursingImplications {
            for bullet in nursing.prefix(6) {
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
            out.append(("  \(row.value) — \(row.label)", sources(row.citationIDs, in: l.citations)))
        }
        for tier in l.interpretationTiers {
            out.append(("\(tier.label): \(tier.summary)", sources(tier.citationIDs, in: l.citations)))
            for action in tier.nursingActions.prefix(4) {
                out.append(("  Nursing action: \(action)", sources(tier.citationIDs, in: l.citations)))
            }
        }
        for group in l.commonCauses.prefix(2) {
            out.append(("\(group.title): \(group.causes.joined(separator: "; "))", sources(group.citationIDs, in: l.citations)))
        }
        if let actions = l.nursingActions {
            for bullet in actions.prefix(4) {
                out.append(("Nursing action: \(bullet.text)", sources(bullet.citationIDs, in: l.citations)))
            }
        }
        return out
    }

    private func formatProcedure(_ p: ProcedureEntry) -> [(String, [CitationSource])] {
        var out: [(String, [CitationSource])] = []
        out.append(("\(p.title). Indications: \(p.indications.text)", sources(p.indications.citationIDs, in: p.citations)))
        for step in p.steps.prefix(5) {
            let title = step.title.map { "\($0): " } ?? ""
            out.append(("Step \(step.number) — \(title)\(step.body)", sources(step.citationIDs, in: p.citations)))
        }
        for watch in p.watchFor?.prefix(3) ?? [] {
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
        for sign in dx.presentation.prefix(5) {
            out.append(("Presentation: \(sign.text)", sources(sign.citationIDs, in: dx.citations)))
        }
        if let assess = dx.priorityAssessments {
            for a in assess.prefix(4) {
                out.append(("Priority assessment: \(a.text)", sources(a.citationIDs, in: dx.citations)))
            }
        }
        if let interv = dx.commonInterventions {
            for i in interv.prefix(5) {
                out.append(("Common intervention: \(i.text)", sources(i.citationIDs, in: dx.citations)))
            }
        }
        return out
    }

    private func formatReference(_ r: ReferenceEntry) -> [(String, [CitationSource])] {
        var out: [(String, [CitationSource])] = []
        out.append(("\(r.title) [\(r.eyebrow)]", []))
        for section in r.sections.prefix(4) {
            switch section {
            case .prose(let title, let prose):
                out.append(("\(title): \(prose.text)", sources(prose.citationIDs, in: r.citations)))
            case .bullets(let title, let bullets):
                let collected = bullets.prefix(6).map(\.text).joined(separator: " | ")
                let allCitations = bullets.flatMap(\.citationIDs)
                out.append(("\(title): \(collected)", sources(allCitations, in: r.citations)))
            case .keyValueTable(let title, let rows):
                let collected = rows.prefix(8).map { "\($0.key) → \($0.value)" }.joined(separator: "; ")
                out.append(("\(title): \(collected)", []))
            case .numberedSteps(let title, let steps, let citIDs):
                let collected = steps.prefix(6).enumerated().map { "\($0.offset+1). \($0.element)" }.joined(separator: " ")
                out.append(("\(title): \(collected)", sources(citIDs, in: r.citations)))
            }
        }
        return out
    }

    private func sources(_ ids: [String], in pool: [CitationSource]) -> [CitationSource] {
        ids.compactMap { id in pool.first(where: { $0.id == id }) }
    }
}
