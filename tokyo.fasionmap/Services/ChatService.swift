import Foundation

enum ChatService {
    static func fetchFriends() -> [ChatFriend] {
        MockChats.friends
    }
    
    static func fetchInitialMessages() -> [ChatMessage] {
        MockChats.initialMessages
    }
    
    static func makeMockReply(for text: String) -> String {
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
}
