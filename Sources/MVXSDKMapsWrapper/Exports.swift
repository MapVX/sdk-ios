// MVXSDKMapsWrapper
// ─────────────────────────────────────────────────────────────────────────────
// This target exists only to attach the MapLibre dependency to the package and
// to keep SPM happy (a regular target requires ≥1 source file). Consumers do NOT
// import this module — they `import MVXSDKMaps` (the binary module). Because this
// target is part of the same library product, SPM links it (and therefore
// MapLibre) into the consumer app, satisfying the binary's @rpath/MapLibre.framework
// load command at runtime.
//
// This file is intentionally (almost) empty. The MapLibre link edge is created
// by the `dependencies:` list of this target in Package.swift, and the binary
// (which references MapLibre's symbols) is co-published in the same product, so
// MapLibre.framework is embedded into the consumer app. No import is required here.
//
// Optional: once the binary is resolvable, you may re-export it so that
// `import MVXSDKMapsWrapper` also surfaces the SDK:
//   @_exported import MVXSDKMaps

import Foundation
