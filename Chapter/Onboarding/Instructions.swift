import SwiftUI

struct Instructions: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                Color.black.ignoresSafeArea()

                VStack(alignment: .leading, spacing: 20) {
                    // Title
                    Text("CHAPTER")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(Color.green)
                        .padding(.top, 60) // Adjust for top padding
                        .padding(.horizontal, 20) // Apply horizontal padding

                    // Subtitle
                    Text("Before you begin...")
                        .font(.system(size: 18))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 20) // Apply horizontal padding

                    // Move Instruction Text lower with padding
                    VStack(alignment: .leading, spacing: 15) {
                        Text("The effort that you put into your responses will directly impact the quality of your experience on Chapter.")
                            .font(.system(size: 16))
                            .foregroundColor(Color.white.opacity(0.9))

                        Text("Don’t worry about grammar or spelling, get as many thoughts down as you can")
                            .font(.system(size: 16))
                            .foregroundColor(Color.white.opacity(0.9))
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 160) // Move this VStack down by adding top padding

                    Spacer() // Keeps other elements pushed to the bottom

                    // "No pressure" text at the bottom left
                    HStack {
                        Text("No pressure, you can update anytime")
                            .font(.system(size: 16))
                            .foregroundColor(Color.green)
                            .padding(.leading, 20) // Padding to align to the left
                        Spacer()
                    }

                    // Arrow centered at the bottom with NavigationLink
                    NavigationLink(destination: YouPage()) {
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 40) // Padding for bottom alignment
                    }
                    .frame(maxWidth: .infinity) // Center the arrow
                }
            }
        }
        .navigationBarHidden(true) // Hides the navigation bar for a cleaner look
    }
}

struct OnboardingInstructions_Previews: PreviewProvider {
    static var previews: some View {
        Instructions()
    }
}
