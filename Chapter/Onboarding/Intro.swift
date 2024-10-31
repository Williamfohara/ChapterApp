import SwiftUI

struct Intro: View {
    var body: some View {
        ZStack {
            // Background
            Color.black.ignoresSafeArea()

            // Align CHAPTER and Welcome text to top-left
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading, spacing: 10) { // Adjust spacing between title and subtitle
                        // Title
                        Text("CHAPTER")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(Color.green)
                        
                        // Subtitle
                        Text("Welcome new user")
                            .font(.system(size: 18))
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer() // Pushes the elements to the top
            }
            .padding(.leading, 20) // Add padding to the left
            .padding(.top, 70) // Add padding to the top
            
            // Align "Onboarding ahead..." to bottom-left and arrow to bottom-center
            VStack {
                Spacer()
                
                HStack {
                    // "Onboarding ahead..." aligned to the bottom-left
                    Text("Onboarding ahead...")
                        .font(.system(size: 16))
                        .foregroundColor(Color.white.opacity(0.8))
                        .padding(.leading, 20) // Padding for the left alignment
                        .padding(.bottom, UIScreen.main.bounds.height * 0.05) // Move up by 5% of screen height
                    
                    Spacer() // Pushes arrow to the center
                }
                
                // Arrow centered at the bottom with NavigationLink
                NavigationLink(destination: Instructions()) {
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 40) // Padding for bottom alignment
                }
            }
        }
    }
}

struct OnboardingIntro_Previews: PreviewProvider {
    static var previews: some View {
        Intro()
    }
}
