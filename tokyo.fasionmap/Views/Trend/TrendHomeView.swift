
import SwiftUI

struct TrendHomeView: View {
    @State private var selectedSection: TrendSection = .ranking
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                TrendTopSwitchView(selectedSection: $selectedSection)
                
                Divider()
                
                switch selectedSection {
                case .ranking:
                    RankingArticleListView()
                case .article:
                    TrendArticleListView()
                }
            }
            .navigationTitle("ランキング記事")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

enum TrendSection {
    case ranking
    case article
}

struct TrendTopSwitchView: View {
    @Binding var selectedSection: TrendSection
    
    var body: some View {
        HStack(spacing: 20) {
            Button {
                selectedSection = .ranking
            } label: {
                Text("ランキング")
                    .font(.title3)
                    .fontWeight(selectedSection == .ranking ? .bold : .regular)
                    .foregroundStyle(selectedSection == .ranking ? .black : .secondary)
            }
            
            Button {
                selectedSection = .article
            } label: {
                Text("記事")
                    .font(.title3)
                    .fontWeight(selectedSection == .article ? .bold : .regular)
                    .foregroundStyle(selectedSection == .article ? .black : .secondary)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 14)
        .padding(.bottom, 12)
        .background(Color.white)
    }
}

struct RankingArticleListView: View {
    private let rankings: [TrendRankingItem] = [
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
    
    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                ForEach(rankings) { item in
                    TrendRankingCard(item: item)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 24)
        }
        .background(Color(.systemGroupedBackground))
    }
}

struct TrendArticleListView: View {
    private let articles: [TrendArticleItem] = [
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
    
    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                ForEach(articles) { article in
                    TrendArticleCard(article: article)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 24)
        }
        .background(Color(.systemGroupedBackground))
    }
}

struct TrendRankingItem: Identifiable {
    let id = UUID()
    let rank: Int
    let title: String
    let subtitle: String
    let tag: String
}

struct TrendArticleItem: Identifiable {
    let id = UUID()
    let title: String
    let summary: String
    let author: String
    let readTime: String
}

struct TrendRankingCard: View {
    let item: TrendRankingItem
    
    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(Color.black)
                    .frame(width: 46, height: 46)
                
                Text("\(item.rank)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(item.tag)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.black)
                        .clipShape(Capsule())
                    
                    Spacer()
                }
                
                Text(item.title)
                    .font(.headline)
                    .foregroundStyle(.black)
                
                Text(item.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 4)
    }
}

struct TrendArticleCard: View {
    let article: TrendArticleItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack {
                LinearGradient(
                    colors: [
                        Color(red: 0.28, green: 0.18, blue: 0.90),
                        Color(red: 0.42, green: 0.22, blue: 1.00)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                
                Image(systemName: "newspaper.fill")
                    .font(.system(size: 38))
                    .foregroundStyle(.white)
            }
            .frame(height: 130)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Text(article.title)
                .font(.headline)
                .foregroundStyle(.black)
            
            Text(article.summary)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(2)
            
            HStack {
                Text(article.author)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Text(article.readTime)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(14)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    TrendHomeView()
}
