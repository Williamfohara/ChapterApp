import SwiftUI

struct MessageUser: View {
    @State private var messageText: String = ""

    var body: some View {
        ZStack {
            // Background color
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text("CHAT WITH")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 60)
                    .padding(.horizontal, 20)

                // User Name
                Text("JACKSON")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.green)
                    .padding(.horizontal, 20)

                // User Details
                Text("Jackson, 22, Williamsburg, NY")
                    .font(.system(size: 16))
                    .foregroundColor(Color.white.opacity(0.8))
                    .padding(.horizontal, 20)

                Divider()
                    .background(Color.white)
                    .padding(.horizontal, 20)

                Spacer()

                // Spacer to push the text field to the bottom
                Spacer()

                // Message input field without the arrow
                TextField("Reply", text: $messageText)
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                    .padding(.horizontal, 20)

                // Bottom padding to keep the box above the navigation buttons
                .padding(.bottom, 40)

                // Back arrow at the bottom
                HStack {
                    Spacer()
                    NavigationLink(destination: OtherProfile()) {
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

struct MessageUser_Previews: PreviewProvider {
    static var previews: some View {
        MessageUser()
    }
}
