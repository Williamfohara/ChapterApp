import SwiftUI

struct SearchResults: View {
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

                // Sub-title with highlighted words (Refactored to separate Text elements)
                HStack {
                    Text("like ")
                        .foregroundColor(.white)
                    Text("fishing ")
                        .foregroundColor(.green)
                    Text("and were in a ")
                        .foregroundColor(.white)
                    Text("fraternity")
                        .foregroundColor(.green)
                }
                .font(.system(size: 18)) // Common font size for all
                .padding(.horizontal, 20)

                // List of users
                ScrollView {
                    VStack(spacing: 20) {
                        // User 1
                        SearchResultRow(imageName: "user1", name: "Casey, 22, Williamsburg, NY", description: "Casey grew up deep sea fishing, was in Sigma Nu fraternity at CU Boulder, and loves skating")

                        // User 2 with NavigationLink to SearchProfile
                        NavigationLink(destination: SearchProfile()) {
                            SearchResultRow(imageName: "user2", name: "Jackson, 24, East Village, NY", description: "Jackson is an expert fly fisherman, was in Pi Kappa Phi fraternity at CU Boulder, and has been recently getting back into skating")
                        }

                        // User 3
                        SearchResultRow(imageName: "user3", name: "Billy, 23, Lower East Side, NY", description: "Billy fished casually as a kid, but is looking to advance his skill, was in Phi Delta Theta fraternity at University of Utah, and is fascinated by skate culture")
                    }
                    .padding(.horizontal, 20)
                }

                Spacer()

                // Back arrow at the bottom
                HStack {
                    Spacer()
                    NavigationLink(destination: SearchPage()) {
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
        .navigationBarHidden(true) // Hides the navigation bar to prevent the back button
    }
}

// Custom row to represent each search result
struct SearchResultRow: View {
    var imageName: String
    var name: String
    var description: String

    var body: some View {
        HStack {
            // Image placeholder (you can replace this with actual image)
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.gray)

            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)

                Text(description)
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .padding(.vertical, 10)
        .overlay(Divider().background(Color.white), alignment: .bottom)
    }
}

struct SearchResults_Previews: PreviewProvider {
    static var previews: some View {
        SearchResults()
    }
}
