import SwiftUI

struct OnboardingCreateAccount: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            // Background color
            Color.black.ignoresSafeArea()

            // Main content
            VStack(spacing: 30) {
                // Title Text
                Text("CREATE YOUR\nACCOUNT")
                    .font(Font.custom("Inter", size: 32).weight(.bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                
                // Email Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("Enter Email Address")
                        .font(Font.custom("Inter", size: 16))
                        .foregroundColor(.white)
                    
                    TextField("", text: $email)
                        .padding()
                        .background(Color.black)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 1))
                        .foregroundColor(.white)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                }
                .padding(.horizontal, 20)

                // Password Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("Create a Password")
                        .font(Font.custom("Inter", size: 16))
                        .foregroundColor(.white)
                    
                    SecureField("", text: $password)
                        .padding()
                        .background(Color.black)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 1))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 20)

                // Confirm Password Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("Confirm Password")
                        .font(Font.custom("Inter", size: 16))
                        .foregroundColor(.white)
                    
                    SecureField("", text: $confirmPassword)
                        .padding()
                        .background(Color.black)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 1))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 20)
                
                Spacer()

                // Arrow Button at the Bottom
                Button(action: {
                    // Handle account creation action
                }) {
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding()
                }
                .padding(.bottom, 40)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct OnboardingCreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCreateAccount()
    }
}
