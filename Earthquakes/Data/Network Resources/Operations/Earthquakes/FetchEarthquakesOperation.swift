import Foundation

class FetchEarthquakesOperation: ConcurrentOperation<EarthquakesRemote> {
    
    private let session: URLSession
    private let requestFactory: EarthquakeURLRequestFactory
    private var sessionTask: URLSessionTask?
    
    private let north: Double
    private let east: Double
    private let west: Double
    private let south: Double

    
    init(session: URLSession = URLSession.shared,
         requestFactory: EarthquakeURLRequestFactory = EarthquakeURLRequestFactory(),
         _ north: Double,
         _ east: Double,
         _ west: Double,
         _ south: Double
    ) {
        self.session = session
        self.requestFactory = requestFactory
        self.north = north
        self.east = east
        self.west = west
        self.south = south
    }
    
    override func main() {

        let queryDictionary: [String : String] = [
            "north": "\(north)",
            "east" : "\(east)",
            "west" : "\(west)",
            "south" : "\(south)"
        ]
        
        let request = requestFactory.retriveEarthquakes(queryDictionary)
        
        sessionTask = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    self.complete(result: .failure(error))
                } else {
                    self.complete(result: .failure(BaseError.noData))
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let accounts = try decoder.decode(EarthquakesRemote.self, from: data)
                
                self.complete(result: .success(accounts))
            } catch {
                self.complete(result: .failure(BaseError.parsingError))
            }
        }
        
        sessionTask?.resume()
    }
    
    override func cancel() {
        sessionTask?.cancel()
        super.cancel()
    }
}
