import XCTest
@testable import GeoSwift

class GeoSwiftTests: XCTestCase {
    func testCoordinates() {
        
        do {
            let prague = try GeoCoordinate2D(latitude: 50.0880400, longitude: 14.4207600)
            let brno = try GeoCoordinate2D(latitude: 49.195060, longitude: 16.606837)
            
            let distancePragueBrnoMeters = prague.distance(from: brno)
            XCTAssertEqual(round(distancePragueBrnoMeters), 186101)
            
            let distancePraguePragueMeters = prague.distance(from: prague)
            XCTAssertEqual(round(distancePraguePragueMeters), 0)
        } catch {
            XCTFail()
        }
        
        do {
            _ = try GeoCoordinate2D(latitude: 91, longitude: 14.4207600)
            _ = try GeoCoordinate2D(latitude: -91, longitude: 14.4207600)
            _ = try GeoCoordinate2D(latitude: 50.0880400, longitude: 181)
            _ = try GeoCoordinate2D(latitude: 50.0880400, longitude: -181)
            XCTFail()
        } catch {
            
        }
    }


    static var allTests : [(String, (GeoSwiftTests) -> () throws -> Void)] {
        return [
            ("testCoordinates", testCoordinates),
        ]
    }
}
