import SwiftUI

struct MapHomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .fill(Color.black)
                    
                    VStack(spacing: 12) {
                        Image(systemName: "map.fill")
                            .font(.system(size: 44))
                            .foregroundStyle(.black)
                        
                        Text("Tokyo Map")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("ここに東京のアパレルショップ地図を表示します")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .padding(10)
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 12)
                
                Spacer()
            }
            .navigationTitle("地図")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MapHomeView()
}
