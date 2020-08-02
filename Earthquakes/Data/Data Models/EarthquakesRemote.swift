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
