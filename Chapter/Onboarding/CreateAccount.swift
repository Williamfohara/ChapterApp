import SwiftUI

struct CreateAccount: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var signUpError = ""
    @State private var isAccountCreated = false
    
    var body: some View {
        NavigationView {
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
                    
                    // Display sign-up error if any
                    if !signUpError.isEmpty {
                        Text(signUpError)
                            .foregroundColor(.red)
                            .padding()
                    }
                    
                    // Display success message if account is created
                    if isAccountCreated {
                        Text("Account created successfully!")
                            .foregroundColor(.green)
                            .padding()
                    }
                    
                    // Sign-Up Button
                    Button(action: {
                        // Validate password confirmation
                        guard password == confirmPassword else {
                            signUpError = "Passwords do not match."
                            return
                        }
                        
                        // Call the Supabase sign-up function
                        SupabaseManager.shared.signUp(email: email, password: password) { result in
                            switch result {
                            case .success:
                                isAccountCreated = true
                                signUpError = "" // Clear any previous error
                                print("Account created successfully")
                            case .failure(let error):
                                signUpError = error.localizedDescription
                            }
                        }
                    }) {
                        Text("Create Account")
                            .font(.system(size: 18, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 40)
                    
                    Spacer()
                    
                    // Arrow Button at the Bottom to navigate (optional)
                    NavigationLink(destination: HomePage()) {
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .padding(.bottom, 40)
                }
            }
            .navigationBarHidden(true) // Hide the navigation bar if desired
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

// Preview Provider for CreateAccount
struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount()
    }
}
