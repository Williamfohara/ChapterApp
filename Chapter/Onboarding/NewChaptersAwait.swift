import SwiftUI

struct NewChaptersAwait: View {
    var body: some View {
        ZStack {
            // Background color
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text("WELCOME")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 60)
                    .padding(.horizontal, 20)

                // Name (for demo purposes using static name, replace with dynamic name if needed)
                Text("JACKSON SCHNEIDER")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.green)
                    .padding(.horizontal, 20)

                // Subtitle
                Text("New chapters await...")
                    .font(.system(size: 18))
                    .foregroundColor(Color.white.opacity(0.8))
                    .padding(.horizontal, 20)

                Spacer()

                // Arrow button at the bottom with NavigationLink to SearchPage
                HStack {
                    Spacer()
                    NavigationLink(destination: HomePage()) {
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                            .padding(.bottom, 40)
                    }
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true) // Ensure navigation bar is hidden, preventing the back button
    }
}

struct NewChaptersAwait_Previews: PreviewProvider {
    static var previews: some View {
        NewChaptersAwait()
    }
}
