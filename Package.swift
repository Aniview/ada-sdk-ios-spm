// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let artifactVersion = "1.0.0"

let package = Package(
    name: "AdaSdk",
    platforms: [.iOS(.v14)],
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
            checksum: "a48af622f25be535cb26b45b022928a418e53eb7a22bf47ecb9f17fa4f76f2b4"
        )
    ]
)
