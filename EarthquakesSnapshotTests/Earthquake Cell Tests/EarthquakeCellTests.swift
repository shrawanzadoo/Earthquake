import FBSnapshotTestCase
@testable import Earthquakes

class EarthquakeCellTests: BaseSnapshotTestCase {
    func test_EarthquakeCell_low() {
        guard let cell = EarthquakeCell.loadFromNib() else {
            XCTFail("Failed to generate the view of PostCardCell")
            return
        }
        
        cell.configureCellWith(model: getData())
        
        FBSnapshotVerifyView(cell)
    }
    
    func test_EarthquakeCell_high() {
        guard let cell = EarthquakeCell.loadFromNib() else {
            XCTFail("Failed to generate the view of PostCardCell")
            return
        }
        
        cell.configureCellWith(model: getData(8.0))
        
        FBSnapshotVerifyView(cell)
    }
    
    private func getData(_ magnitude: Double = 5.0) -> Earthquake {
        return Earthquake(
            datetime: "12:05 Thu, 2 Aug 2012",
            lat: 1.0,
            lng: 2.0,
            magnitude: magnitude,
            depth: 10.0,
            intensity: magnitude >= 8 ? .high : .low,
            source: "us",
            id: "us20002926"
        )
    }
}

