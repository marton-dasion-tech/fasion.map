import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: MainTab = .map
    
    var body: some View {
        TabView(selection: $selectedTab) {
            TrendHomeView()
                .tabItem {
                    Image(systemName: "flame")
                    Text("トレンド")
                }
                .tag(MainTab.trend)
            
            MapHomeView()
                .tabItem {
                    Image(systemName: "map")
                    Text("地図")
                }
                .tag(MainTab.map)
            
            ChatHomeView()
                .tabItem {
                    Image(systemName: "message")
                    Text("チャット")
                }
                .tag(MainTab.chat)
        }
        .tint(.black)
    }
}

enum MainTab {
    case trend
    case map
    case chat
}

#Preview {
    MainTabView()
}
