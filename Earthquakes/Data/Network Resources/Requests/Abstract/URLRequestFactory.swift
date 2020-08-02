import Foundation

enum BaseError: Error, Equatable {
    case noData
    case parsingError
}

class URLRequestFactory {
    
    let config: RequestConfig

    init(config: RequestConfig = RequestConfig()) {
        self.config = config
    }
    
    func baseRequest(endPoint: String, _ queryDictionary:  [String : String]) -> URLRequest {
        let urlString = config.hostURL + "/\(endPoint)"
        var components = URLComponents(string: urlString)!
        components.queryItems = queryDictionary.map { URLQueryItem(name: $0, value: $1) }
        components.queryItems?.append(URLQueryItem(name: "username", value: config.username))
        components.queryItems?.append(URLQueryItem(name: "formatted", value: config.formatted))
        return URLRequest(url: components.url!)
    }
    
    func jsonRequest(endPoint: String, _ queryDictionary: [String : String]) -> URLRequest {
        var request = baseRequest(endPoint: endPoint, queryDictionary)
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
