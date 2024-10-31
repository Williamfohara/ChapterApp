import SwiftUI

struct YouPage: View {
    @State private var firstName = ""
    @State private var city = ""
    @State private var age = ""

    var body: some View {
        ZStack {
            // Background color
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text("YOU")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 60)
                    .padding(.horizontal, 20)

                // Subtitle
                Text("Tell us about yourself")
                    .font(.system(size: 18))
                    .foregroundColor(Color.white.opacity(0.8))
                    .padding(.horizontal, 20)

                // Custom TextFields for user input
                VStack(spacing: 30) {
                    // First Name Input
                    CustomTextField(placeholder: "What is your first name?", text: $firstName)
                        .padding(.top, 40) // Padding to create space between subtitle and first field

                    // City Input
                    CustomTextField(placeholder: "What city do you live in?", text: $city)

                    // Age Input
                    CustomTextField(placeholder: "What is your age?", text: $age)
                }

                Spacer()

                // Arrow button at the bottom with NavigationLink
                HStack {
                    Spacer()

                    NavigationLink(destination: Interests()) { // Link to next page
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
        .navigationBarHidden(true)  // This hides the back button
    }
}

struct OnboardingYou_Previews: PreviewProvider {
    static var previews: some View {
        YouPage()
    }
}
