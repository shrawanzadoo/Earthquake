import Foundation
import RxSwift

class GetEarthquakes: UseCase {

    typealias Q = EarthquakeLocation
    typealias T = Result<EarthquakesInfo, Error>
    
    let earthquakesRepository: EarthquakesRepository
    
    init(earthquakesRepository: EarthquakesRepository = EarthquakesRepositoryImpl()) {
        self.earthquakesRepository = earthquakesRepository
    }
    
    func execute(_ requestValues: Q) -> Observable<T> {
        earthquakesRepository.getEathquakes(
            north: requestValues.north,
            east: requestValues.east,
            west: requestValues.west,
            south: requestValues.south
        )
    }
}

struct EarthquakeLocation {
    let north: Double
    let east: Double
    let west: Double
    let south: Double
}

