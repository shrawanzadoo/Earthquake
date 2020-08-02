//
//  MockEarthquakesRepository.swift
//  EarthquakesTests
//
//  Created by Shrawan Zadoo on 02/08/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

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
