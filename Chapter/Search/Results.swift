import SwiftUI

struct Results: View {
    @State private var typedSubtitle = ""
    @State private var subtitle = "like fishing and were in a fraternity"
    @State private var subtitleTypingCompleted = false
    @State private var typingSpeed = 0.02 // Fast typing speed

    var body: some View {
        ZStack {
            // Background color
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text("HERE ARE OTHERS WHO...")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 60)
                    .padding(.horizontal, 20)

                // Subtitle with typing animation
                Text(typedSubtitle)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .onAppear {
                        startTypingAnimation(for: subtitle) {
                            subtitleTypingCompleted = true
                        }
                    }

                // List of users with slide-in animation
                if subtitleTypingCompleted {
                    ScrollView {
                        VStack(spacing: 0) {
                            AnimatedSearchResultRow(imageName: "user1", name: "Casey, 22, Williamsburg, NY", description: "Casey grew up deep sea fishing, was in Sigma Nu fraternity at CU Boulder, and loves skating", delay: 0.1)

                            Divider().background(Color.white)

                            NavigationLink(destination: OtherProfile()) {
                                AnimatedSearchResultRow(imageName: "user2", name: "Jackson, 24, East Village, NY", description: "Jackson is an expert fly fisherman, was in Pi Kappa Phi fraternity at CU Boulder, and has been recently getting back into skating", delay: 0.2)
                            }

                            Divider().background(Color.white)

                            AnimatedSearchResultRow(imageName: "user3", name: "Billy, 23, Lower East Side, NY", description: "Billy fished casually as a kid, but is looking to advance his skill, was in Phi Delta Theta fraternity at University of Utah, and is fascinated by skate culture", delay: 0.3)
                        }
                        .padding(.horizontal, 20)
                    }
                }

                Spacer()

                // Back arrow at the bottom
                HStack {
                    Spacer()
                    NavigationLink(destination: HomePage()) {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                            .padding(.bottom, 40)
                    }
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }

    // Function to animate typing for subtitle
    func startTypingAnimation(for text: String, completion: @escaping () -> Void) {
        typedSubtitle = ""
        Timer.scheduledTimer(withTimeInterval: typingSpeed, repeats: true) { timer in
            if typedSubtitle.count < text.count {
                let index = text.index(text.startIndex, offsetBy: typedSubtitle.count)
                typedSubtitle.append(text[index])
            } else {
                timer.invalidate()
                completion() // Callback when typing completes
            }
        }
    }
}

// Custom row with slide-in animation for each profile
struct AnimatedSearchResultRow: View {
    var imageName: String
    var name: String
    var description: String
    var delay: Double // Delay to stagger slide-in animations in sequence

    @State private var isVisible = false

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            // Square Profile Picture with fixed width
            Image(systemName: "person.crop.square.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.gray)

            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)

                Text(description)
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.8))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 10)
        .offset(y: isVisible ? 0 : 50) // Initial offset to start below view
        .opacity(isVisible ? 1 : 0)    // Fade-in effect
        .animation(.easeOut(duration: 0.4).delay(delay), value: isVisible)
        .onAppear {
            isVisible = true
        }
    }
}

struct SearchResults_Previews: PreviewProvider {
    static var previews: some View {
        Results()
    }
}
