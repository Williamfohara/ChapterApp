import SwiftUI

struct LoginPage: View {
    @State private var email = ""
    @State private var password = ""
    @State private var loginError = ""
    @State private var isLoggedIn = false

    var body: some View {
        NavigationStack { // Wrap in NavigationStack
            ZStack {
                // Background color
                Color.black.ignoresSafeArea()

                // Main content
                VStack(spacing: 30) {
                    // Title Text
                    VStack(spacing: 5) {
                        Text("WELCOME BACK")
                            .font(Font.custom("Inter", size: 32).weight(.bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Text("SIGN IN")
                            .font(Font.custom("Inter", size: 18).weight(.medium))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 40)
                    
                    // Email Field
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Email Address")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(.white)
                        
                        TextField("Enter your email", text: $email)
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
                        Text("Password")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(.white)
                        
                        SecureField("Enter your password", text: $password)
                            .padding()
                            .background(Color.black)
                            .overlay(Rectangle().stroke(Color.white, lineWidth: 1))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 20)
                    
                    // Log In Button
                    Button(action: {
                        SupabaseManager.shared.signIn(email: email, password: password) { result in
                            switch result {
                            case .success:
                                isLoggedIn = true // Navigate to HomePage on success
                            case .failure(let error):
                                loginError = error.localizedDescription
                            }
                        }
                    }) {
                        Text("Log In")
                            .font(Font.custom("Inter", size: 18).weight(.bold))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 20)

                    // Display error message if login fails
                    if !loginError.isEmpty {
                        Text(loginError)
                            .foregroundColor(.red)
                            .padding()
                    }

                    Spacer()
                }
                .navigationDestination(isPresented: $isLoggedIn) {
                    HomePage() // Destination view when isLoggedIn is true
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
