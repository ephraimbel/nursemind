import Foundation

/// Minimal streaming client for Anthropic's Messages API. Handles the SSE wire
/// format and exposes an `AsyncThrowingStream<String, Error>` of text deltas.
///
/// Two transport modes:
///   - `.direct`: hits api.anthropic.com directly with `x-api-key`.
///                DEBUG-only — any key shipped in an iOS bundle is extractable
///                via reverse engineering, so this path must NOT be used in
///                App Store / TestFlight builds.
///   - `.proxy`:  hits a Supabase Edge Function (`/functions/v1/ai-chat`)
///                with `Authorization: Bearer <supabase-jwt>`. The function
///                authenticates the caller, then forwards the unmodified
///                request body to Anthropic with the project-secret API key.
///                Streaming SSE is preserved end-to-end with no buffering.
///
/// The request body shape and SSE response format are identical in both modes —
/// the proxy is a transparent pass-through, so prompt caching, system block
/// arrays, model selection, and any future Anthropic-API additions all work
/// without code changes here.
public struct AnthropicClient: Sendable {

    /// Where the request goes and how it authenticates. Selecting at init
    /// time means the streaming hot path never branches on transport.
    public enum Mode: Sendable {
        /// Send directly to api.anthropic.com with the provided key. Use only
        /// in DEBUG builds where the key is gitignored.
        case direct(apiKey: String)
        /// Send through the Supabase Edge Function. `tokenProvider` returns
        /// the current Supabase JWT (refreshed transparently by the SDK).
        /// Returns nil when offline / not signed in — request fails cleanly
        /// in that case and the AskService falls back to MockAskService.
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
            if let token = await tokenProvider() {
                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            }
        }
    }

    // MARK: - Streaming generation

    public func streamMessage(
        model: Model,
        system: String,
        messages: [Message],
        maxTokens: Int = 1024,
        temperature: Double = 0.2
    ) -> AsyncThrowingStream<String, Error> {
        AsyncThrowingStream { continuation in
            let task = Task {
                do {
                    let request = Request(
                        model: model.rawValue,
                        max_tokens: maxTokens,
                        temperature: temperature,
                        system: system,
                        messages: messages,
                        stream: true
                    )
                    var urlRequest = URLRequest(url: endpoint)
                    urlRequest.httpMethod = "POST"
                    await applyAuthHeaders(to: &urlRequest)
                    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    urlRequest.setValue("text/event-stream", forHTTPHeaderField: "Accept")
                    urlRequest.httpBody = try JSONEncoder().encode(request)

                    let (bytes, response) = try await urlSession.bytes(for: urlRequest)

                    guard let http = response as? HTTPURLResponse else {
                        throw ClientError.invalidResponse
                    }

                    if http.statusCode != 200 {
                        // Drain bytes for error body
                        var body = ""
                        for try await line in bytes.lines {
                            body += line + "\n"
                            if body.count > 2000 { break }
                        }
                        throw ClientError.requestFailed(status: http.statusCode, body: body)
                    }

                    for try await line in bytes.lines {
                        try Task.checkCancellation()
                        guard line.hasPrefix("data: ") else { continue }
                        let payload = String(line.dropFirst(6))
                        if payload == "[DONE]" { break }
                        if let delta = parseTextDelta(payload) {
                            continuation.yield(delta)
                        }
                    }

                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }
            continuation.onTermination = { _ in task.cancel() }
        }
    }

    // MARK: - Streaming generation with prompt caching

    /// Streaming variant that splits the system prompt into a stable cached
    /// prefix and a per-request dynamic suffix. Anthropic charges ~10% of
    /// normal input rates for cached tokens after the initial write, with
    /// a 5-minute TTL refreshed on every cache hit.
    ///
    /// Caching only triggers when the cached block exceeds the model's
    /// minimum (1024 tokens for Sonnet 4.x, 2048 for Haiku 4.x). For shorter
    /// prefixes the directive is silently ignored — Anthropic returns
    /// `cache_creation_input_tokens: 0` and the request bills as uncached.
    public func streamMessage(
        model: Model,
        cachedSystem: String,
        dynamicSystem: String,
        messages: [Message],
        maxTokens: Int = 1024,
        temperature: Double = 0.2
    ) -> AsyncThrowingStream<String, Error> {
        AsyncThrowingStream { continuation in
            let task = Task {
                do {
                    let request = CachedRequest(
                        model: model.rawValue,
                        max_tokens: maxTokens,
                        temperature: temperature,
                        system: [
                            SystemBlock(text: cachedSystem, cached: true),
                            SystemBlock(text: dynamicSystem, cached: false)
                        ],
                        messages: messages,
                        stream: true
                    )
                    var urlRequest = URLRequest(url: endpoint)
                    urlRequest.httpMethod = "POST"
                    await applyAuthHeaders(to: &urlRequest)
                    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    urlRequest.setValue("text/event-stream", forHTTPHeaderField: "Accept")
                    urlRequest.httpBody = try JSONEncoder().encode(request)

                    let (bytes, response) = try await urlSession.bytes(for: urlRequest)

                    guard let http = response as? HTTPURLResponse else {
                        throw ClientError.invalidResponse
                    }
                    if http.statusCode != 200 {
                        var body = ""
                        for try await line in bytes.lines {
                            body += line + "\n"
                            if body.count > 2000 { break }
                        }
                        throw ClientError.requestFailed(status: http.statusCode, body: body)
                    }

                    for try await line in bytes.lines {
                        try Task.checkCancellation()
                        guard line.hasPrefix("data: ") else { continue }
                        let payload = String(line.dropFirst(6))
                        if payload == "[DONE]" { break }
                        if let delta = parseTextDelta(payload) {
                            continuation.yield(delta)
                        }
                    }
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
        }
        let decoded = try JSONDecoder().decode(CompletionResponse.self, from: data)
        let combined = decoded.content.compactMap { $0.text }.joined()
        return combined.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    // MARK: - SSE parsing

    private func parseTextDelta(_ json: String) -> String? {
        guard let data = json.data(using: .utf8) else { return nil }
        // We only care about content_block_delta events with text_delta type
        struct StreamEvent: Decodable {
            struct Delta: Decodable { let type: String?; let text: String? }
            let type: String
            let delta: Delta?
        }
        guard let event = try? JSONDecoder().decode(StreamEvent.self, from: data) else { return nil }
        guard event.type == "content_block_delta", event.delta?.type == "text_delta" else { return nil }
        return event.delta?.text
    }
}
