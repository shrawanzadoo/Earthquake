import Foundation
import RxSwift
@testable import Earthquakes

class MockEarthquakesRepository: EarthquakesRepository {
    
    var getEathquakesCount = 0
    var getEathquakesReturn: Observable<Result<EarthquakesInfo, Error>>!
    func getEathquakes(north: Double, east: Double, west: Double, south: Double) -> Observable<Result<EarthquakesInfo, Error>> {
        getEathquakesCount += 1
        return getEathquakesReturn
    }
    
    
}
