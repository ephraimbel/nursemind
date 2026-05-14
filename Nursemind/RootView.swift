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
        .animation(.easeInOut(duration: 0.4), value: prefs.hasCompletedOnboarding)
    }

    private var mainAppView: some View {
        // Custom replacement for SwiftUI's TabView. We keep every tab's view
        // alive (so NavigationStack paths + per-view state persist across
        // tab switches just like UITabBarController would) but only the
        // selected tab is visible + interactive at any moment. Below the
        // content sits our own bottom bar, which on iPad fills the screen
        // edge to edge — SwiftUI's TabView on iPadOS 18+ migrates the bar
        // to a top tab strip, which we don't want for the "iPhone style on
        // iPad" feel.
        ZStack {
            AskHomeView(
                service: askService,
                enrichmentService: enrichmentService
            )
            .opacity(router.selectedTab == AppRouter.askTab ? 1 : 0)
            .allowsHitTesting(router.selectedTab == AppRouter.askTab)

            if prefs.feedTabEnabled {
                FeedTabView()
                    .opacity(router.selectedTab == AppRouter.feedTab ? 1 : 0)
                    .allowsHitTesting(router.selectedTab == AppRouter.feedTab)
            }

            LibraryHomeView()
                .opacity(router.selectedTab == AppRouter.libraryTab ? 1 : 0)
                .allowsHitTesting(router.selectedTab == AppRouter.libraryTab)

            ProfileHomeView()
                .opacity(router.selectedTab == AppRouter.profileTab ? 1 : 0)
                .allowsHitTesting(router.selectedTab == AppRouter.profileTab)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .safeAreaInset(edge: .bottom, spacing: 0) {
            BottomTabBar(
                selectedTab: $router.selectedTab,
                showFeed: prefs.feedTabEnabled
            )
        }
        .background(NMColor.bgPrimary.ignoresSafeArea())
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
