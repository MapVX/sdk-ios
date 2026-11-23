# MVXSDKMaps for iOS

Accessibility-focused indoor and outdoor mapping and navigation SDK for iOS, built on MapLibre.

**Documentation:** [docs.mapvx.app/sdk-ios](https://docs.mapvx.app/sdk-ios/): getting started and the full API reference.

> This repository is the **public binary distribution** of the MapVX iOS SDK.
> The SDK's source code is proprietary and is not published. Each
> [GitHub Release](https://github.com/MapVX/sdk-ios/releases) carries the
> precompiled `MVXSDKMaps.xcframework`, and `Package.swift` points at it with its
> checksum.

## Installation (Swift Package Manager)

### Xcode
1. **File → Add Package Dependencies…**
2. Enter the package URL:
   ```
   https://github.com/MapVX/sdk-ios
   ```
3. Choose a version rule (for example *Up to Next Major Version* from `1.0.0`)
   and add the **MVXSDKMaps** library to your app target.

### Package.swift
```swift
dependencies: [
    .package(url: "https://github.com/MapVX/sdk-ios", from: "1.0.0")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "MVXSDKMaps", package: "sdk-ios")
        ]
    )
]
```

Swift Package Manager resolves **MapLibre**, the only library the SDK needs
besides Apple's frameworks.

## Usage

```swift
import MVXSDKMaps

MapVXSDK.initialize("your-api-key", enableLogging: true)
```

The SDK needs a MapVX API key.

## Requirements

| | |
|---|---|
| Platform | iOS 15.6+ |
| Xcode | 26+ (the binary is built with Xcode 26, and its Swift interface needs that compiler or a newer one) |
| Map engine | MapLibre 6.x, from the version shown in `Package.swift` (resolved automatically) |

## License

The MVXSDKMaps binary is proprietary. Its use is subject to the
[MapVX Terms and Conditions](https://mapvx.com/terms-services/). See [LICENSE](LICENSE).
