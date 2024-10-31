import SwiftUI

struct HomePage: View {
    @State private var dotCount = 0
    
    var body: some View {
        ZStack {
            Color(red: 0.04, green: 0.04, blue: 0.04)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    // Message and Profile icons aligned on the left
                    HStack(spacing: 20) { // Adjust spacing as needed
                        // Link the mail icon to Inbox
                        NavigationLink(destination: Inbox()) {
                            Image(systemName: "envelope")
                                .resizable()
                                .frame(width: 34, height: 28) // Adjust size if needed
                                .foregroundColor(.white)
                        }
                        
                        // Profile icon with NavigationLink to UserProfile
                        NavigationLink(destination: UserProfile()) {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: 34, height: 34) // Adjust size if needed
                                .foregroundColor(.white)
                        }
                    }
                    
                    Spacer() // Push settings icon to the right
                    
                    // Link the gear icon to Settings
                    NavigationLink(destination: Settings()) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 34, height: 34) // Adjust size if needed
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 60)

                Spacer()

                // Main prompt text with animated dots
                Text("FIND ME\nSOMEONE WHO" + String(repeating: ".", count: dotCount))
                    .font(.custom("Inter", size: 32))
                    .foregroundColor(Color(red: 0.93, green: 0.93, blue: 0.93))
                    .multilineTextAlignment(.leading)
                    .frame(width: 285, height: 78, alignment: .leading)
                    .padding(.top, -150) // Move text higher
                    .onAppear {
                        // Start timer to update the dots
                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                            dotCount = (dotCount + 1) % 4 // Cycle between 0, 1, 2, and 3 dots
                        }
                    }

                // Centered Search bar with extra spacing
                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 1)
                        .stroke(Color(red: 0.93, green: 0.93, blue: 0.93), lineWidth: 3)
                        .frame(width: 285, height: 39)

                    NavigationLink(destination: Results()) {
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color(red: 0.93, green: 0.93, blue: 0.93))
                            .font(.system(size: 20))
                            .padding(.trailing, 10)
                    }
                }
                .padding(.top, 10) // Space between text and search bar

                Spacer()

                // Bottom bar indicator
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 100, height: 5)
                    .foregroundColor(.white.opacity(0.3))
                    .padding(.bottom, 30)
            }
        }
        .navigationBarHidden(true) // Hide the navigation bar
    }
}

// Preview
struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomePage()
        }
    }
}

