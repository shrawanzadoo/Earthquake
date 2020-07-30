//
//  EarthquakesDataSource.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 26/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation
import RxSwift

protocol EarthquakesDataSource {
    func fetchEarthquakes(
        north: Double,
        east: Double,
        west: Double,
        south: Double
    ) -> Single<Result<EarthquakesInfo, Error>>
}

class EarthquakesDataSourceRemote: EarthquakesDataSource {
    
    let earthquakesDataManager: EarthquakesDataManager
    
    init(earthquakesDataManager: EarthquakesDataManager = EarthquakesDataManagerImpl()) {
        self.earthquakesDataManager = earthquakesDataManager
    }
    
    func fetchEarthquakes(
        north: Double,
        east: Double,
        west: Double,
        south: Double
    ) -> Single<Result<EarthquakesInfo, Error>> {
        self.earthquakesDataManager.fetchEarthquakes(
            north: north,
            east: east,
            west: west,
            south: south).map { result in
                switch(result) {
                case .success(let earthquakeRemote):
                    var earthquakes: EarthquakesInfo = []
                    earthquakeRemote.earthquakes.forEach { earthquakeRemote in
                        earthquakes.append(
                            EarthquakeInfo(
                                datetime: self.getDate(earthquakeRemote.datetime),
                                lat: earthquakeRemote.lat,
                                lng: earthquakeRemote.lng,
                                magnitude: earthquakeRemote.magnitude,
                                depth: earthquakeRemote.depth
                            )
                        )
                    }
                    return .success(earthquakes)
                case .failure(let error):
                    return .failure(error)
                }
        }
    }
    
    private func getDate(_ input: String) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-mm-dd HH:mm:ss"
        return formatter.date(from: input)
    }
}
