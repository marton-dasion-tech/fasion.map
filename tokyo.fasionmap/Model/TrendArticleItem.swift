import Foundation

struct TrendArticleItem: Identifiable {
    let id = UUID()
    let title: String
    let summary: String
    let author: String
    let readTime: String
}
