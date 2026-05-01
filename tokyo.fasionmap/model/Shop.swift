import Foundation
import CoreLocation

struct Shop: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let area: String
    let rating: Double
    let reviewCount: Int
    let coordinate: CLLocationCoordinate2D
}
