import UIKit

struct Earthquake {
    let datetime: String
    let lat, lng: Double
    let magnitude, depth: Double
    let intensity: Intensity
    let source: String
    let id: String
}

enum Intensity {
    case low
    case high
    
    func getColor() -> UIColor {
        switch self {
        case .high:
            return UIColor.systemRed
        default:
            return UIColor.systemOrange
        }
    }
}

