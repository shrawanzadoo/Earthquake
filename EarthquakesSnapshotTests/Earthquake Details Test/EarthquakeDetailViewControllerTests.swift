//
//  EarthquakeDetailViewControllerTests.swift
//  EarthquakesSnapshotTests
//
//  Created by Shrawan Zadoo on 02/08/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import XCTest
@testable import Earthquakes

class EarthquakeDetailViewControllerTests: BaseSnapshotTestCase {
    func test_EarthquakeDetailViewController_low() {
        let vc = EarthquakeDetailViewController()
        _ = vc.view
        
        vc.detailItem = getData()
        FBSnapshotVerifyView(vc.view)
    }
    
    func test_EarthquakeDetailViewController_high() {
        let vc = EarthquakeDetailViewController()
        _ = vc.view
        
        vc.detailItem = getData(8)
        FBSnapshotVerifyView(vc.view)
    }
    
    private func getData(_ magnitude: Double = 5.0) -> Earthquake {
        return Earthquake(
            datetime: "12:05 Thu, 2 Aug 2012",
            lat: 38.322,
            lng: 142.36,
            magnitude: magnitude,
            depth: 10.0,
            intensity: magnitude >= 8 ? .high : .low
        )
    }
}
