import SwiftUI

struct UserProfile: View {
    @State private var profileText: String = ""

    var body: some View {
        ZStack {
            // Background color
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                // Title and Close Icon
                HStack {
                    Text("YOU")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    
                    Spacer()

                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                        .padding(.trailing, 20)
                }
                .padding(.top, 60)
                .padding(.horizontal, 20)

                // Profile Edit Box
                ZStack(alignment: .leading) {
                    if profileText.isEmpty {
                        Text("Edit your profile here...")
                            .foregroundColor(Color.white.opacity(0.5))
                            .padding(.leading, 25)
                    }
                    TextField("", text: $profileText)
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
                        .padding(.horizontal, 20)
                }

                // Profile Picture
                HStack {
                    Image("jackson") // Replace with the actual image
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Jackson")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        
                        HStack {
                            Text("Location:")
                                .foregroundColor(.white)
                            Text("San Diego, CA")
                                .foregroundColor(.green)
                        }
                        
                        HStack {
                            Text("Age:")
                                .foregroundColor(.white)
                            Text("23")
                                .foregroundColor(.green)
                        }
                    }
                }
                .padding(.horizontal, 20)

                .padding(.horizontal, 10)

                Divider()
                    .background(Color.white)
                    .padding(.horizontal, 20)

                // Profile Description
                Text("tldr: Financial analyst and founder of Tech Towel, Jackson Schneider, is passionate about surfing, festivals, and growing his brand while seeking like-minded connections in San Diego.")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)

                // Career & Ambitions Section
                SectionView(title: "Career & Ambitions:", description: "• Financial analyst at Cubic Corp, based in San Diego\n• Founder of Tech Towel, a festival accessory brand, focused on growing the brand through social media and collaborating with artists.")
                
                // Hobbies & Interests Section
                SectionView(title: "Hobbies & Interests:", description: "• Passionate about surfing (3 years of experience) and always on the lookout for new breaks.\n• Enjoys snowboarding, golfing, and DJing for fun, with a love for house/EDM music.")

                // Goals & Connections Section
                SectionView(title: "Goals & Connections", description: "• Interested in learning jiu-jitsu and expanding personal growth through new experiences.\n• Seeking like-minded, ambitious people who share similar hobbies and goals, having recently moved to San Diego.")

                Spacer()
            }
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
