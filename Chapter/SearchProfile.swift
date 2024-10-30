import SwiftUI

struct SearchProfile: View {
    var body: some View {
        ZStack {
            Color(red: 0.04, green: 0.04, blue: 0.04)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                // Profile Picture and Close Icon
                HStack {
                    Image("PNGimage1") // No need to include .png extension
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                    Spacer()

                    Button(action: {
                        // Close action - Add any action needed
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 20)

                // Profile Information (Name, Age, Location)
                Text("Jackson, 23")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)

                Text("San Diego, CA")
                    .font(.system(size: 20))
                    .foregroundColor(Color(red: 0.32, green: 0.78, blue: 0.56))
                    .padding(.horizontal, 20)

                Divider()
                    .background(Color.white)
                    .padding(.horizontal, 20)

                // Profile Description
                Text("tldr: Financial analyst and founder of Tech Towel, Jackson Schneider, is passionate about surfing, festivals, and growing his brand while seeking like-minded connections in San Diego.")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
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
                        // Share action
                    }) {
                        Text("Share")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 120, height: 40)
                            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 2))
                    }

                    Spacer()
                }
                .padding(.bottom, 40)
            }
            .padding(.top, 20)
        }
        .frame(width: 393, height: 852)
    }
}

// Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SearchProfile()
    }
}
