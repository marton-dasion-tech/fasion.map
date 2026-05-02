import SwiftUI

struct PrivacySettingsView: View {
    @State private var isProfilePublic = true
    @State private var allowMessages = true
    @State private var showActivity = false
    
    var body: some View {
        Form {
            Section("公開設定") {
                Toggle("プロフィールを公開する", isOn: $isProfilePublic)
                Toggle("メッセージを受け取る", isOn: $allowMessages)
                Toggle("アクティビティを表示する", isOn: $showActivity)
            }
            
            Section("安全") {
                Button("ブロックしたユーザー") {
                    // 後でブロック一覧を実装
                }
                
                Button("通報・ヘルプ") {
                    // 後でヘルプ画面を実装
                }
            }
        }
        .navigationTitle("プライバシー設定")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        PrivacySettingsView()
    }
}
