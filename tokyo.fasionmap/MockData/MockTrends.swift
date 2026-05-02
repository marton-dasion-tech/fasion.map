import Foundation

enum MockTrends {
    static let rankings: [TrendRankingItem] = [
        TrendRankingItem(
            rank: 1,
            title: "今週注目の東京ストリート系ショップ",
            subtitle: "原宿・渋谷周辺で注目度が高いショップを仮表示",
            tag: "ストリート"
        ),
        TrendRankingItem(
            rank: 2,
            title: "古着トレンドランキング",
            subtitle: "下北沢・高円寺・原宿の古着系トレンドを仮表示",
            tag: "古着"
        ),
        TrendRankingItem(
            rank: 3,
            title: "セレクトショップ注目度ランキング",
            subtitle: "モード・ミニマル・デザイナーズ系を仮表示",
            tag: "セレクト"
        )
    ]
    
    static let articles: [TrendArticleItem] = [
        TrendArticleItem(
            title: "2026年春、東京で広がるファッション傾向",
            summary: "カラー・シルエット・店舗動向を仮の記事として表示します。",
            author: "Trend Desk",
            readTime: "3分"
        ),
        TrendArticleItem(
            title: "原宿で注目されるショップ導線の変化",
            summary: "地図検索とSNS導線を組み合わせた買い物行動を仮分析します。",
            author: "Fashion Map",
            readTime: "5分"
        ),
        TrendArticleItem(
            title: "古着・セレクト・ストリートの流行比較",
            summary: "ランキングや口コミデータを将来まとめる記事ページの仮UIです。",
            author: "Editorial",
            readTime: "4分"
        )
    ]
}
