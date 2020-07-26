//
//  EarthquakesRepository.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 26/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation

protocol EarthquakesRepository {
    func getEathquakes(
        north: Double,
        east: Double,
        west: Double,
        south: Double,
        completion: @escaping (_ result: Result<EarthquakesInfo, Error>) -> Void
    )
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
        south: Double,
        completion: @escaping (_ result: Result<EarthquakesInfo, Error>) -> Void
    ) {
        dataSources.forEach { source in
            source.fetchEarthquakes(
                north: north,
                east: east,
                west: west,
                south: south
            ) { result in
                completion(result)
            }
        }
    }
}
