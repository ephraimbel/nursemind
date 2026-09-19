import Foundation

/// Anthropic transport. Production requires the server's v2 safety contract;
/// direct mode is reserved for development and uses the local validation gate.
public struct AnthropicClient: Sendable {

    /// Where the request goes and how it authenticates. Selecting at init
    /// time means the streaming hot path never branches on transport.
    public enum Mode: Sendable {
        /// Send directly to api.anthropic.com with the provided key. Use only
        /// in DEBUG builds where the key is gitignored.
        case direct(apiKey: String)
        /// Send through the Supabase Edge Function. `tokenProvider` returns
        /// the current Supabase JWT (refreshed transparently by the SDK).
        /// Missing auth produces an explicit service-unavailable response.
        case proxy(endpoint: URL, tokenProvider: @Sendable () async -> String?)
    }
    public enum Model: String, Sendable {
        case sonnet45 = "claude-sonnet-4-5"
        case haiku45  = "claude-haiku-4-5-20251001"

        public var displayName: String {
            switch self {
            case .sonnet45: return "Claude Sonnet 4.5"
            case .haiku45:  return "Claude Haiku 4.5"
            }
        }
    }

    public enum ClientError: Error, LocalizedError {
        case missingAPIKey
        case requestFailed(status: Int, body: String)
        case invalidResponse
        case streamCancelled

        public var errorDescription: String? {
            switch self {
            case .missingAPIKey:           return "Anthropic API key not configured."
            case .requestFailed(let s, let b): return "API error (HTTP \(s)): \(b)"
            case .invalidResponse:         return "Invalid response from API."
            case .streamCancelled:         return "Stream cancelled."
            }
        }
    }

    public struct Message: Codable, Sendable {
        public let role: String   // "user" or "assistant"
        public let content: String
        public init(role: String, content: String) {
            self.role = role
            self.content = content
        }
    }

    public struct Request: Codable, Sendable {
        public let model: String
        public let max_tokens: Int
        public let temperature: Double
        public let system: String
        public let messages: [Message]
        public let stream: Bool
    }

    /// Array-form request used when one or more system blocks carry a
    /// `cache_control` directive. Anthropic accepts the system field as either
    /// a string or `[SystemBlock]`; we keep both shapes so non-cached callers
    /// pay zero overhead and don't need to migrate.
    struct CachedRequest: Codable {
        let model: String
        let max_tokens: Int
        let temperature: Double
        let system: [SystemBlock]
        let messages: [Message]
        let stream: Bool
    }

    public struct SystemBlock: Codable, Sendable {
        public let type: String                   // always "text" for our use
        public let text: String
        public let cache_control: CacheControl?

        public init(text: String, cached: Bool) {
            self.type = "text"
            self.text = text
            self.cache_control = cached ? CacheControl(type: "ephemeral") : nil
        }

        public struct CacheControl: Codable, Sendable {
            public let type: String               // "ephemeral" — 5-minute TTL
        }
    }

    /// Proxy wire contract. 3 streams stage, follow-up and refusal events
    /// on an open response; the server keeps answering 2 for older builds.
    static let contract = "3"

    var usesProxy: Bool {
        if case .proxy = mode { return true }
        return false
    }

    private let mode: Mode
    private let urlSession: URLSession

    /// DEBUG-only convenience: direct-mode client with the provided key.
    public init(apiKey: String, urlSession: URLSession = .shared) {
        self.mode = .direct(apiKey: apiKey)
        self.urlSession = urlSession
    }

    /// Production-mode client: routes through the Supabase Edge Function.
    /// `tokenProvider` is invoked per request so the latest JWT is used
    /// (the SDK refreshes silently as it nears expiration).
    public init(
        proxyEndpoint: URL,
        tokenProvider: @escaping @Sendable () async -> String?,
        urlSession: URLSession = .shared
    ) {
        self.mode = .proxy(endpoint: proxyEndpoint, tokenProvider: tokenProvider)
        self.urlSession = urlSession
    }

    private var endpoint: URL {
        switch mode {
        case .direct:                 return URL(string: "https://api.anthropic.com/v1/messages")!
        case .proxy(let url, _):      return url
        }
    }

    /// Apply the right auth headers for this client's mode. Async because the
    /// proxy path may have to await a JWT refresh; direct mode is synchronous
    /// in practice but stays async to keep the call site uniform.
    private func applyAuthHeaders(to request: inout URLRequest) async {
        switch mode {
        case .direct(let key):
            request.setValue(key, forHTTPHeaderField: "x-api-key")
            request.setValue("2023-06-01", forHTTPHeaderField: "anthropic-version")
        case .proxy(_, let tokenProvider):
            request.setValue(Self.contract, forHTTPHeaderField: "x-nursemind-contract")
            if let token = await tokenProvider() {
                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            }
        }
    }

    // MARK: - Connection warm-up

