import SwiftUI

struct ChatHomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 12) {
                        ChatBubble(
                            text: "今日はどんな服を探していますか？",
                            isUser: false
                        )
                        
                        ChatBubble(
                            text: "原宿で古着屋を探したいです",
                            isUser: true
                        )
                        
                        ChatBubble(
                            text: "原宿周辺のアパレルショップを地図で探せます。",
                            isUser: false
                        )
                    }
                    .padding()
                }
                
                HStack(spacing: 8) {
                    Text("メッセージを入力")
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 10)
                        .background(Color(.systemGray6))
                    
                    Image(systemName: "paperplane.fill")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(Color.black)
                }
                .padding()
                .background(Color.white)
            }
            .navigationTitle("チャット")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ChatBubble: View {
    let text: String
    let isUser: Bool
    
    var body: some View {
        HStack {
            if isUser {
                Spacer()
            }
            
            Text(text)
                .font(.body)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .foregroundStyle(isUser ? .white : .black)
                .background(isUser ? Color.black : Color(.systemGray6))
            
            if !isUser {
                Spacer()
            }
        }
    }
}

#Preview {
    ChatHomeView()
}
