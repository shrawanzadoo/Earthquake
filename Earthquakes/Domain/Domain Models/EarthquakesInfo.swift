import Foundation

typealias EarthquakesInfo = [EarthquakeInfo]

struct EarthquakeInfo {
    let datetime: Date?
    let lat, lng: Double
    let magnitude, depth: Double
    let src, id: String
}
