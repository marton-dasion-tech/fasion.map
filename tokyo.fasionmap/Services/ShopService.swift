import Foundation

enum ShopService {
    static func fetchShops() -> [Shop] {
        MockShops.shops
    }
}
