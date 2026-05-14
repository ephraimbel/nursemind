import SwiftUI
import SwiftData
import NursemindCore

@main
struct NursemindApp: App {
    /// Single shared SwiftData container. Built explicitly here (instead of
    /// letting `.modelContainer(for:)` create one implicitly) so we can hand
    /// the same container to `SavedAnswerSyncService` — it needs its own
    /// `ModelContext` for the initial pull-and-merge against the server.
    private let modelContainer: ModelContainer

    init() {
        NursemindFonts.register()
        do {
            self.modelContainer = try ModelContainer(for: SavedAnswer.self, StoredConversation.self)
        } catch {
            fatalError("Failed to construct ModelContainer: \(error)")
        }
        SavedAnswerSyncService.shared.attach(container: modelContainer)
        // Configure RevenueCat early so its customerInfo cache is hot by the
        // time the user reaches Profile or hits a paywall. The service
        // observes Supabase auth state internally and calls `Purchases.logIn`
        // once a Supabase user_id is available.
        RevenueCatService.shared.configure(apiKey: Secrets.revenueCatAPIKey)
        // PostHog before any first-launch event fires so the install event
        // and onboarding funnel land in the same anonymous distinct_id.
        AnalyticsService.shared.configure(
            projectToken: Secrets.posthogProjectToken,
            host: Secrets.posthogHost
        )
    }

    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(modelContainer)
    }
}
