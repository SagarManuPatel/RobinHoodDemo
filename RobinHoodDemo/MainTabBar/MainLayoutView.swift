//
//  MainLayoutView.swift
//  RobinHoodDemo
//
//  Created by Sagar Patel on 04/05/25.
//

import SwiftUI

struct MainLayoutView<Content: View>: View {
    let title: String
    let content: Content
    @Binding var showMenu: Bool
    
    init(title: String, showMenu: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.title = title
        self._showMenu = showMenu
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            NavigationStack {
                content
                    .navigationTitle("")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                withAnimation {
                                    showMenu.toggle()
                                }
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button(action: {
                                // Search
                            }) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.white)
                            }
                            
                            Button(action: {
                                // Notification
                            }) {
                                Image(systemName: "bell")
                                    .foregroundColor(.white)
                            }
                        }
                    }
            }
            
            if showMenu {
                MenuView()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .transition(.move(edge: .leading))
            }
        }
    }
}
