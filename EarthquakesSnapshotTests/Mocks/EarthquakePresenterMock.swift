import Foundation
@testable import Earthquakes

class EarthquakePresenterMock: EarthquakesPresenterContract {
    
    var takeViewCount = 0
    func takeView(_ view: EarthquakesViewContract) {
        takeViewCount += 1
    }
    
    var reloadEarthquakesCount = 0
    func reloadEarthquakes() {
        reloadEarthquakesCount += 1
    }
}
