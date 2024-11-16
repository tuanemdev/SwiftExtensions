// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftExtensions",
    products: [
        .library(
            name: "FoundationExtensions",
            targets: ["FoundationExtensions"]),
        .library(
            name: "UIKitExtensions",
            targets: ["UIKitExtensions"]),
        .library(
            name: "SwiftUIExtensions",
            targets: ["SwiftUIExtensions"]),
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
