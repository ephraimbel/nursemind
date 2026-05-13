import Foundation

/// Streaming clinical-question answer service. Production implementation uses a
/// Supabase Edge Function calling Claude with RAG over the curated corpus. The
/// mock implementation below grounds responses directly in the bundled library
/// so the chat UX can be developed and tested without server infra.
public protocol AskService: Sendable {
    /// Streams the response for a question. Yielded events:
    /// - `.phiNotice` once if the input was scrubbed
    /// - `.refusal(type)` for any of the 6 refusal templates (no .delta after this)
    /// - `.delta(text)` for streaming content chunks
    /// - `.citations([...])` once near the end with sources
    /// - `.libraryEntries([id])` once with grounded entry IDs
    /// - `.done` when finished
    ///
    /// `specialty` is an optional retrieval hint — when present, library entries
    /// matching the active specialty get a soft re-rank boost. Never excludes content.
    /// `icuSubspecialty` further refines the system prompt when `specialty == .icu`
    /// (e.g., Neuro ICU vs CTICU); ignored otherwise.
    func stream(
        question: String,
        conversationContext: [AskMessage],
        specialty: NursingSpecialty?,
        icuSubspecialty: ICUSubspecialty?
    ) -> AsyncThrowingStream<AskEvent, Error>
}

public extension AskService {
    /// Default conformance for callers that don't pass a specialty.
    func stream(question: String, conversationContext: [AskMessage]) -> AsyncThrowingStream<AskEvent, Error> {
        stream(question: question, conversationContext: conversationContext, specialty: nil, icuSubspecialty: nil)
    }
}

public enum AskEvent: Sendable {
    case phiNotice
    case refusal(RefusalType, citations: [CitationSource])
    case delta(String)
    case citations([CitationSource])
    case libraryEntries([String])    // entry IDs from the RAG retrieval — surfaced as deep-dive chips
    case done
}
