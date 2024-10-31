import SwiftUI

struct Inbox: View {
    var body: some View {
        ZStack {
            // Background color
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text("INBOX")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 60)
                    .padding(.horizontal, 20)

                // Pending Messages Section
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Pending messages")
                            .font(.system(size: 18))
                            .foregroundColor(.white)

                        Text("(2)")
                            .font(.system(size: 18))
                            .foregroundColor(.green)
                    }
                    .padding(.horizontal, 20)

                    Divider()
                        .background(Color.white)
                        .padding(.horizontal, 20)

                    // Message 1
                    MessageRow(imageName: "person1", name: "Casey, 22, Williamsburg, NY", messagePreview: "Whats up dude! I saw you grew up deep sea fis...", isPending: true)

                    // Message 2
                    MessageRow(imageName: "person2", name: "Billy, 22, Williamsburg, NY", messagePreview: "Yoooo, I see that you love to skate, I've been ...", isPending: true)
                }

                // Accepted Messages Section
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Accepted messages")
                            .font(.system(size: 18))
                            .foregroundColor(.white)

                        Text("(1)")
                            .font(.system(size: 18))
                            .foregroundColor(.green)
                    }
                    .padding(.horizontal, 20)

                    Divider()
                        .background(Color.white)
                        .padding(.horizontal, 20)

                    // Message 1
                    MessageRow(imageName: "person3", name: "Dave, 22, Chinatown, NY", messagePreview: "Fuckin great time with you and the lads last week...", isPending: false)
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
    }
}

// Custom row for messages
struct MessageRow: View {
    var imageName: String
    var name: String
    var messagePreview: String
    var isPending: Bool

    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill") // Replace with actual image
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.gray)

            VStack(alignment: .leading) {
                HStack {
                    Text(name)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)

                    Spacer()

                    if isPending {
                        HStack(spacing: 10) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)

                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                        }
                    }
                }

                Text(messagePreview)
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}

struct Inbox_Previews: PreviewProvider {
    static var previews: some View {
        Inbox()
    }
}
