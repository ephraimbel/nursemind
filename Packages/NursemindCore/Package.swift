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
        .package(url: "https://github.com/RevenueCat/purchases-ios-spm.git", from: "5.0.0")
    ],
    targets: [
        .target(
            name: "NursemindCore",
            dependencies: [
                .product(name: "Supabase", package: "supabase-swift"),
                .product(name: "RevenueCat", package: "purchases-ios-spm"),
                .product(name: "RevenueCatUI", package: "purchases-ios-spm")
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
