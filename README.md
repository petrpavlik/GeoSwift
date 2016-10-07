# GeoSwift
Location-related APIs intended to be used by server-side Swift applications since there is no `CoreLocation` on Linux.

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
