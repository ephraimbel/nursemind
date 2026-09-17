import Testing
@testable import NursemindCore

@Suite("Meta advertising consent and event ownership")
@MainActor
struct MetaAnalyticsTests {
    @Test func noTrackingBeforeConsentAndNoReplayAfterConsent() {
        let recorder = Recorder()
        let service = recorder.service()
        service.applicationDidBecomeActive()
        service.trackCheckoutStarted()
        #expect(recorder.calls.allSatisfy { $0 == "clear" })

        recorder.authorized = true
        service.applicationDidBecomeActive()
        #expect(recorder.calls.filter { $0 == "initialize" }.count == 1)
        #expect(recorder.calls.filter { $0 == "activate" }.count == 1)
        #expect(!recorder.calls.contains { $0.hasPrefix("event:") })
    }

    @Test func revokingConsentStopsEventsAndRemovesMetaMatchingAttribute() {
        let recorder = Recorder()
        recorder.authorized = true
        let service = recorder.service()
        service.applicationDidBecomeActive()
        recorder.calls.removeAll()
        recorder.authorized = false
        service.trackCheckoutStarted()
        #expect(recorder.calls == ["identifiers:false", "clear"])
    }

    @Test func foregroundActivationIsOncePerSession() {
        let recorder = Recorder()
        recorder.authorized = true
        let service = recorder.service()
        service.applicationDidBecomeActive()
        service.applicationDidBecomeActive()
        #expect(recorder.calls.filter { $0 == "activate" }.count == 1)
        service.applicationDidEnterBackground()
        recorder.active = false
        service.applicationDidBecomeActive()
        #expect(recorder.calls.filter { $0 == "activate" }.count == 1)
        recorder.active = true
        service.applicationDidBecomeActive()
        #expect(recorder.calls.filter { $0 == "activate" }.count == 2)
        #expect(recorder.calls.filter { $0 == "initialize" }.count == 1)
    }

    @Test func checkoutIsAnIntentEventAndSynchronizesIdentifiersFirst() {
        let recorder = Recorder()
        recorder.authorized = true
        let service = recorder.service()
        service.trackCheckoutStarted()
        #expect(recorder.calls == [
            "initialize", "identifiers:true", "synchronize",
            "event:fb_mobile_initiated_checkout", "flush"
        ])
        recorder.calls.removeAll()
        service.synchronizeAttribution()
        #expect(recorder.calls == ["identifiers:true", "synchronize"])
    }

    @Test func absentConfigurationOrRevenueCatPreventsInitialization() {
        let recorder = Recorder()
        recorder.authorized = true
        let service = recorder.service(configured: false)
        service.trackCheckoutStarted()
        #expect(recorder.calls.isEmpty)
        service.configure(appID: "test", clientToken: "test")
        recorder.purchasesConfigured = false
        service.trackCheckoutStarted()
        #expect(recorder.calls.isEmpty)
        recorder.purchasesConfigured = true
        service.trackCheckoutStarted()
        #expect(recorder.calls.contains("event:fb_mobile_initiated_checkout"))
    }

    @MainActor
    private final class Recorder {
        var authorized = false
        var active = true
        var purchasesConfigured = true
        var calls: [String] = []

        func service(configured: Bool = true) -> MetaAnalyticsService {
            let service = MetaAnalyticsService(dependencies: .init(
                authorized: { self.authorized },
                active: { self.active },
                purchasesConfigured: { self.purchasesConfigured },
                initialize: { _, _ in self.calls.append("initialize") },
                enableIdentifiers: { self.calls.append("identifiers:\($0)") },
                synchronizeIdentifiers: { self.calls.append("synchronize") },
                clearAnonymousID: { self.calls.append("clear") },
                activate: { self.calls.append("activate") },
                log: { self.calls.append("event:\($0.rawValue)") },
                flush: { self.calls.append("flush") }
            ))
            if configured {
                service.configure(appID: "test", clientToken: "test")
            }
            return service
        }
    }
}
