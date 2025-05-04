//
//  MenuView.swift
//  RobinHoodDemo
//
//  Created by Sagar Patel on 04/05/25.
//
import SwiftUI

struct MenuView: View {
    @AppStorage("isLoggedIn") var isLoggedIn = true

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack {
                Text("Menu")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "person.crop.circle")
                    .font(.title2)
                    .foregroundColor(.yellow)
                    .padding()
                    .background(Circle().stroke(Color.yellow, lineWidth: 2))
            }

            MenuItem(title: "Investing", subtitle: "Balances, recurring investments, DRIP, Stock Lending")
            MenuItem(title: "Crypto", subtitle: "Transfer limits")
            MenuItem(title: "Transfers", subtitle: "Deposits, withdrawals, account transfers")
            MenuItem(title: "Rewards", subtitle: "Invite friends, earn stocks, get rewards")
            MenuItem(title: "History", subtitle: "Activity across all accounts")
            MenuItem(title: "Reports and statements", subtitle: "Account activity reports, monthly statements")
            MenuItem(title: "Tax center", subtitle: "Tax documents, FAQs")

            //Logout
            MenuItem(title: "Logout", subtitle: "") {
                isLoggedIn = false
            }

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.black)
    }
}


struct MenuItem: View {
    var title: String
    var subtitle: String
    var action: (() -> Void)? = nil  // optional callback

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    if !subtitle.isEmpty {
                        Text(subtitle)
                            .foregroundColor(.gray)
                            .font(.footnote)
                    }
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .contentShape(Rectangle()) // make the whole row tappable
            .onTapGesture {
                action?()
            }

            Divider().background(Color.gray)
        }
    }
}


