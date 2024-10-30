import SwiftUI

struct OnboardingInterests: View {
    @State private var favoriteThings = ""
    @State private var currentInterests = ""
    @State private var improvingSkills = ""

    var body: some View {
        ZStack {
            // Background color
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text("INTERESTS")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 60)
                    .padding(.horizontal, 20)

                // Subtitle
                Text("What does your day to day look like?")
                    .font(.system(size: 18))
                    .foregroundColor(Color.white.opacity(0.8))
                    .padding(.horizontal, 20)

                // Custom TextFields for user input
                VStack(spacing: 30) {
                    // Favorite Things Input
                    CustomTextField(placeholder: "What are your favorite things to do? Activities ie. do you like to skate, sing, build stuff ect.", text: $favoriteThings)
                        .padding(.top, 40) // Padding to create space between subtitle and first field

                    // Current Interests Input
                    CustomTextField(placeholder: "What are you interested in rn? (Hobbies, ect.)", text: $currentInterests)

                    // Improving Skills Input
                    CustomTextField(placeholder: "Any skills you're working on improving?", text: $improvingSkills)
                }

                Spacer()

                // Arrow button at the bottom with NavigationLink to OnboardingGoals
                HStack {
                    Spacer()
                    NavigationLink(destination: OnboardingGoals()) {
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

// Custom TextField to handle placeholder color and input text styling
struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        ZStack(alignment: .leading) {
            // Placeholder
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(white: 0.6)) // Placeholder color (grayish white)
                    .padding(.leading, 25) // Adjust padding to keep placeholder inside the box
            }

            // Actual TextField
            TextField("", text: $text)
                .padding(15) // Same padding for TextField input
                .foregroundColor(Color(white: 0.9)) // Input text color (grayish white)
                .background(Color.clear) // Optional: ensure transparent background
                .overlay(Rectangle().stroke(Color.white, lineWidth: 1)) // Sharp edges
                .padding(.horizontal, 20)
        }
        .frame(height: 50) // Ensure the frame is consistent for all input fields
    }
}


// Preview
struct OnboardingInterests_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingInterests()
    }
}
