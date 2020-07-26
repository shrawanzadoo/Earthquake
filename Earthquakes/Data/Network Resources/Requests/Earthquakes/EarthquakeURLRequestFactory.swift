//
//  EarthquakeURLRequestFactory.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 26/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation

class EarthquakeURLRequestFactory: URLRequestFactory {
    func retriveEarthquakes(_ queryDictionary: [String : String]) -> URLRequest {
        var request = jsonRequest(endPoint: "earthquakesJSON", queryDictionary)
        request.httpMethod = HTTPMethod.get.rawValue
        return request
    }
}
