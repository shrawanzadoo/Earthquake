import Foundation
import RxSwift

protocol EarthquakesRepository {
    func getEathquakes(
        north: Double,
        east: Double,
        west: Double,
        south: Double
    ) -> Observable<Result<EarthquakesInfo, Error>>
}
class EarthquakesRepositoryImpl: EarthquakesRepository {
    
    let dataSources: [EarthquakesDataSource]
    
    init(dataSources: [EarthquakesDataSource] = [EarthquakesDataSourceRemote()]) {
        self.dataSources = dataSources
    }
    
    func getEathquakes(
        north: Double,
        east: Double,
        west: Double,
        south: Double
    ) -> Observable<Result<EarthquakesInfo, Error>> {
        Observable.concat(dataSources.compactMap {
            $0.fetchEarthquakes(
                north: north,
                east: east,
                west: west,
                south: south
            ).asObservable()
        })
    }
}
