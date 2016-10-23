//
//  GeoSwift.swift
//
//  Copyright (c) 2016 Petr Pavlik (https://twitter.com/ptrpavlik)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

/// `GeoCoordinate2DError` is the error type thrown by GeoCoordinate2D in case of an attempt to create an instance with invalid coordinates.
///
/// - invalidLatitude: Provided latitude is outside of acceptable bounds abs(latitude) <= 90.
/// - invalidLongitude: Provided longitude is outside of acceptable bounds abs(latitude) <= 180.
public enum GeoCoordinate2DError: Error {
    case invalidLatitude
    case invalidLongitude
}

/// Represents a valid location coordinate. Initializer throws `GeoCoordinate2DError` error in case of an attempt to create an instance with invalid coordinates.
public struct GeoCoordinate2D {
    let latitude: Double
    let longitude: Double
    
    init(latitude: Double, longitude: Double) throws {
        
        guard abs(latitude) <= 90 else {
            throw GeoCoordinate2DError.invalidLatitude
        }
        
        guard abs(longitude) <= 180 else {
            throw GeoCoordinate2DError.invalidLongitude
        }
        
        self.latitude = latitude
        self.longitude = longitude
    }
}

public extension GeoCoordinate2D {
    
    /// Returns distance from provided `GeoCoordinate2D` instance in meters using Haversine formula.
    public func distance(from: GeoCoordinate2D) -> Double {
        
        // Algorithm shamelessly copied from http://www.movable-type.co.uk/scripts/latlong.html
        let R = 6371e3; // metres
        let φ1 = latitude * Double.pi / 180
        let φ2 = from.latitude * Double.pi / 180
        let Δφ = (from.latitude-latitude) * Double.pi / 180
        let Δλ = (from.longitude-longitude) * Double.pi / 180
        
        // Broken into 2 expressions to avoid 'expression too complex' error on linux
        var a = sin(Δφ/2) * sin(Δφ/2)
        a += cos(φ1) * cos(φ2) * sin(Δλ/2) * sin(Δλ/2)
        
        let c = 2 * atan2(sqrt(a), sqrt(1-a));
        
        return R * c;
    }
}

