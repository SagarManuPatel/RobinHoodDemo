//
//  MainTabBarView.swift
//  RobinHoodDemo
//
//  Created by Sagar Patel on 04/05/25.
//


import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    @State private var showMenu = false
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        
        // Title styling
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold)
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        // Apply appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    // Main Content Area
                    Group {
                        switch selectedTab {
                        case 0: PortfolioPage()
                        case 1: ProfileView()
                            //                        case 2: WatchlistView()
                            //                        case 3: WalletView()
                            //                        case 4: MenuView()
                        default: Text("Unknown")
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                    
                    // Tab Bar
                    HStack {
                        tabBarItem(title: "Portfolio", image: "chart.bar.fill", index: 0)
                        tabBarItem(title: "Profile", image: "person.crop.circle", index: 1)
                        tabBarItem(title: "Watchlist", image: "star", index: 2)
                        tabBarItem(title: "Wallet", image: "wallet.pass", index: 3)
                        tabBarItem(title: "Menu", image: "line.3.horizontal", index: 4)
                    }
                    .padding(.vertical, 10)
                    .background(Color.black)
                }
                
                // Side Menu Overlay
                if showMenu {
                    MenuView()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .transition(.move(edge: .leading))
                        .zIndex(1)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation {
                            showMenu.toggle()
                        }
                    }) {
                        Image(systemName: showMenu ? "chevron.left" : "line.horizontal.3")
                            .foregroundColor(.white)
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "bell")
                            .foregroundColor(.white)
                    }
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // Reusable Tab Item Button
    private func tabBarItem(title: String, image: String, index: Int) -> some View {
        Button(action: {
            selectedTab = index
        }) {
            VStack(spacing: 4) {
                Image(systemName: image)
                Text(title).font(.caption)
            }
            .foregroundColor(selectedTab == index ? .white : .gray)
            .frame(maxWidth: .infinity)
        }
    }
}


