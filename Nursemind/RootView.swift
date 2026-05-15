import SwiftUI
import NursemindCore
import UIKit

struct RootView: View {
    @State private var router = AppRouter.shared
    @State private var prefs = UserPreferences.shared

    init() {
        // Hand the Supabase URL + anon key to the core service before any
        // view appears. Idempotent — safe even if SwiftUI tears down and
        // rebuilds the root. Auth bootstrap is async-fire-and-forget; the
        // app stays fully usable while it resolves.
        SupabaseService.shared.configure(
            url: Secrets.supabaseURL,
            anonKey: Secrets.supabaseAnonKey
        )
        // Hook profile sync into the auth state stream + UserPreferences
        // change notifications. Initial sync runs as soon as Supabase reports
        // signed-in; subsequent local mutations debounce and push.
        ProfileSyncService.shared.attach()
        // Pre-staged behavioral logger — captures library entry view sessions
        // so the v1.5 dynamic suggested feed (BUILD_SPEC §15) has historical
        // signal on launch instead of cold-starting every user. Logs slug +
        // duration only; never PHI. Offline queue flushes on first
        // .signedIn transition.
        LibraryViewLogger.shared.attach()
        // Pre-warm ContentRegistry on a background-priority Task so the lazy
        // dispatch_once init (which builds ~1,600 bundled library entries)
        // never runs from inside a SwiftUI body call. On iPad in compatibility
        // mode the cumulative stack usage of the registry build during a body
        // pass overflowed the 1 MB main-thread stack and crashed the app on
        // launch (Apple review 2026-05-14, v1.0 build 6, iPad15,3 / iOS 26.5).
        Task.detached(priority: .utility) {
            _ = ContentRegistry.shared
        }
    }

    var body: some View {
        Group {
            if prefs.hasCompletedOnboarding {
                mainAppView
            } else {
                OnboardingFlow()
            }
        }
        // OnboardingFlow honors `.adaptForIPadCompat()` at the Group level
        // because it's a pure SwiftUI flow. mainAppView's per-tab cap is
        // applied INSIDE the TabView because TabView bridges to UIKit's
        // UITabBarController and ignores frame hints from its parent.
        .adaptForIPadCompat()
        .preferredColorScheme(colorScheme(for: prefs.preferredAppearance))
        // Cap Dynamic Type for display fonts at `.large` so users with
        // larger iOS text settings don't blow our 38pt+ serif titles up
        // to unreadable sizes. Body text (Inter) still uses `relativeTo:`
        // so genuine accessibility needs are honored within reason.
        .dynamicTypeSize(...DynamicTypeSize.large)
        .animation(.easeInOut(duration: 0.4), value: prefs.hasCompletedOnboarding)
    }

    private var mainAppView: some View {
        // Native SwiftUI TabView. iPhone-only (TARGETED_DEVICE_FAMILY = 1) so
        // we don't hit the iPadOS 18+ top-tab migration that previously
        // forced us into a custom BottomTabBar. On iOS 26+ this renders as
        // the system "liquid glass" bottom bar; on iOS 17/18 it's the
        // traditional translucent bar. Per-tab `.safeAreaInset(.bottom)`
        // (e.g. AskHomeView's input bar) stacks correctly above the bar.
        TabView(selection: $router.selectedTab) {
            AskHomeView(
                service: askService,
                enrichmentService: enrichmentService
            )
            .tabItem { Label("Ask", systemImage: "sparkle") }
            .tag(AppRouter.askTab)

            if prefs.feedTabEnabled {
                FeedTabView()
                    .tabItem { Label("Feed", systemImage: "newspaper") }
                    .tag(AppRouter.feedTab)
            }

            LibraryHomeView()
                .tabItem { Label("Library", systemImage: "books.vertical") }
                .tag(AppRouter.libraryTab)

            ProfileHomeView()
                .tabItem { Label("Profile", systemImage: "person") }
                .tag(AppRouter.profileTab)
        }
        .tint(NMColor.accent)
        .sheet(isPresented: $router.isSearchPresented) {
            GlobalSearchView()
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }

    private func colorScheme(for theme: AppearanceTheme) -> ColorScheme? {
        switch theme {
        case .system: return nil
        case .light:  return .light
        case .dark:   return .dark
        }
    }

    /// Single Anthropic transport, shared across Ask + post-answer enrichment
    /// so we don't open separate URL session pools.
    /// Mode selection:
    ///
    /// - DEBUG with a dev `Secrets.anthropicAPIKey`: hits api.anthropic.com
    ///   directly. Faster iteration without deploying the Edge Function.
    /// - Otherwise: routes through the `ai-chat` Edge Function with the
    ///   user's Supabase JWT. The Anthropic key never touches the device,
    ///   which is the App Store / TestFlight requirement.
    private var anthropicClient: AnthropicClient? {
        #if DEBUG
        if let key = Secrets.anthropicAPIKey, !key.isEmpty {
            return AnthropicClient(apiKey: key)
        }
        #endif
        let endpoint = Secrets.supabaseURL.appendingPathComponent("functions/v1/ai-chat")
        return AnthropicClient(
            proxyEndpoint: endpoint,
            tokenProvider: { await SupabaseService.shared.currentAccessToken() }
        )
    }

    private var askService: AskService {
        if let client = anthropicClient {
            return AnthropicAskService(client: client)
        }
        return MockAskService()
    }

    /// Post-answer enrichment — one call returns both follow-up chips and
    /// calculator handoff id. Replaced the prior pair of `followUpService` +
    /// `calculatorSuggester` factories; each user question now fires 3
    /// Anthropic calls instead of 4 (intent + generation + enrichment).
    private var enrichmentService: AnswerEnrichmentService {
        if let client = anthropicClient {
            return AnthropicAnswerEnrichmentService(client: client)
        }
        return MockAnswerEnrichmentService()
    }

    // configureTabBar() removed: we no longer use SwiftUI's TabView (which
    // bridged to UITabBarController and respected UITabBarAppearance). The
    // custom BottomTabBar styles itself directly with NMColor / NMFont.
}

/// Legacy helper kept for OnboardingFlow only — the per-tab adaption inside
/// the main app now lives at the ScrollView content level in each tab view.
private extension View {
    func adaptForIPadCompat() -> some View {
        self
            .frame(maxWidth: 460)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(NMColor.bgPrimary.ignoresSafeArea())
    }
}

private struct PlaceholderTab: View {
    let title: String
    var body: some View {
        ZStack {
            GrainBackground()
            Text("\(title) — coming next session")
                .font(.system(size: 18, weight: .regular, design: .serif))
                .italic()
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    RootView()
}
