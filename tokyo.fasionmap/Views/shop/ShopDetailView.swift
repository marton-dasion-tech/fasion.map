import SwiftUI
import CoreLocation

struct ShopDetailView: View {
    let shop: Shop
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 220)
                    
                    VStack(spacing: 12) {
                        Image(systemName: "tshirt.fill")
                            .font(.system(size: 52))
                            .foregroundStyle(.white)
                        
                        Text(shop.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(shop.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(shop.category)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    HStack(spacing: 6) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.black)
                        
                        Text(String(format: "%.1f", shop.rating))
                            .fontWeight(.semibold)
                        
                        Text("(\(shop.reviewCount)件の口コミ)")
                            .foregroundStyle(.secondary)
                    }
                    .font(.subheadline)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("店舗情報")
                            .font(.headline)
                        
                        Text("エリア：\(shop.area)")
                        Text("ジャンル：\(shop.category)")
                        Text("緯度：\(shop.coordinate.latitude)")
                        Text("経度：\(shop.coordinate.longitude)")
                    }
                    .font(.subheadline)
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(.systemGray6))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("口コミ")
                            .font(.headline)
                        
                        Text("雰囲気がよく、東京らしいセレクトが多いショップです。")
                            .font(.subheadline)
                            .padding(14)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(.systemGray6))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
        }
        .navigationTitle(shop.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ShopDetailView(
            shop: Shop(
                name: "Sample Shop",
                category: "古着・セレクト",
                area: "原宿エリア",
                rating: 4.6,
                reviewCount: 128,
                coordinate: CLLocationCoordinate2D(
                    latitude: 35.6712,
                    longitude: 139.7026
                )
            )
        )
    }
}
