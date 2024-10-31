import SwiftUI

struct OtherProfile: View {
    @State private var isSharePresented = false
    
    var body: some View {
        ZStack {
            Color(red: 0.04, green: 0.04, blue: 0.04)
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 20) {
                // Profile Picture, Name, Location, and Close Icon
                HStack(alignment: .top) {
                    // Profile Picture
                    Image("PNGimage1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Spacer(minLength: 20)
                    
                    // Name and Location
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Jackson, 23")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)

                        Text("San Diego, CA")
                            .font(.system(size: 20))
                            .foregroundColor(Color(red: 0.32, green: 0.78, blue: 0.56))
                    }

                    Spacer()

                    // Close Icon
                    Button(action: {
                        // Close action
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)

                Divider()
                    .background(Color.white)
                    .padding(.horizontal)

                // Profile Description
                Text("tldr: Financial analyst and founder of Tech Towel, Jackson Schneider, is passionate about surfing, festivals, and growing his brand while seeking like-minded connections in San Diego.")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 10)

                // Section: Career & Ambitions
                SectionView(title: "Career & Ambitions:", description: """
                    • Financial analyst at Cubic Corp, based in San Diego
                    • Founder of Tech Towel, a festival accessory brand, focused on growing the brand through social media and collaborating with artists.
                    """)

                // Section: Hobbies & Interests
                SectionView(title: "Hobbies & Interests:", description: """
                    • Passionate about surfing (3 years of experience) and always on the lookout for new breaks.
                    • Enjoys snowboarding, golfing, and DJing for fun, with a love for house/EDM music.
                    """)

                // Section: Goals & Connections
                SectionView(title: "Goals & Connections", description: """
                    • Interested in learning jiu-jitsu and expanding personal growth through new experiences.
                    • Seeking like-minded, ambitious people who share similar hobbies and goals, having recently moved to San Diego.
                    """)

                Spacer()

                // Message and Share Buttons
                HStack {
                    Spacer()

                    NavigationLink(destination: MessageUser()) {
                        Text("Message")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 120, height: 40)
                            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 2))
                    }

                    Spacer()

                    Button(action: {
                        isSharePresented = true
                    }) {
                        Text("Share")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 120, height: 40)
                            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 2))
                    }
                    .sheet(isPresented: $isSharePresented) {
                        // Open the share sheet with various options
                        ActivityViewController(activityItems: ["Check out Jackson's profile on Chapter App!"])
                    }

                    Spacer()
                }
                .padding(.bottom, 40)
            }
            .padding(.horizontal, 0)
            .padding(.top, 20)
        }
    }
}

// UIViewControllerRepresentable to present the Activity (Share) Sheet
struct ActivityViewController: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: Context) -> UIActivityViewController {
        return UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

// Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OtherProfile()
    }
}
