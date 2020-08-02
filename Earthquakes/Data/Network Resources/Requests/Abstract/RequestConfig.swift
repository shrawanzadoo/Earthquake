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
