import Foundation

enum MockChats {
    static let friends: [ChatFriend] = [
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
    
    static let initialMessages: [ChatMessage] = [
        ChatMessage(
            text: "こんにちは！今日はどんな服を探していますか？",
            isUser: false,
            timeText: "12:30"
        ),
        ChatMessage(
            text: "原宿で古着屋を探したいです",
            isUser: true,
            timeText: "12:31"
        ),
        ChatMessage(
            text: "いいですね。原宿周辺なら、セレクトショップや古着屋を地図で探せます。",
            isUser: false,
            timeText: "12:32"
        )
    ]
}
