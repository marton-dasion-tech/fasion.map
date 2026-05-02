import SwiftUI
import MapKit

struct MapHomeView: View {
    @StateObject private var locationManager = LocationManager()
    
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
    
    @State private var selectedShop: Shop?
    
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
            ZStack {
                LinearGradient(
                    colors: [
                        Color(red: 0.28, green: 0.18, blue: 0.90),
                        Color(red: 0.42, green: 0.22, blue: 1.00),
                        Color(red: 0.24, green: 0.32, blue: 0.95)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    ZStack {
                        Color.black
                        
                        Map(position: $cameraPosition) {
                            UserAnnotation()
                            
                            ForEach(shops) { shop in
                                Annotation(shop.name, coordinate: shop.coordinate) {
                                    Button {
                                        selectedShop = shop
                                    } label: {
                                        VStack(spacing: 4) {
                                            ZStack {
                                                Circle()
                                                    .fill(Color.white)
                                                    .frame(width: 44, height: 44)
                                                    .shadow(radius: 4)
                                                
                                                Image(systemName: "tshirt.fill")
                                                    .font(.system(size: 20))
                                                    .foregroundStyle(.black)
                                            }
                                            
                                            Text(shop.name)
                                                .font(.caption2)
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black)
                                                .padding(.horizontal, 6)
                                                .padding(.vertical, 3)
                                                .background(Color.white)
                                        }
                                    }
                                    .buttonStyle(.plain)
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
                }
            }
            .navigationTitle("地図")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(item: $selectedShop) { shop in
                ShopDetailView(shop: shop)
            }
            .onAppear {
                locationManager.requestLocationPermission()
            }
        }
    }
}

#Preview {
    MapHomeView()
}
