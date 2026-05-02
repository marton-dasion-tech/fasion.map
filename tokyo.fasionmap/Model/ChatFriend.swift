import Foundation

struct ChatFriend: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let lastMessage: String
    let timeText: String
    let unreadCount: Int
    let iconName: String
}
