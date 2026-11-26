# Changelog

Versions of the MVXSDKMaps binary published in this repository. Each version is a
[GitHub Release](https://github.com/MapVX/sdk-ios/releases) with
`MVXSDKMaps.xcframework.zip` attached.

## [1.1.0]

- A map opened once online opens again offline. When the MapVX API can't be reached,
  the map style, the place and its floors, the sub-places and the configuration come
  from the last answers the SDK kept, and MapLibre draws the tiles it already has.
  Online nothing changes. Routes and searches by position are never answered from
  the cache.

## [1.0.0]

First public release of the MapVX iOS SDK, distributed with Swift Package Manager.

- Indoor and outdoor maps on MapLibre, with floor filtering and 3D indoor rendering.
- Positioning that fuses GPS and Bluetooth beacons, and accessible route navigation.
- Requires iOS 15.6+ and Xcode 26+. Swift Package Manager resolves MapLibre
  from 6.23.0.
- The SDK sends no analytics.
