//
//  EarthquakePresenterMock.swift
//  EarthquakesSnapshotTests
//
//  Created by Shrawan Zadoo on 02/08/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation
@testable import Earthquakes

class EarthquakePresenterMock: EarthquakesPresenterContract {
    
    var takeViewCount = 0
    func takeView(_ view: EarthquakesViewContract) {
        takeViewCount += 1
    }
    
    var reloadEarthquakesCount = 0
    func reloadEarthquakes() {
        reloadEarthquakesCount += 1
    }
}
