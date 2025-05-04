//
//  ProfileView.swift
//  RobinHoodDemo
//
//  Created by Sagar Patel on 04/05/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                userHeader
                apyOfferCard
                investmentSummary
                allocationChart
                discoverMoreSection
                disclaimerText
                rewardInviteSection
            }
            .padding()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }

    private var userHeader: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 4) {
                Text("@abhinavji41663")
                    .foregroundColor(.white)
                    .font(.headline)
                Text("$97.81")
                    .foregroundColor(.white)
                    .font(.title2)
                Text("Total in Robinhood")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                Text("Add account")
                    .foregroundColor(.blue)
                    .font(.caption)
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "line.3.horizontal")
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }

    private var apyOfferCard: some View {
        HStack {
            Image(systemName: "creditcard")
                .foregroundColor(.yellow)
            Text("Get a 4.5% APY boost on your brokerage cash! Terms apply.")
                .foregroundColor(.white)
                .font(.subheadline)
            Spacer()
        }
        .padding()
        .background(Color(red: 30/255, green: 30/255, blue: 30/255))
        .cornerRadius(10)
    }

    private var investmentSummary: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Individual investing")
                .foregroundColor(.white)
                .font(.headline)
            HStack {
                Text("Total individual value")
                Spacer()
                Text("$97.81")
            }
            HStack {
                Text("Individual holdings")
                Spacer()
                Text("$0.00")
            }
            HStack {
                Text("Individual cash")
                Spacer()
                Text("$97.81")
            }
            HStack {
                Text("Crypto holdings")
                Spacer()
                Text("$0.00")
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(Color(red: 30/255, green: 30/255, blue: 30/255))
        .cornerRadius(10)
    }

    private var allocationChart: some View {
        VStack(alignment: .leading, spacing: 12) {
            Picker("Allocation", selection: .constant("Stocks")) {
                Text("Stocks").tag("Stocks")
                Text("ETFs").tag("ETFs")
                Text("Options").tag("Options")
                Text("Crypto").tag("Crypto")
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(Color.gray.opacity(0.2))

            HStack {
                ForEach(["Stocks", "ETFs", "Crypto", "Options"], id: \.self) { item in
                    VStack {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 40, height: 40)
                            .overlay(Text("0%").foregroundColor(.white).font(.caption))
                        Text(item).foregroundColor(.gray).font(.caption)
                    }
                }
            }

            Text("Stocks are pieces of a company that investors can own.")
                .foregroundColor(.gray)
                .font(.footnote)

            Text("Learn More")
                .foregroundColor(.blue)
                .font(.footnote)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(["Business", "Consumer Goods", "Energy", "Finance", "Tech"], id: \.self) { sector in
                        Text(sector)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.gray.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                    }
                }
            }
        }
    }

    private var discoverMoreSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Discover more")
                .foregroundColor(.white)
                .font(.headline)

            discoverCard(title: "4.5% APY with Gold", description: "Boost your rate on uninvested cash", icon: "dollarsign.circle")
            discoverCard(title: "Retirement", description: "Earn up to 2% on IRA transfers till April 30", icon: "calendar")
            discoverCard(title: "Transfer accounts in", description: "Consolidate assets", icon: "arrow.right.arrow.left")
        }
    }

    private func discoverCard(title: String, description: String, icon: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.green)
                .font(.title3)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .foregroundColor(.white)
                    .font(.subheadline)
                Text(description)
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            Spacer()
        }
        .padding()
        .background(Color(red: 30/255, green: 30/255, blue: 30/255))
        .cornerRadius(10)
    }

    private var disclaimerText: some View {
        Text("All investing involves risk, including the loss of principal... See more")
            .foregroundColor(.gray)
            .font(.footnote)
            .padding(.top)
    }

    private var rewardInviteSection: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("2 invites")
                    .foregroundColor(.white)
                Text("Earn rewards")
                    .foregroundColor(.white)
                    .bold()
            }
            Spacer()
            Button(action: {}) {
                Text("Earn rewards")
                    .foregroundColor(.black)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .cornerRadius(20)
            }
        }
        .padding(.top, 20)
    }
}
