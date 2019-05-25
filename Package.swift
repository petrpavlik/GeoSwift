// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "GeoSwift",
    products: [
        .library(name: "GeoSwift", targets: ["GeoSwift"]),
    ],
    targets: [
        .target(
            name: "GeoSwift"),
        .testTarget(
            name: "GeoSwiftTests",
            dependencies: ["GeoSwift"]),
    ]
)
