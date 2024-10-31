import SwiftUI

struct Settings: View {
    var body: some View {
        ZStack {
            // Background color
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 40) {
                // Title
                Text("SETTINGS")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 60)
                    .padding(.horizontal, 20)

                // Notification Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Notification")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)

                    Text("Toggle Notifications (ON/OFF)")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.8))

                    Text("Set Notification Preferences")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.horizontal, 20)

                // Privacy Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Privacy")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)

                    Text("Manage blocked users")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.8))

                    Text("Account visibility")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.8))

                    Text("Location settings")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.horizontal, 20)

                // Account Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Account")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)

                    Text("Change password")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.8))

                    Text("Log out")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.horizontal, 20)

                Spacer()

                // Back arrow at the bottom
                HStack {
                    Spacer()
                    NavigationLink(destination: HomePage()) {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                            .padding(.bottom, 40)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
