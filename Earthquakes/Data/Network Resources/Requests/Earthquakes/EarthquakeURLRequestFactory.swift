import Foundation

class EarthquakeURLRequestFactory: URLRequestFactory {
    func retriveEarthquakes(_ queryDictionary: [String : String]) -> URLRequest {
        var request = jsonRequest(endPoint: "earthquakesJSON", queryDictionary)
        request.httpMethod = HTTPMethod.get.rawValue
        return request
    }
}
