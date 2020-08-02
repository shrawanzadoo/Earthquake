//
//  MockEarthquakesDataSource.swift
//  EarthquakesTests
//
//  Created by Shrawan Zadoo on 02/08/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

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
