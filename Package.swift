// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftExtensions",
    products: [
        .library(
            name: "SwiftExtensions",
            targets: ["FoundationExtensions", "UIKitExtensions", "SwiftUIExtensions"]),
    ],
    targets: [
        .target(
            name: "FoundationExtensions"),
        .target(
            name: "UIKitExtensions"),
        .target(
            name: "SwiftUIExtensions"),
        .testTarget(
            name: "SwiftExtensionsTests",
            dependencies: ["FoundationExtensions"]
        ),
    ]
)
