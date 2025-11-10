// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

// https://developer.apple.com/documentation/packagedescription
import PackageDescription

let package = Package(
    name: "ZBarSDKSPM",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ZBarSDK",
            targets: ["ZBarSDK"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "libzbar",
            path: "Sources/ZBarSDK/libzbar.xcframework" // Or .url("https://example.com/MyFramework.zip", checksum: "...")
        ),
        .target(
            name: "zbar",
//            path: "Sources/zbar",
            cxxSettings: [
                .headerSearchPath("Sources/zbar")
            ],
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("UIKit"),
                .linkedLibrary("iconv"),
            ]
        ),
        .target(
            name: "ZBarSDK",
            dependencies: [
                .target(name:"zbar"),
                .target(name:"libzbar")
            ],
//            path: "Sources/ZBarSDK",
            cxxSettings: [
                .headerSearchPath("Sources/ZBarDSK")
            ],
            swiftSettings: [
                .interoperabilityMode(.Cxx)
            ]
        ),
        .testTarget(
            name: "UnitTest",
            dependencies: [
                "ZBarSDK"
            ],
            path: "Tests"
        ),
    ]
)
