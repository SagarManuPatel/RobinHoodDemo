//
//  LoginSignUpView.swift
//  RobinHoodDemo
//
//  Created by Sagar Patel on 04/05/25.
//
import SwiftUI

struct LoginSignUpView: View {
    var body: some View {
        NavigationView {
            ZStack {
//                Image("IMG_0167") // can add bg image here
//                    .resizable()
//                    .scaledToFill()
//                    .ignoresSafeArea()

                VStack {
                    Spacer()
                    Text("Welcome to Robinhood")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 5)

                    Text("Join 23 million customers with access to US stocks and put your money in motion.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .padding(.horizontal, 30)
                        .padding(.bottom, 40)

                    HStack(spacing: 20) {
                        NavigationLink(destination: LoginView()) {
                            Text("Log in")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.black)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.black))
                        }

                        Button(action: {
                            // Handle sign up action
                        }) {
                            Text("Sign up")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                }
            }
        }
    }
}

