import SwiftUI
import NursemindCore
import UIKit

struct RootView: View {
    @State private var router = AppRouter.shared
    @State private var prefs = UserPreferences.shared

    init() {
        Self.configureTabBar()
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
        .preferredColorScheme(colorScheme(for: prefs.preferredAppearance))
        .animation(.easeInOut(duration: 0.4), value: prefs.hasCompletedOnboarding)
    }

    private var mainAppView: some View {
        TabView(selection: $router.selectedTab) {
            AskHomeView(
                service: askService,
                followUpService: followUpService,
                calculatorSuggester: calculatorSuggester
            )
            .tabItem { Label("Ask", systemImage: "sparkle") }
            .tag(AppRouter.askTab)

            // Feed tab is feature-flagged off by default for the v1 build
            // currently in App Review. Flip prefs.feedTabEnabled to true
            // for the v1.1 build once the backend pipeline is deployed.
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

    /// Single Anthropic transport, shared across Ask / follow-up / calculator-
    /// suggester services so we don't open three separate URL session pools.
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

    private var followUpService: FollowUpService {
        if let client = anthropicClient {
            return AnthropicFollowUpService(client: client)
        }
        return MockFollowUpService()
    }

    private var calculatorSuggester: CalculatorSuggester {
        if let client = anthropicClient {
            return AnthropicCalculatorSuggester(client: client)
        }
        return MockCalculatorSuggester()
    }

    private static func configureTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0xF4 / 255.0, green: 0xF2 / 255.0, blue: 0xEC / 255.0, alpha: 1.0)
        appearance.shadowColor = UIColor(red: 0xD9 / 255.0, green: 0xD4 / 255.0, blue: 0xC7 / 255.0, alpha: 1.0)

        let tertiary = UIColor(red: 0x8B / 255.0, green: 0x8A / 255.0, blue: 0x82 / 255.0, alpha: 1.0)
        // Mirrors NMColor.accent — light: 0x4ABE7B, dark: 0x7AD2A0.
        // UITabBarAppearance can't accept a SwiftUI Color directly, so we
        // construct the same dynamic UIColor by hand.
        let accent = UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(red: 0x7A / 255.0, green: 0xD2 / 255.0, blue: 0xA0 / 255.0, alpha: 1.0)
                : UIColor(red: 0x4A / 255.0, green: 0xBE / 255.0, blue: 0x7B / 255.0, alpha: 1.0)
        }

        appearance.stackedLayoutAppearance.normal.iconColor = tertiary
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: tertiary]
        appearance.stackedLayoutAppearance.selected.iconColor = accent
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: accent]

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
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
