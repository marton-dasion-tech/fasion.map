import SwiftUI

struct MapHomeView: View {
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
                        
                        VStack(spacing: 12) {
                            Image(systemName: "map.fill")
                                .font(.system(size: 56))
                                .foregroundStyle(.black)
                            
                            Text("Tokyo Map")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.black)
                            
                            Text("ここに東京のアパレルショップ地図を表示します")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 24)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .padding(10)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 12)
                }
            }
            .navigationTitle("地図")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MapHomeView()
}
