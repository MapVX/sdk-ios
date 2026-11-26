# Changelog

Versions of the MVXSDKMaps binary published in this repository. Each version is a
[GitHub Release](https://github.com/MapVX/sdk-ios/releases) with
`MVXSDKMaps.xcframework.zip` attached.

## [1.2.0]

- Place data for a directory: a venue's categories (`PlaceDetail.categories`, read from
  its `properties`, which the SDK used to drop), and the place fields the MapVX web SDK
  has (`logoUrl`, `clientId`, `hidePlace`, `visibility`, banners, localized descriptions).
  Opening hours for a date (`forDate`, holidays first). A malformed value in a place no
  longer drops the whole field.
- Taps that say what was tapped: `setMapTapCallback` with the MapVX ids of the places
  under the tap on the floor in view, and `setMarkerTapCallback` with the marker's id.
- `MapVXSDK.getPlacesByInput`: the server-side place search the MapVX web SDK uses
  («mcd» finds «Mc Donalds»), async and cancellable, optionally ranked near a position.
- Place labels laid out by the map: `setPlaceLabels` draws a logo or category icon with
  the place's name under it, by priority and zoom, each only where it has room; the
  map's own names give way to them. A logo that can't be downloaded for now (offline,
  a busy server) shows the icon and is asked for again later.
- A venue switch names the new venue's institution from its first request:
  `MapVXSDK.setParentPlace(_:institutionId:completion:)` (and the map controller's
  `setParentPlace(_:institutionId:)`) installs it with the parent place, so the map's
  style, places and search right after a switch no longer carry the previous venue's.

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