    /// Fire-and-forget OPTIONS to the endpoint. The response is irrelevant —
    /// the point is that DNS resolution, the TLS handshake, and (in proxy
    /// mode) the edge function cold start all happen before the user hits
    /// send, so the first real request rides an already-warm connection.
    public func warmUp() async {
        var request = URLRequest(url: endpoint)
        request.httpMethod = "OPTIONS"
        request.timeoutInterval = 5
        _ = try? await urlSession.data(for: request)
    }

    public func streamMessage(
        model: Model,
        system: String,
        messages: [Message],
        maxTokens: Int = 1024,
        temperature: Double = 0.2
    ) -> AsyncThrowingStream<String, Error> {
        let events = makeStream(body: try? JSONEncoder().encode(Request(model: model.rawValue, max_tokens: maxTokens,
            temperature: temperature, system: system, messages: messages, stream: true)))
        return AsyncThrowingStream { continuation in
            let task = Task {
                do {
                    for try await event in events {
                        if case .text(let text) = event { continuation.yield(text) }
                    }
                    continuation.finish()
                } catch { continuation.finish(throwing: error) }
            }
            continuation.onTermination = { _ in task.cancel() }
        }
    }

    func streamAnswer(
        model: Model,
        cachedSystem: String,
        dynamicSystem: String,
        messages: [Message],
        maxTokens: Int = 1024,
        temperature: Double = 0.2
    ) -> AsyncThrowingStream<AnswerStreamEvent, Error> {
        // Haiku 4.5 needs 4,096 prefix tokens for caching. Do not pad short prompts to claim cache savings.
        makeStream(body: try? JSONEncoder().encode(CachedRequest(model: model.rawValue, max_tokens: maxTokens,
            temperature: temperature, system: [SystemBlock(text: cachedSystem, cached: false),
                                              SystemBlock(text: dynamicSystem, cached: false)],
            messages: messages, stream: true)))
    }

    private func makeStream(body: Data?) -> AsyncThrowingStream<AnswerStreamEvent, Error> {
        AsyncThrowingStream { continuation in
            let task = Task {
                do {
                    guard let body else { throw ClientError.invalidResponse }
                    var request = URLRequest(url: endpoint)
                    request.httpMethod = "POST"
                    request.timeoutInterval = 65
                    await applyAuthHeaders(to: &request)
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.setValue("text/event-stream", forHTTPHeaderField: "Accept")
                    request.httpBody = body
                    let (bytes, response) = try await urlSession.bytes(for: request)
                    guard let http = response as? HTTPURLResponse else { throw ClientError.invalidResponse }
                    if http.statusCode != 200 {
                        var errorBody = ""
                        for try await line in bytes.lines {
                            errorBody += line
                            if errorBody.count > 2_000 { break }
                        }
                        throw ClientError.requestFailed(status: http.statusCode, body: errorBody)
                    }
                    if usesProxy && http.value(forHTTPHeaderField: "x-nursemind-contract") != Self.contract {
                        throw ClientError.invalidResponse
                    }
                    var parser = MessageStreamParser()
                    var sentEvidence = false
                    for try await line in bytes.lines {
                        try Task.checkCancellation()
                        let delta = try parser.consume(line)
                        if let evidence = parser.evidence, !sentEvidence {
                            guard usesProxy else { throw ClientError.invalidResponse }
                            continuation.yield(.evidence(evidence))
                            sentEvidence = true
                        }
                        for event in parser.drainPending() {
                            guard usesProxy else { throw ClientError.invalidResponse }
                            continuation.yield(event)
                        }
                        if let delta { continuation.yield(.text(delta)) }
                    }
                    guard parser.isComplete else { throw ClientError.invalidResponse }
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }
            continuation.onTermination = { _ in task.cancel() }
        }
    }

    // MARK: - Single-shot non-streaming (for short classification calls)

    public func completeMessage(
        model: Model,
        system: String,
        messages: [Message],
        maxTokens: Int = 64,
        temperature: Double = 0.0
    ) async throws -> String {
        let request = Request(
            model: model.rawValue,
            max_tokens: maxTokens,
            temperature: temperature,
            system: system,
            messages: messages,
            stream: false
        )
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = "POST"
        urlRequest.timeoutInterval = 20
        await applyAuthHeaders(to: &urlRequest)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try JSONEncoder().encode(request)

        let (data, response) = try await urlSession.data(for: urlRequest)
        guard let http = response as? HTTPURLResponse else { throw ClientError.invalidResponse }
        if http.statusCode != 200 {
            let body = String(data: data, encoding: .utf8) ?? "<non-text body>"
            throw ClientError.requestFailed(status: http.statusCode, body: body)
        }

        // Anthropic non-streaming response shape: { content: [ { type: "text", text: "..." } ], ... }
        struct CompletionResponse: Decodable {
            struct Block: Decodable { let type: String; let text: String? }
            let content: [Block]
            let stop_reason: String?
        }
        let decoded = try JSONDecoder().decode(CompletionResponse.self, from: data)
        guard decoded.stop_reason == "end_turn" else { throw ClientError.invalidResponse }
        let combined = decoded.content.compactMap { $0.text }.joined()
        return combined.trimmingCharacters(in: .whitespacesAndNewlines)
    }

}
