//
//  Earthquake.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 27/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation

struct Earthquake {
    let datetime: String
    let lat, lng: Double
    let magnitude, depth: Double
    let intensity: Intensity
}

enum Intensity {
    case low
    case high
}
