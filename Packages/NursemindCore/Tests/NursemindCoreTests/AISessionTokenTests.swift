import Foundation
import Testing
@testable import NursemindCore

@Suite("AI startup session fallback")
struct AISessionTokenTests {
    @MainActor @Test func fallbackRequiresAnUnexpiredToken() throws {
        func token(_ expiration: Any) throws -> String {
            let data = try JSONSerialization.data(withJSONObject: ["exp": expiration])
            let payload = data.base64EncodedString().replacingOccurrences(of: "+", with: "-")
                .replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: "=", with: "")
            return "header.\(payload).signature"
        }
        let now = Date(timeIntervalSince1970: 1000)
        #expect(SupabaseService.tokenIsUnexpired(try token(2000), now: now))
        #expect(!SupabaseService.tokenIsUnexpired(try token(900), now: now))
        #expect(!SupabaseService.tokenIsUnexpired(try token(1010), now: now))
        #expect(!SupabaseService.tokenIsUnexpired(try token("invalid"), now: now))
        #expect(!SupabaseService.tokenIsUnexpired("invalid", now: now))
    }
}
