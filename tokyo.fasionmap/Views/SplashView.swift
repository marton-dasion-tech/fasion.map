import SwiftUI

struct SplashView: View {
    var body: some View {
        Image("SplashImage")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
