import SwiftUI

struct FirstPage: View {
    @State private var showingLoginScreen = false
    @State private var showingSignUpScreen = false

    // Define a consistent green color
    let chapterGreen = Color(red: 0.0, green: 0.47, blue: 0.32)

    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                Color.black.ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    // App Title
                    Text("WELCOME TO CHAPTER")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(chapterGreen)
                        .padding(.top, 40)

                    // Subtitle
                    Text("Connect with people around you")
                        .font(.system(size: 18))
                        .foregroundColor(Color.white.opacity(0.8))
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    // Log In Button styled like input boxes
                    Button(action: {
                        showingLoginScreen = true
                    }) {
                        Text("Log In")
                            .font(.system(size: 18, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .overlay(Rectangle().stroke(Color.white, lineWidth: 1))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                    .navigationDestination(isPresented: $showingLoginScreen) {
                        HomePage() // Define `HomePage` separately
                    }
                    
                    // "New to Chapter?" Text
                    Text("New to Chapter?")
                        .font(.system(size: 16))
                        .foregroundColor(Color.white.opacity(0.8))
                        .padding(.top, 10)
                    
                    // Sign Up Button styled like input boxes
                    Button(action: {
                        showingSignUpScreen = true
                    }) {
                        Text("Sign Up")
                            .font(.system(size: 18, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .overlay(Rectangle().stroke(Color.white, lineWidth: 1))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 10)
                    .navigationDestination(isPresented: $showingSignUpScreen) {
                        CreateAccount() // Define `CreateAccount` separately
                    }
                    
                    Spacer()
                    
                    // Forgot Password Link
                    Button(action: {
                        // Action for forgot password
                    }) {
                        Text("Forgot password?")
                            .font(.system(size: 16))
                            .foregroundColor(Color.white.opacity(0.8))
                            .padding(.bottom, 40)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
    }
}
