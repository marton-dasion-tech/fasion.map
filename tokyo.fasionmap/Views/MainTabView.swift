import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MapHomeView()
                .tabItem {
                    Image(systemName: "map")
                    Text("地図")
                }
            
            ChatHomeView()
                .tabItem {
                    Image(systemName: "message")
                    Text("チャット")
                }
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
