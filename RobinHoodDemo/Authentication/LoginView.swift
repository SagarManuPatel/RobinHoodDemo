//
//  LoginView.swift
//  RobinHoodDemo
//
//  Created by Sagar Patel on 04/05/25.
//
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @AppStorage("isLoggedIn") var isLoggedIn = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer()

                Image(systemName: "leaf.fill") // Placeholder for Robinhood logo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)

                TextField("Email", text: $email)
                    .textFieldStyle(.plain)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .autocapitalization(.none)

                SecureField("Password", text: $password)
                    .textFieldStyle(.plain)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(.white)

                Button(action: {
                    // Handle login
                    isLoggedIn = true
                }) {
                    Text("Log in")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.5))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top)

                Button("I need help") {
                    // Handle help action
                }
                .foregroundColor(.gray)
                .padding(.top)

                Spacer()
            }
            .padding()
        }
    }
}
