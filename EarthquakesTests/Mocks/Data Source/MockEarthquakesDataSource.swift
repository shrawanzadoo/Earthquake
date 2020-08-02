import Foundation
import RxSwift

@testable import Earthquakes

class MockEarthquakesDataSource: EarthquakesDataSource {
    
    var fetchEarthquakesCount = 0
    var fetchEarthquakesReturn: Single<Result<EarthquakesInfo, Error>>!
    func fetchEarthquakes(north: Double, east: Double, west: Double, south: Double) -> Single<Result<EarthquakesInfo, Error>> {
        fetchEarthquakesCount += 1
        return fetchEarthquakesReturn
    }
}
