//
//  MockEarthquakesDataManager.swift
//  EarthquakesTests
//
//  Created by Shrawan Zadoo on 02/08/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

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
