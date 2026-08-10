// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let artifactVersion = "1.4.0"

let package = Package(
    name: "AdaSdk",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AdaSdk",
            targets: ["AdaSdkTarget"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "11.0.0")
    ],
    targets: [
        .target(
            name: "AdaSdkTarget",
            dependencies: [
                .target(name: "AdaSdk"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ]
        ),
        .binaryTarget(
            name: "AdaSdk",
            url: "https://github.com/Aniview/ada-sdk-ios-spm/releases/download/artifact_\(artifactVersion)/AdaSdk.zip",
            checksum: "c80b4d6d4118fd564493c52032b493f86432e8a59f2661f7c8a7d58dc5a4a5f4"
        )
    ]
)
