// swift-tools-version:5.9
//
// MVXSDKMaps: Swift Package Manager manifest of the MapVX iOS SDK
// ─────────────────────────────────────────────────────────────────────────────
// This is the public distribution repository of the SDK (github.com/MapVX/sdk-ios).
// The SDK's source code is private: each GitHub Release of this repository carries
// the precompiled MVXSDKMaps.xcframework as an asset (MVXSDKMaps.xcframework.zip),
// and the binary target below points at it with its checksum. MapLibre Native
// ships the same way (github.com/maplibre/maplibre-gl-native-distribution).
//
// What the binary links (checked with `otool -L` and `nm` on every release build):
//   • MapLibre, dynamically (@rpath/MapLibre.framework). It is the only library
//     the app has to provide, so it is the only dependency declared here.
//   • Filament (3D indoor rendering), statically: it travels inside the binary
//     and the app adds nothing for it.
//   • Apple's system frameworks. The SDK uses no other third-party library.
//
// A binary target cannot declare dependencies, so the regular target
// MVXSDKMapsWrapper carries the MapLibre dependency and ships in the same library
// product as the binary.
//
// The release process writes this repository's files, `url` and `checksum`
// included: a change made here by hand is overwritten by the next release.
// ─────────────────────────────────────────────────────────────────────────────

import PackageDescription

let package = Package(
    name: "MVXSDKMaps",
    platforms: [
        // The binary's deployment target.
        .iOS("15.6")
    ],
    products: [
        .library(
            name: "MVXSDKMaps",
            targets: ["MVXSDKMapsWrapper", "MVXSDKMapsBinary"]
        )
    ],
    dependencies: [
        // MapLibre's public SPM distribution (a dynamic XCFramework).
        // The lower bound is the exact MapLibre version the binary is compiled
        // against (Podfile.lock of the private repository); the release fails if
        // they differ.
        .package(
            url: "https://github.com/maplibre/maplibre-gl-native-distribution",
            from: "6.23.0"
        )
    ],
    targets: [
        // 1) The closed-source binary. A binary target takes no `dependencies:`.
        .binaryTarget(
            name: "MVXSDKMapsBinary",
            url: "https://github.com/MapVX/sdk-ios/releases/download/1.3.0/MVXSDKMaps.xcframework.zip",
            checksum: "059e452dec305e53d7c6413554091b7b98c86d835064c2a90df8f32bcd284f9e"
        ),
        // To try a local build instead, put MVXSDKMaps.xcframework (or its zip)
        // next to this file and replace the target above with:
        // .binaryTarget(
        //     name: "MVXSDKMapsBinary",
        //     path: "MVXSDKMaps.xcframework"
        // ),

        // 2) Wrapper target: carries the MapLibre dependency the binary loads at
        //    runtime, and ships in the same product as the binary. It needs at
        //    least one source file: Sources/MVXSDKMapsWrapper/Exports.swift.
        .target(
            name: "MVXSDKMapsWrapper",
            dependencies: [
                "MVXSDKMapsBinary",
                .product(name: "MapLibre", package: "maplibre-gl-native-distribution")
            ]
        )
    ]
)
