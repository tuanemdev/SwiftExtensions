// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftExtensions",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftExtensions",
            targets: ["FoundationExtensions", "UIKitExtensions", "SwiftUIExtensions"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
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
