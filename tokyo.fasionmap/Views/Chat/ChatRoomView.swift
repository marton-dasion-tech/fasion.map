import SwiftUI

struct ChatRoomView: View {
    let friend: ChatFriend
    
    @State private var messages: [ChatMessage] = [
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
    
    @State private var inputText = ""
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(messages) { message in
                            ChatMessageBubble(message: message)
                                .id(message.id)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 8)
                }
                .onChange(of: messages.count) {
                    scrollToLatestMessage(proxy: proxy)
                }
            }
            
            ChatInputBar(
                inputText: $inputText,
                onSend: sendMessage
            )
        }
        .background(Color.white)
        .navigationTitle(friend.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func sendMessage() {
        let trimmedText = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedText.isEmpty else {
            return
        }
        
        let newMessage = ChatMessage(
            text: trimmedText,
            isUser: true,
            timeText: currentTimeText()
        )
        
        messages.append(newMessage)
        inputText = ""
    }
    
    private func currentTimeText() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: Date())
    }
    
    private func scrollToLatestMessage(proxy: ScrollViewProxy) {
        guard let lastMessage = messages.last else {
            return
        }
        
        withAnimation {
            proxy.scrollTo(lastMessage.id, anchor: .bottom)
        }
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
    @Binding var inputText: String
    let onSend: () -> Void
    
    var body: some View {
        HStack(spacing: 10) {
            TextField("メッセージを入力", text: $inputText, axis: .vertical)
                .font(.subheadline)
                .lineLimit(1...4)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(Color(.systemGray6))
                .clipShape(
                    RoundedRectangle(cornerRadius: 22)
                )
            
            Button {
                onSend()
            } label: {
                Image(systemName: "paperplane.fill")
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
                    .frame(width: 42, height: 42)
                    .background(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? Color.gray : Color.black)
                    .clipShape(Circle())
            }
            .disabled(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
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
