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
    private let rankings = MockTrends.rankings
    
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
    private let articles = MockTrends.articles
    
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
