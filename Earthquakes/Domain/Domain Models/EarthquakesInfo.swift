//
//  EarthquakesInfo.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 26/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation

typealias EarthquakesInfo = [EarthquakeInfo]

struct EarthquakeInfo {
    let datetime: Date?
    let lat, lng: Double
    let magnitude, depth: Double
}
