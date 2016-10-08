# GeoSwift
Location-related APIs intended to be used by server-side Swift applications since there is no `CoreLocation` on Linux.

[![Build Status](https://travis-ci.org/petrpavlik/GeoSwift.svg?branch=master)](https://travis-ci.org/petrpavlik/GeoSwift)
[![Latest Release](https://img.shields.io/github/release/petrpavlik/GeoSwift.svg)](https://github.com/petrpavlik/GeoSwift/releases/latest)
![Platforms](https://img.shields.io/badge/platforms-Linux%20%7C%20OS%20X-blue.svg)
![Package Managers](https://img.shields.io/badge/package%20managers-SwiftPM-yellow.svg)


## Distance between 2 locations

```swift
do {
    let prague = try GeoCoordinate2D(latitude: 50.0880400, longitude: 14.4207600)
    let brno = try GeoCoordinate2D(latitude: 49.195060, longitude: 16.606837)

    let distancePragueBrnoInMeters = prague.distance(from: brno)
    print("Distance between Prague and Brno is \(distancePragueBrnoInMeters * 0.00062137) mi.")
} catch {
    // Tried to create an instance of `GeoCoordinate2D` with invalid coordinates.
}
```

## Installation

### Swift Package Manager
```Swift
.Package(url: "https://github.com/petrpavlik/GeoSwift.git", majorVersion: 1)
```

### License
MIT

### Author
Petr Pavlik - [@ptrpavlik](https://twitter.com/ptrpavlik)


