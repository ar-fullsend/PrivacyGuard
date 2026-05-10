// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "PrivacyGuard",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "PrivacyGuard",
            targets: ["PrivacyGuard"]
        )
    ],
    targets: [
        .target(
            name: "PrivacyGuard",
            dependencies: [],
            path: "ProofOfConcept"
        )
    ]
)