import Foundation

struct TrendRankingItem: Identifiable {
    let id = UUID()
    let rank: Int
    let title: String
    let subtitle: String
    let tag: String
}
