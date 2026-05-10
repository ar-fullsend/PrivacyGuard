// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "PrivacyGuard",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "PrivacyGuard",
            targets: ["PrivacyGuard"]
        ),
        .executable(
            name: "PrivacyGuardDemo",
            targets: ["PrivacyGuardDemo"]
        )
    ],
    targets: [
        .target(
            name: "PrivacyGuard",
            dependencies: [],
            path: "ProofOfConcept"
        ),
        .executableTarget(
            name: "PrivacyGuardDemo",
            dependencies: ["PrivacyGuard"],
            path: "Demo"
        )
    ]
)