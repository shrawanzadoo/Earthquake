//
//  RequestConfig.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 26/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

class RequestConfig {
    
    let hostURL: String
    let username: String
    let formatted: String
    
    init() {
        hostURL = "http://api.geonames.org"
        username = "mkoppelman"
        formatted = "true"
    }
}
