import SwiftUI

struct ProfileEditView: View {
    @State private var displayName = "maruyama"
    @State private var bio = "東京のファッションショップを探しています"
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Spacer()
                    
                    VStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 90, height: 90)
                            
                            Image(systemName: "person.fill")
                                .font(.system(size: 38))
                                .foregroundStyle(.white)
                        }
                        
                        Button("アイコンを変更") {
                            // 後で画像選択を実装
                        }
                        .font(.subheadline)
                    }
                    
                    Spacer()
                }
            }
            
            Section("基本情報") {
                TextField("表示名", text: $displayName)
                
                TextField("自己紹介", text: $bio, axis: .vertical)
                    .lineLimit(3, reservesSpace: true)
            }
            
            Section {
                Button("保存") {
                    // 後で保存処理を実装
                }
                .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle("プロフィール編集")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ProfileEditView()
    }
}
