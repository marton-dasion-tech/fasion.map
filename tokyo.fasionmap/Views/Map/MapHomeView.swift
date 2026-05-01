import SwiftUI
import MapKit

struct MapHomeView: View {
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 35.6712,
                longitude: 139.7026
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.035,
                longitudeDelta: 0.035
            )
        )
    )
    
    private let shops: [Shop] = [
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
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    Color.black
                    
                    Map(position: $cameraPosition) {
                        ForEach(shops) { shop in
                            Annotation(shop.name, coordinate: shop.coordinate) {
                                ShopMapPinView()
                            }
                        }
                    }
                    .mapControls {
                        MapUserLocationButton()
                        MapCompass()
                        MapScaleView()
                    }
                    .padding(10)
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 12)
                
                ShopListPreviewView(shops: shops)
            }
            .navigationTitle("地図")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ShopMapPinView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 44, height: 44)
                .shadow(radius: 4)
            
            Image(systemName: "tshirt.fill")
                .font(.system(size: 20))
                .foregroundStyle(.black)
        }
    }
}

struct ShopListPreviewView: View {
    let shops: [Shop]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("近くのショップ")
                .font(.headline)
                .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(shops) { shop in
                        ShopPreviewCard(shop: shop)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 12)
            }
        }
        .background(Color.white)
    }
}

struct ShopPreviewCard: View {
    let shop: Shop
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(shop.name)
                .font(.headline)
                .foregroundStyle(.black)
            
            Text(shop.area)
                .font(.caption)
                .foregroundStyle(.secondary)
            
            HStack(spacing: 4) {
                Image(systemName: "star.fill")
                    .font(.caption)
                    .foregroundStyle(.black)
                
                Text(String(format: "%.1f", shop.rating))
                    .font(.caption)
                    .foregroundStyle(.black)
                
                Text("(\(shop.reviewCount)件)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(width: 160, alignment: .leading)
        .padding(12)
        .background(Color(.systemGray6))
    }
}

#Preview {
    MapHomeView()
}
