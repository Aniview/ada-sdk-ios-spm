// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let artifactVersion = "1.5.0"

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
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", "12.0.0"..<"14.0.0")
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
            checksum: "2a6aa7727cea69decd2f766e55335cf2c5e4db206b3a5d5c70454ea8322226fd"
        )
    ]
)
