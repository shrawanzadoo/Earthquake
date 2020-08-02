import XCTest

@testable import Earthquakes

class MockDataHelper {
    public static func getData() -> EarthquakesRemote {
        return readFromFile("remoteResponse")!
    }
    
    public static func getData(_ dateTime: String = "2011-03-11 04:46:23") -> EarthquakeRemote {
        EarthquakeRemote(datetime: dateTime, lat: 1.0, lng: 2.0, src: "src", eqid: "", magnitude: 5, depth: 6.5)
    }
    
    public static func getData() -> EarthquakesInfo {
        [getData(), getData(1346583936, 8), getData(1349175936000)]
    }
    
    // 1343905536 = Thursday, 2 August 2012 11:05:36
    public static func getData(
        _ timeInterval: TimeInterval = 1343905536,
        _ magnitude: Double = 5
    ) -> EarthquakeInfo {
        EarthquakeInfo(datetime: Date(timeIntervalSince1970: timeInterval), lat: 2.0, lng: 1.0, magnitude: magnitude, depth: 5)
    }
    
    private static func readFromFile<T: Codable>(_ fileName: String) -> T? {
        
        let bundle = Bundle(for: type(of: MockDataHelper()))
        print("🚨 TEST Reading from file : \(fileName).json")
        
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing file: \(fileName).json")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let serialisedData = try JSONDecoder().decode(T.self, from: data)
            return serialisedData
        } catch {
            return nil
        }
    }
}
