// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "SwiftUINavHelper",
    platforms: [
        .iOS(.v13), .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "SwiftUINavHelper",
            targets: ["SwiftUINavHelper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-case-paths", from: "0.11.0"),
    ],
    targets: [
        .target(
            name: "SwiftUINavHelper",
            dependencies: [
                .product(name: "CasePaths", package: "swift-case-paths"),
            ]),
        .testTarget(
            name: "SwiftUINavHelperTests",
            dependencies: [
                "SwiftUINavHelper",
            ]),
    ]
)
