//
//  EarthquakesRemote.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 26/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation

struct EarthquakesRemote: Codable {
    let earthquakes: [Earthquake]
}

struct Earthquake: Codable {
    let datetime: String
    let depth, lng: Double
    let src: String
    let eqid: String
    let magnitude, lat: Double
}
