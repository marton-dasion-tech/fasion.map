import SwiftUI

struct ChatRoomView: View {
    let friend: ChatFriend
    
    private let messages: [ChatMessage] = [
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
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(messages) { message in
                        ChatMessageBubble(message: message)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
            }
            
            ChatInputBar()
        }
        .background(Color.white)
        .navigationTitle(friend.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
    let timeText: String
}

struct ChatMessageBubble: View {
    let message: ChatMessage
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            if message.isUser {
                Spacer()
            }
            
            VStack(alignment: message.isUser ? .trailing : .leading, spacing: 4) {
                Text(message.text)
                    .font(.body)
                    .foregroundStyle(message.isUser ? .white : .black)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(message.isUser ? Color.black : Color(.systemGray6))
                    .clipShape(
                        RoundedRectangle(cornerRadius: 18)
                    )
                
                Text(message.timeText)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            
            if !message.isUser {
                Spacer()
            }
        }
    }
}

struct ChatInputBar: View {
    var body: some View {
        HStack(spacing: 10) {
            Text("メッセージを入力")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(Color(.systemGray6))
                .clipShape(
                    RoundedRectangle(cornerRadius: 22)
                )
            
            Button {
                // 今はUIのみ。送信処理は後で実装する。
            } label: {
                Image(systemName: "paperplane.fill")
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
                    .frame(width: 42, height: 42)
                    .background(Color.black)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color.white)
    }
}

#Preview {
    NavigationStack {
        ChatRoomView(
            friend: ChatFriend(
                name: "AIスタイリスト",
                lastMessage: "今日はどんな服を探していますか？",
                timeText: "12:30",
                unreadCount: 2,
                iconName: "sparkles"
            )
        )
    }
}
