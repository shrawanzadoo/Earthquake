//
//  EarthquakesRemote.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 26/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation

struct EarthquakesRemote: Codable {
    let earthquakes: [EarthquakeRemote]
}

struct EarthquakeRemote: Codable {
    let datetime: String
    let lat, lng: Double
    let src: String
    let eqid: String
    let magnitude, depth: Double
}
