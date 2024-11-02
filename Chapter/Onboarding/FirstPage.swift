import SwiftUI

struct FirstPage: View {
    @State private var showingLoginScreen = false
    @State private var showingCreateAccountScreen = false

    // Define a consistent green color
    let chapterGreen = Color(red: 0.0, green: 0.47, blue: 0.32)

    var body: some View {
        NavigationStack {
            ZStack {
                // Background Color
                Color.black.ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    // App Name
                    Text("CHAPTER")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(chapterGreen)
                    
                    // Subtitle
                    Text("Create an account or log in to get started")
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
                        HomePage() // Destination for Log In button
                    }
                    
                    // "First time?" Text
                    Text("First time?")
                        .font(.system(size: 16))
                        .foregroundColor(Color.white.opacity(0.8))
                        .padding(.top, 10)
                    
                    // Sign Up Button styled like input boxes
                    Button(action: {
                        showingCreateAccountScreen = true
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
                    .navigationDestination(isPresented: $showingCreateAccountScreen) {
                        CreateAccount() // Destination for Sign Up button
                    }
                    
                    Spacer()
                    
                    // Forgot Password Link
                    Button(action: {
                        // Forgot password action
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

