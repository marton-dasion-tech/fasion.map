import SwiftUI

struct ChatRoomView: View {
    let friend: ChatFriend
    
    @State private var messages: [ChatMessage] = MockChats.initialMessages
    @State private var inputText = ""
    @State private var isReplying = false
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(messages) { message in
                            ChatMessageBubble(message: message)
                                .id(message.id)
                        }
                        
                        if isReplying {
                            TypingIndicatorBubble()
                                .id("typing-indicator")
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 8)
                }
                .onChange(of: messages.count) {
                    scrollToLatestMessage(proxy: proxy)
                }
                .onChange(of: isReplying) {
                    if isReplying {
                        withAnimation {
                            proxy.scrollTo("typing-indicator", anchor: .bottom)
                        }
                    }
                }
            }
            
            ChatInputBar(
                inputText: $inputText,
                isDisabled: isReplying,
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
        
        addMockReply(after: trimmedText)
    }
    
    private func addMockReply(after userMessage: String) {
        isReplying = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            let reply = ChatMessage(
                text: mockReplyText(for: userMessage),
                isUser: false,
                timeText: currentTimeText()
            )
            
            messages.append(reply)
            isReplying = false
        }
    }
    
    private func mockReplyText(for text: String) -> String {
        if text.contains("原宿") {
            return "原宿なら、古着・セレクトショップを中心に探すのが良さそうです。地図上のピンから近い店舗を確認できます。"
        }
        
        if text.contains("渋谷") {
            return "渋谷周辺なら、ストリート系やセレクト系のショップを候補にできます。"
        }
        
        if text.contains("古着") {
            return "古着を探すなら、エリア・価格帯・系統で絞ると探しやすいです。"
        }
        
        return "いいですね。探したいエリアや服の系統を教えてください。おすすめのショップ探しを手伝います。"
    }
    
    private func currentTimeText() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: Date())
    }
    
    private func scrollToLatestMessage(proxy: ScrollViewProxy) {
        if isReplying {
            withAnimation {
                proxy.scrollTo("typing-indicator", anchor: .bottom)
            }
            return
        }
        
        guard let lastMessage = messages.last else {
            return
        }
        
        withAnimation {
            proxy.scrollTo(lastMessage.id, anchor: .bottom)
        }
    }
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

struct TypingIndicatorBubble: View {
    var body: some View {
        HStack {
            HStack(spacing: 5) {
                Circle()
                    .fill(Color.secondary)
                    .frame(width: 6, height: 6)
                
                Circle()
                    .fill(Color.secondary)
                    .frame(width: 6, height: 6)
                
                Circle()
                    .fill(Color.secondary)
                    .frame(width: 6, height: 6)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            .background(Color(.systemGray6))
            .clipShape(
                RoundedRectangle(cornerRadius: 18)
            )
            
            Spacer()
        }
    }
}

struct ChatInputBar: View {
    @Binding var inputText: String
    let isDisabled: Bool
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
                .disabled(isDisabled)
            
            Button {
                onSend()
            } label: {
                Image(systemName: "paperplane.fill")
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
                    .frame(width: 42, height: 42)
                    .background(sendButtonColor)
                    .clipShape(Circle())
            }
            .disabled(isSendDisabled)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color.white)
    }
    
    private var isSendDisabled: Bool {
        inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isDisabled
    }
    
    private var sendButtonColor: Color {
        isSendDisabled ? Color.gray : Color.black
    }
}

#Preview {
    NavigationStack {
        ChatRoomView(
            friend: MockChats.friends[0]
        )
    }
}
