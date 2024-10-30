import SwiftUI

struct SearchPage: View {
    var body: some View {
        ZStack {
            Color(red: 0.04, green: 0.04, blue: 0.04)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    // Link the mail icon to Inbox
                    NavigationLink(destination: Inbox()) {
                        Image(systemName: "envelope")
                            .resizable()
                            .frame(width: 28, height: 22)
                            .foregroundColor(.white)
                    }

                    Spacer()

                    // Profile icon with NavigationLink to UserProfile
                    NavigationLink(destination: UserProfile()) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.white)
                    }

                    Spacer()

                    // Link the gear icon to Settings
                    NavigationLink(destination: Settings()) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 60)

                Spacer()

                // Main prompt text
                Text("FIND ME\nSOMEONE WHO..")
                    .font(.custom("Inter", size: 32))
                    .foregroundColor(Color(red: 0.93, green: 0.93, blue: 0.93))
                    .multilineTextAlignment(.leading)
                    .frame(width: 285, height: 78, alignment: .leading)

                // Search bar with arrow icon
                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 1)
                        .stroke(Color(red: 0.93, green: 0.93, blue: 0.93), lineWidth: 3)
                        .frame(width: 285, height: 39)

                    NavigationLink(destination: SearchResults()) {
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color(red: 0.93, green: 0.93, blue: 0.93))
                            .font(.system(size: 20))
                            .padding(.trailing, 10)
                    }
                }

                Spacer()

                // Bottom bar indicator
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 100, height: 5)
                    .foregroundColor(.white.opacity(0.3))
                    .padding(.bottom, 30)
            }
        }
        .frame(width: 393, height: 852)
        .navigationBarHidden(true) // Hide the navigation bar
    }
}

// Preview
struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchPage()
        }
    }
}
