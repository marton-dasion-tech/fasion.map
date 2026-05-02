import SwiftUI

struct ChatHomeView: View {
    @State private var selectedSection: ChatSection = .chat
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ChatTopSwitchView(selectedSection: $selectedSection)
                
                Divider()
                
                switch selectedSection {
                case .chat:
                    ChatListView()
                case .profile:
                    ProfileView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

enum ChatSection {
    case chat
    case profile
}

struct ChatTopSwitchView: View {
    @Binding var selectedSection: ChatSection
    
    var body: some View {
        HStack(spacing: 20) {
            Button {
                selectedSection = .chat
            } label: {
                Text("チャット")
                    .font(.title2)
                    .fontWeight(selectedSection == .chat ? .bold : .regular)
                    .foregroundStyle(selectedSection == .chat ? .black : .secondary)
            }
            
            Button {
                selectedSection = .profile
            } label: {
                Text("マイページ")
                    .font(.title3)
                    .fontWeight(selectedSection == .profile ? .bold : .regular)
                    .foregroundStyle(selectedSection == .profile ? .black : .secondary)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 14)
        .padding(.bottom, 12)
        .background(Color.white)
    }
}

struct ChatListView: View {
    private let friends: [ChatFriend] = [
        ChatFriend(
            name: "AIスタイリスト",
            lastMessage: "今日はどんな服を探していますか？",
            timeText: "12:30",
            unreadCount: 2,
            iconName: "sparkles"
        ),
        ChatFriend(
            name: "Ken",
            lastMessage: "原宿の古着屋、今度行こう",
            timeText: "昨日",
            unreadCount: 0,
            iconName: "person.fill"
        ),
        ChatFriend(
            name: "Mika",
            lastMessage: "このショップかわいい！",
            timeText: "月曜",
            unreadCount: 1,
            iconName: "person.fill"
        ),
        ChatFriend(
            name: "ショップ相談",
            lastMessage: "おすすめ店舗を紹介できます",
            timeText: "日曜",
            unreadCount: 0,
            iconName: "tshirt.fill"
        )
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 1.00, green: 0.86, blue: 0.20),
                    Color(red: 1.00, green: 0.68, blue: 0.12),
                    Color(red: 1.00, green: 0.92, blue: 0.38)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            List {
                ForEach(friends) { friend in
                    NavigationLink {
                        ChatRoomView(friend: friend)
                    } label: {
                        ChatFriendRow(friend: friend)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(
                        EdgeInsets(
                            top: 8,
                            leading: 16,
                            bottom: 8,
                            trailing: 16
                        )
                    )
                    .listRowBackground(Color.clear)
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
        }
    }
}

struct ChatFriend: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let lastMessage: String
    let timeText: String
    let unreadCount: Int
    let iconName: String
}

struct ChatFriendRow: View {
    let friend: ChatFriend
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.black)
                    .frame(width: 54, height: 54)
                
                Image(systemName: friend.iconName)
                    .font(.system(size: 22))
                    .foregroundStyle(.white)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(friend.name)
                    .font(.headline)
                    .foregroundStyle(.black)
                
                Text(friend.lastMessage)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 8) {
                Text(friend.timeText)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                if friend.unreadCount > 0 {
                    Text("\(friend.unreadCount)")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(width: 22, height: 22)
                        .background(Color.black)
                        .clipShape(Circle())
                }
            }
        }
        .padding(14)
        .background(
            LinearGradient(
                colors: [
                    Color.white.opacity(0.92),
                    Color.white.opacity(0.70)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
        .padding(.vertical, 2)
    }
}

#Preview {
    ChatHomeView()
}
