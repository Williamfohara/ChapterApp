import SwiftUI

struct OnboardingGoals: View {
    var body: some View {
        ZStack {
            // Background color
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text("GOALS")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 60)
                    .padding(.horizontal, 20)

                // Subtitle
                Text("Why did you download CHAPTER?")
                    .font(.system(size: 18))
                    .foregroundColor(Color.white.opacity(0.8))
                    .padding(.horizontal, 20)

                // Text box with placeholder question
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                        .frame(height: 150)
                        .padding(.horizontal, 20)

                    Text("Do you want to improve your craft, find new people to hangout with, find someone to build something with?")
                        .font(.system(size: 16))
                        .foregroundColor(Color.white.opacity(0.8))
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .multilineTextAlignment(.leading)
                }

                Spacer()

                // Arrow button at the bottom with NavigationLink to NewChaptersAwait
                HStack {
                    Spacer()
                    NavigationLink(destination: NewChaptersAwait()) {
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
        .navigationBarHidden(true)  // Ensure navigation bar is hidden, preventing the back button
    }
}

struct OnboardingGoals_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingGoals()
    }
}
