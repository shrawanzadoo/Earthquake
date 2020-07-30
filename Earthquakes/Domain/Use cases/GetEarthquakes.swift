//
//  GetEarthquakes.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 27/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

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

