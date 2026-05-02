import Foundation
import CoreLocation

enum MockShops {
    static let shops: [Shop] = [
        Shop(
            name: "OURET",
            category: "メンズ・レディース",
            area: "渋谷・原宿エリア",
            rating: 4.6,
            reviewCount: 128,
            coordinate: CLLocationCoordinate2D(
                latitude: 35.6618,
                longitude: 139.7036
            )
        ),
        Shop(
            name: "LAD MUSICIAN",
            category: "メンズ",
            area: "原宿エリア",
            rating: 4.5,
            reviewCount: 96,
            coordinate: CLLocationCoordinate2D(
                latitude: 35.6694,
                longitude: 139.7064
            )
        ),
        Shop(
            name: "ATTACHMENT",
            category: "メンズ",
            area: "表参道エリア",
            rating: 4.4,
            reviewCount: 84,
            coordinate: CLLocationCoordinate2D(
                latitude: 35.6650,
                longitude: 139.7121
            )
        ),
        Shop(
            name: "古着屋サンプル",
            category: "古着",
            area: "下北沢エリア",
            rating: 4.3,
            reviewCount: 73,
            coordinate: CLLocationCoordinate2D(
                latitude: 35.6615,
                longitude: 139.6689
            )
        )
    ]
}
