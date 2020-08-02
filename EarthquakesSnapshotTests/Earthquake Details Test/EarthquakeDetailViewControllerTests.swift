import XCTest
@testable import Earthquakes

class EarthquakeDetailViewControllerTests: BaseSnapshotTestCase {
    func test_EarthquakeDetailViewController_low() {
        let vc = EarthquakeDetailViewController()
        _ = vc.view
        
        vc.detailItem = getData()
        FBSnapshotVerifyView(vc.view)
    }
    
    func test_EarthquakeDetailViewController_high() {
        let vc = EarthquakeDetailViewController()
        _ = vc.view
        
        vc.detailItem = getData(8)
        FBSnapshotVerifyView(vc.view)
    }
    
    func test_EarthquakeDetailViewController_long_text() {
        let vc = EarthquakeDetailViewController()
        _ = vc.view
        
        vc.detailItem = getData(6.0, "Some very long text that will verify the view resizing on a smaller device and how the multiline text adjusts.")
        FBSnapshotVerifyView(vc.view)
    }
    
    private func getData(
        _ magnitude: Double = 5.0,
        _ datetime: String = "12:05 Thu, 2 Aug 2012") -> Earthquake {
        return Earthquake(
            datetime: datetime,
            lat: 38.322,
            lng: 142.36,
            magnitude: magnitude,
            depth: 10.0,
            intensity: magnitude >= 8 ? .high : .low
        )
    }
}
