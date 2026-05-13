import Foundation

/// Library-grounded mock for the AI co-pilot. Behavior:
///   1. Run the question through PHIScrubber.
///   2. Detect refusal categories (diagnosis, prescribing, non-clinical, etc.).
///   3. Match against the bundled library — if a topic matches, stream a
///      curator-style answer composed of cited sentences from the matched entry.
///   4. Otherwise emit a low-confidence refusal.
///
/// The mock NEVER fabricates clinical content. Every streamed answer references
/// content that already exists in the library, with the entry's citations attached.
public final class MockAskService: AskService, @unchecked Sendable {
    private let registry: ContentRegistry
    private let chunkDelayNs: UInt64
    private let chunkSize: Int

    public init(
        registry: ContentRegistry = .shared,
        chunkDelayNs: UInt64 = 25_000_000,    // 25ms — feels like a real LLM
        chunkSize: Int = 4
    ) {
        self.registry = registry
        self.chunkDelayNs = chunkDelayNs
        self.chunkSize = chunkSize
    }

    public func stream(
        question: String,
        conversationContext: [AskMessage],
        specialty: NursingSpecialty? = nil,
        icuSubspecialty: ICUSubspecialty? = nil
    ) -> AsyncThrowingStream<AskEvent, Error> {
        AsyncThrowingStream { continuation in
            Task {
                do {
                    // 1. PHI scrub
                    let scrub = PHIScrubber.scrub(question)
                    if scrub.redacted {
                        continuation.yield(.phiNotice)
                    }

                    // 2. Classify
                    if let refusal = MockAskService.classifyRefusal(scrub.scrubbed) {
                        continuation.yield(.refusal(refusal, citations: []))
                        continuation.yield(.done)
                        continuation.finish()
                        return
                    }

                    // 3. Library match
                    let results = registry.search(scrub.scrubbed, limit: 3, specialty: specialty)
                    guard let primary = results.first else {
                        continuation.yield(.refusal(.lowConfidence, citations: []))
                        continuation.yield(.done)
                        continuation.finish()
                        return
                    }

                    // 4. Compose a curator answer from the matched entry's actual fields
                    let response = MockAskService.composeAnswer(for: primary, query: scrub.scrubbed)

                    // 5. Emit citations BEFORE streaming so inline chips resolve in real time
                    continuation.yield(.citations(response.citations))
                    continuation.yield(.libraryEntries(results.map { $0.id }))

                    // 6. Stream
                    try await streamText(response.text, continuation: continuation)
                    continuation.yield(.done)
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }
        }
    }

    private func streamText(_ text: String, continuation: AsyncThrowingStream<AskEvent, Error>.Continuation) async throws {
        var buffer = ""
        for char in text {
            buffer.append(char)
            if buffer.count >= chunkSize {
                continuation.yield(.delta(buffer))
                buffer.removeAll(keepingCapacity: true)
                try await Task.sleep(nanoseconds: chunkDelayNs)
            }
        }
        if !buffer.isEmpty {
            continuation.yield(.delta(buffer))
        }
    }

    // MARK: - Classification

    static func classifyRefusal(_ q: String) -> RefusalType? {
        let lower = q.lowercased()

        // Diagnostic — "what does the patient have", "is this X"
        let diagnosticPatterns = [
            "what does the patient have",
            "what does my patient have",
            "is this sepsis",
            "is this an mi",
            "diagnose",
            "does my patient have",
            "what's wrong with"
        ]
        if diagnosticPatterns.contains(where: { lower.contains($0) }) {
            return .diagnostic
        }

        // Prescribing — "should I give", "what dose for X"
        let prescribingPatterns = [
            "should i give",
            "should we give",
            "what dose should i administer",
            "is it ok to give",
            "can i give"
        ]
        if prescribingPatterns.contains(where: { lower.contains($0) }) {
            return .prescribing
        }

        // Patient-facing — "tell my mom", "for my dad", "should I take"
        let patientPatterns = [
            "tell my mom",
            "tell my dad",
            "tell my husband",
            "tell my wife",
            "for my mother",
            "for my father",
            "should i take",
            "is this drug safe for me"
        ]
        if patientPatterns.contains(where: { lower.contains($0) }) {
            return .patientFacing
        }

        // Non-clinical — common off-topic stems
        let nonClinicalPatterns = [
            "weather",
            "stock market",
            "movie",
            "recipe",
            "vacation",
            "joke",
            "song lyric"
        ]
        if nonClinicalPatterns.contains(where: { lower.contains($0) }) {
            return .nonClinical
        }

        return nil
    }

    // MARK: - Answer composition

    struct ComposedAnswer {
        let text: String
        let citations: [CitationSource]
    }

    static func composeAnswer(for entry: LibraryEntry, query: String) -> ComposedAnswer {
        switch entry {
        case .drug(let d), .drip(let d):
            return composeForDrug(d, query: query)
        case .lab(let l):
            return composeForLab(l, query: query)
        case .procedure(let p):
            return composeForProcedure(p, query: query)
        case .diagnosis(let dx):
            return composeForDiagnosis(dx, query: query)
        case .reference(let r), .communication(let r), .scenario(let r):
            return composeForReference(r, query: query)
        }
    }

    private static func composeForDrug(_ drug: DrugEntry, query: String) -> ComposedAnswer {
        var lines: [String] = []
        let q = query.lowercased()

        lines.append("\(drug.title) — \(drug.category.lowercased()).")
        if q.contains("dose") || q.contains("dosing") || q.contains("how much") {
            lines.append("")
            lines.append("Dosing per FDA labeling:")
            for block in drug.dosing.prefix(2) {
                lines.append("• \(block.label): \(block.body)")
            }
        }
        if q.contains("monitor") || q.contains("watch") || q.contains("nursing") || q.contains("how do i") {
            if let nursing = drug.nursingImplications {
                lines.append("")
                lines.append("Key nursing implications:")
                for bullet in nursing.prefix(4) {
                    lines.append("• \(bullet.text)")
                }
            }
        }
        if drug.isHighAlert {
            lines.append("")
            lines.append("⌐ This is on the ISMP high-alert list — two-nurse independent verification is the standard for parenteral doses.")
        }
        if lines.count <= 2 {
            // Default: indication + key warning
            lines.append("")
            lines.append("Indications: \(drug.indications.text)")
            if let firstWarning = drug.warnings.first {
                lines.append("")
                lines.append("Top warning: \(firstWarning.text)")
            }
        }
        lines.append("")
        lines.append("Reference only — always follow your facility's policies and verify with your provider.")
        return ComposedAnswer(text: lines.joined(separator: "\n"), citations: drug.citations)
    }

    private static func composeForLab(_ lab: LabEntry, query: String) -> ComposedAnswer {
        var lines: [String] = []
        lines.append("\(lab.title) — \(lab.specimen).")
        lines.append("")
        lines.append("Reference range:")
        for row in lab.referenceRanges.prefix(4) {
            lines.append("• \(row.value) — \(row.label)")
        }

        // If query mentions a value, try to slot it into an interpretation tier
        let q = query.lowercased()
        if q.contains("interpret") || q.contains("mean") || q.contains("what is") || q.contains("of") {
            if let tier = lab.interpretationTiers.first(where: { tier in
                q.contains(tier.severity.rawValue.lowercased())
            }) ?? lab.interpretationTiers.first {
                lines.append("")
                lines.append("\(tier.label): \(tier.summary)")
                if !tier.nursingActions.isEmpty {
                    lines.append("")
                    lines.append("Nursing actions:")
                    for action in tier.nursingActions.prefix(4) {
                        lines.append("• \(action)")
                    }
                }
            }
        }

        lines.append("")
        lines.append("Reference intervals vary by laboratory and assay. Always verify against your facility's reported reference range.")
        return ComposedAnswer(text: lines.joined(separator: "\n"), citations: lab.citations)
    }

    private static func composeForProcedure(_ proc: ProcedureEntry, query: String) -> ComposedAnswer {
        var lines: [String] = []
        lines.append("\(proc.title).")
        lines.append("")
        lines.append("Indications: \(proc.indications.text)")
        lines.append("")
        lines.append("Steps (abbreviated):")
        for step in proc.steps.prefix(4) {
            let label = step.title.map { " — \($0)" } ?? ""
            lines.append("\(step.number).\(label) \(step.body.prefix(140))…")
        }
        lines.append("")
        lines.append("Open the procedure entry in the Library for the full step-by-step.")
        return ComposedAnswer(text: lines.joined(separator: "\n"), citations: proc.citations)
    }

    private static func composeForDiagnosis(_ dx: DiagnosisEntry, query: String) -> ComposedAnswer {
        var lines: [String] = []
        lines.append("\(dx.title).")
        lines.append("")
        lines.append("Definition: \(dx.definition.text)")
        if !dx.presentation.isEmpty {
            lines.append("")
            lines.append("Common presentation:")
            for bullet in dx.presentation.prefix(4) {
                lines.append("• \(bullet.text)")
            }
        }
        if let assessments = dx.priorityAssessments, !assessments.isEmpty {
            lines.append("")
            lines.append("Priority assessments:")
            for bullet in assessments.prefix(3) {
                lines.append("• \(bullet.text)")
            }
        }
        lines.append("")
        lines.append("Reference only — diagnosis and orders are the provider's call.")
        return ComposedAnswer(text: lines.joined(separator: "\n"), citations: dx.citations)
    }

    private static func composeForReference(_ ref: ReferenceEntry, query: String) -> ComposedAnswer {
        var lines: [String] = []
        lines.append("\(ref.title).")
        for section in ref.sections.prefix(2) {
            switch section {
            case .prose(let title, let prose):
                lines.append("")
                lines.append("\(title): \(prose.text)")
            case .bullets(let title, let bullets):
                lines.append("")
                lines.append("\(title):")
                for b in bullets.prefix(4) {
                    lines.append("• \(b.text)")
                }
            case .keyValueTable(let title, let rows):
                lines.append("")
                lines.append(title)
                for row in rows.prefix(4) {
                    lines.append("• \(row.key) — \(row.value)")
                }
            case .numberedSteps(let title, let steps, _):
                lines.append("")
                lines.append("\(title):")
                for (i, s) in steps.prefix(4).enumerated() {
                    lines.append("\(i+1). \(s)")
                }
            }
        }
        return ComposedAnswer(text: lines.joined(separator: "\n"), citations: ref.citations)
    }
}
