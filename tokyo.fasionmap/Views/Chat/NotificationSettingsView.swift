import SwiftUI

struct NotificationSettingsView: View {
    @State private var messageNotifications = true
    @State private var shopNotifications = true
    @State private var followerNotifications = false
    
    var body: some View {
        Form {
            Section("通知") {
                Toggle("メッセージ通知", isOn: $messageNotifications)
                Toggle("ショップ通知", isOn: $shopNotifications)
                Toggle("フォロワー通知", isOn: $followerNotifications)
            }
            
            Section {
                Text("通知の詳細設定は、今後プッシュ通知機能と連携します。")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .navigationTitle("通知設定")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        NotificationSettingsView()
    }
}
