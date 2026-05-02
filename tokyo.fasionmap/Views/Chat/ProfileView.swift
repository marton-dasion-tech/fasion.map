import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                profileHeader
                
                followerSection
                
                settingsSection
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
            .padding(.bottom, 32)
        }
        .background(Color.white)
    }
    
    private var profileHeader: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.black)
                    .frame(width: 86, height: 86)
                
                Image(systemName: "person.fill")
                    .font(.system(size: 36))
                    .foregroundStyle(.white)
            }
            
            Text("maruyama")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("東京のファッションショップを探しています")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
    
    private var followerSection: some View {
        HStack(spacing: 0) {
            profileCount(title: "フォロー", count: "128")
            
            Divider()
                .frame(height: 36)
            
            profileCount(title: "フォロワー", count: "256")
            
            Divider()
                .frame(height: 36)
            
            profileCount(title: "口コミ", count: "12")
        }
        .padding(.vertical, 16)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    private func profileCount(title: String, count: String) -> some View {
        VStack(spacing: 4) {
            Text(count)
                .font(.headline)
                .fontWeight(.bold)
            
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
    
    private var settingsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("個人設定")
                .font(.headline)
            
            ProfileSettingRow(
                iconName: "person.crop.circle",
                title: "プロフィール編集",
                subtitle: "名前・アイコン・自己紹介を変更"
            )
            
            ProfileSettingRow(
                iconName: "bell",
                title: "通知設定",
                subtitle: "メッセージやショップ通知を管理"
            )
            
            ProfileSettingRow(
                iconName: "lock",
                title: "プライバシー設定",
                subtitle: "公開範囲やブロック設定"
            )
        }
    }
}

struct ProfileSettingRow: View {
    let iconName: String
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color(.systemGray6))
                    .frame(width: 42, height: 42)
                
                Image(systemName: iconName)
                    .foregroundStyle(.black)
            }
            
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(14)
        .background(Color.white)
        .overlay {
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color(.systemGray5), lineWidth: 1)
        }
    }
}

#Preview {
    ProfileView()
}
