//
//  SignIn.swift
//  Chapter
//
//  Created by Casey McGrath on 10/31/24.
//

import SwiftUI

struct SignIn: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
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
                    Text("Password")
                        .font(Font.custom("Inter", size: 16))
                        .foregroundColor(.white)
                    
                    SecureField("", text: $password)
                        .padding()
                        .background(Color.black)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 1))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 20)
                
                Spacer()

                // Arrow Button at the Bottom
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
