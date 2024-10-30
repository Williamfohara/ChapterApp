import SwiftUI

struct OnboardingCreateAccount: View {
    var body: some View {
        ZStack {
            // Background color
            Color(red: 0.04, green: 0.04, blue: 0.04).ignoresSafeArea()

            // Main content
            VStack {
                Text("Create your Account")
                    .font(Font.custom("Inter", size: 40).weight(.bold))
                    .foregroundColor(Color(red: 0, green: 0.47, blue: 0.32))
                    .padding()

                // Email Field
                Text("Enter Email")
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                    .padding(.top, 20)

                // Password Field
                Text("Create a Password")
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                    .padding(.top, 20)

                // Confirm Password Field
                Text("Confirm Password")
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                    .padding(.top, 20)

                Spacer()

                // Arrow at the bottom
                Image(systemName: "arrow.right")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
            }
        }
        .frame(width: 393, height: 852)
    }
}

struct OnboardingCreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCreateAccount()
    }
}
