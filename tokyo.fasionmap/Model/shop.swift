import Foundation
import CoreLocation

struct Shop: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let category: String
    let area: String
    let rating: Double
    let reviewCount: Int
    let coordinate: CLLocationCoordinate2D
    
    static func == (lhs: Shop, rhs: Shop) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
