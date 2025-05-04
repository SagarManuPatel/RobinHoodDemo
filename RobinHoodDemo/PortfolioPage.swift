//
//  ContentView.swift
//  RobinHoodDemo
//
//  Created by Sagar Patel on 04/05/25.
//

import SwiftUI

struct PortfolioPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Scroll - 0: Portfolio Overview
                portfolioSummaryView
                
                // Scroll - 1: Cash and Prediction Markets
                documentUploadBanner
                cashSection
                predictionMarketsSection
                
                // Scroll - 2: Discover & Lists
                discoverSection
                listSection
                
                // Scroll - 3: Watchlist
                watchlistSection
            }
            .padding()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .foregroundColor(.white)
    }
}

private extension PortfolioPage {
    
    var portfolioSummaryView: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Investing")
                    .font(.headline)
                Spacer()
                Text("$97.81")
                    .bold()
            }
            
            Text("▲ $215.21 All time")
                .foregroundColor(.green)
            
            Image(systemName: "waveform.path.ecg") // Placeholder for chart
                .resizable()
                .frame(height: 100)
                .foregroundColor(.green)
            
            HStack {
                ForEach(["1W", "1M", "3M", "YTD", "1Y", "ALL"], id: \.self) { label in
                    Text(label)
                        .font(.caption)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                }
            }
            
            HStack {
                Text("Buying power")
                Spacer()
                Text("$97.81")
            }
        }
    }
    
    var documentUploadBanner: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Upload Your Document")
                .font(.headline)
            Text("Take a photo of your bank statement now to continue using Robinhood.")
                .font(.caption)
                .foregroundColor(.gray)
            Button("Take Photo Now") {
                // Action
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(Color(.clear))
        .cornerRadius(10)
    }
    
    var cashSection: some View {
        VStack(alignment: .leading) {
            Text("Cash")
                .font(.headline)
            HStack {
                Text("Cash balance")
                Spacer()
                Text("$97.81")
            }
            HStack {
                Text("Current interest rate")
                Spacer()
                Text("0% APY")
            }
            Text("Earn 4.5% APY")
                .foregroundColor(.green)
        }
        .padding()
        .background(Color(.clear))
        .cornerRadius(10)
    }
    
    var predictionMarketsSection: some View {
        VStack(alignment: .leading) {
            Text("Prediction markets")
                .font(.headline)
            VStack(alignment: .leading, spacing: 8) {
                Text("• Fed decision in May")
                Text("• Inflation in April")
            }
        }
        .padding()
        .background(Color(.clear))
        .cornerRadius(10)
    }
    
    var discoverSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Discover more")
                .font(.headline)
            Group {
                discoverRow(title: "4.5% APY with Gold", subtitle: "Boost your rate on uninvested cash")
                discoverRow(title: "Robinhood Strategies", subtitle: "Get access to an expert-managed portfolio", badge: "New")
                discoverRow(title: "Retirement", subtitle: "Earn up to 2% on IRA transfers till April 30")
                discoverRow(title: "Transfer accounts in", subtitle: "Consolidate assets")
            }
        }
        .padding()
        .background(Color(.clear))
        .cornerRadius(10)
    }
    
    func discoverRow(title: String, subtitle: String, badge: String? = nil) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(title).bold()
                if let badge = badge {
                    Text(badge)
                        .font(.caption2)
                        .padding(4)
                        .background(Color.green)
                        .cornerRadius(5)
                }
            }
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 4)
    }
    
    var listSection: some View {
        VStack(alignment: .leading) {
            Text("Lists")
                .font(.headline)
            Button(action: {}) {
                Label("Create watchlist or screener", systemImage: "plus")
            }
            .foregroundColor(.green)
            
            HStack {
                Text("My First List")
                Spacer()
                Text("21 items")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(.clear))
        .cornerRadius(10)
    }
    
    var watchlistSection: some View {
        VStack(alignment: .leading) {
            Text("Watchlist")
                .font(.headline)
            ForEach(sampleStocks, id: \.symbol) { stock in
                HStack {
                    VStack(alignment: .leading) {
                        Text(stock.symbol)
                        Text(stock.name)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Image(systemName: "waveform.path.ecg") // Chart icon
                        .foregroundColor(.green)
                    Text(stock.change)
                        .foregroundColor(stock.isPositive ? .green : .red)
                }
                .padding(.vertical, 4)
            }
        }
    }
}

struct Stock: Identifiable {
    var id = UUID()
    var symbol: String
    var name: String
    var change: String
    var isPositive: Bool
}

let sampleStocks = [
    Stock(symbol: "BAC", name: "Bank of America", change: "+0.55%", isPositive: true),
    Stock(symbol: "SYF", name: "Synchrony Financial", change: "+0.63%", isPositive: true),
    Stock(symbol: "LOGC", name: "ContextLogic", change: "+0.28%", isPositive: true),
    Stock(symbol: "AAPL", name: "Apple", change: "+0.22%", isPositive: true),
    Stock(symbol: "META", name: "Meta Platforms", change: "+0.01%", isPositive: true),
    Stock(symbol: "BEP", name: "Brookfield Renewables", change: "+0.04%", isPositive: true),
    Stock(symbol: "AAL", name: "American Airlines", change: "+0.00%", isPositive: true),
    Stock(symbol: "PWRD", name: "TCW Transform", change: "-0.07%", isPositive: false)
]

