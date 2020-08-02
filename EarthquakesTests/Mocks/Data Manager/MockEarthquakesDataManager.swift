import Foundation
import RxSwift

@testable import Earthquakes

class MockEarthquakesDataManager: EarthquakesDataManager {
    
    var fetchEarthquakesCount = 0
    var fetchEarthquakesReturn: EarthquakesRemote = MockDataHelper.getData()
    func fetchEarthquakes(north: Double, east: Double, west: Double, south: Double) -> Single<Result<EarthquakesRemote, Error>> {
        fetchEarthquakesCount += 1
        return Single.just(.success(fetchEarthquakesReturn))
    }
}
