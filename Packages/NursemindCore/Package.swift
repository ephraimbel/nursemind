// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "NursemindCore",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "NursemindCore",
            targets: ["NursemindCore"]
        )
    ],
    dependencies: [
        // Supabase Swift SDK — Auth, PostgREST, Realtime, Storage, Functions.
        // Pinned to 2.x; the umbrella `Supabase` product re-exports everything
        // we need (Auth + PostgREST today; Edge Functions in slice #3).
        .package(url: "https://github.com/supabase/supabase-swift.git", from: "2.0.0"),
        // RevenueCat — StoreKit 2 wrapper, Paywalls SwiftUI component, and
        // CustomerCenterUI. The umbrella `RevenueCat` product is the SDK
        // core; `RevenueCatUI` re-exports `PaywallView` + `CustomerCenterView`.
        .package(url: "https://github.com/RevenueCat/purchases-ios-spm.git", from: "5.0.0"),
        // PostHog iOS SDK — product analytics for the organic funnel.
        // Public `phc_` project token is safe to embed; the SDK never sends
        // user input bodies, only event names + structured properties.
        .package(url: "https://github.com/PostHog/posthog-ios.git", from: "3.56.0"),
        // TikTok Business SDK — install + subscription attribution for the
        // TikTok paid funnel. Off-by-default: SDK only initializes when the
        // three Secrets (appId / tiktokAppId / accessToken) are populated.
        .package(url: "https://github.com/tiktok/tiktok-business-ios-sdk.git", from: "1.6.0")
    ],
    targets: [
        .target(
            name: "NursemindCore",
            dependencies: [
                .product(name: "Supabase", package: "supabase-swift"),
                .product(name: "RevenueCat", package: "purchases-ios-spm"),
                .product(name: "RevenueCatUI", package: "purchases-ios-spm"),
                .product(name: "PostHog", package: "posthog-ios"),
                .product(name: "TikTokBusinessSDK", package: "tiktok-business-ios-sdk")
            ],
            path: "Sources/NursemindCore",
            resources: [
                .copy("Resources/Fonts"),
                .process("Resources/Assets.xcassets"),
                .process("Resources/Legal")
            ]
        ),
        .testTarget(
            name: "NursemindCoreTests",
            dependencies: ["NursemindCore"],
            path: "Tests/NursemindCoreTests"
        )
    ]
)
