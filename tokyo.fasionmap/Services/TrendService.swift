import Foundation

enum TrendService {
    static func fetchRankings() -> [TrendRankingItem] {
        MockTrends.rankings
    }
    
    static func fetchArticles() -> [TrendArticleItem] {
        MockTrends.articles
    }
}

