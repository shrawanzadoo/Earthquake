//
//  EarthquakesDataSourceRemoteTest.swift
//  EarthquakesTests
//
//  Created by Shrawan Zadoo on 02/08/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import XCTest
@testable import Earthquakes

class EarthquakesDataSourceRemoteTest: XCTestCase {
    let schedulerProvider = MockSchedulerProvider()
    
    func testEarthquakesDataSourceSuccess() {
        let source = EarthquakesDataSourceRemote(earthquakesDataManager: MockEarthquakesDataManager())
            _ = source.fetchEarthquakes(north: 0, east: 0, west: 0, south: 0)
            .subscribeOn(schedulerProvider.io())
            .observeOn(schedulerProvider.ui())
            .subscribe(onSuccess: { result in
                switch(result) {
                case .success(let earthquakes):
                    XCTAssertEqual(10, earthquakes.count)
                case .failure(_):
                    XCTFail()
                }
            })
    }
}
