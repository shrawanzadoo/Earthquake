import Foundation
@testable import Earthquakes

class EarthquakeViewControllerTests: BaseSnapshotTestCase {
    func test_EarthquakeViewController() {
        let vc = EarthquakeViewController(presenter: EarthquakePresenterMock())
        _ = vc.view
        vc.updateEarthquakes(earthquakes: getData())
        FBSnapshotVerifyView(vc.view)
    }
    
    private func getData() -> [Earthquake] {
        [getData(), getData(8.0), getData(), getData(9.0)]
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
