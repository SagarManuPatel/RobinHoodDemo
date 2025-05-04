//
//  RobinHoodDemoApp.swift
//  RobinHoodDemo
//
//  Created by Sagar Patel on 04/05/25.
//

import SwiftUI

@main
struct RobinHoodDemoApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainTabView()
            } else {
                LoginSignUpView()
            }
        }
    }
}
