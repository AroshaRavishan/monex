import SwiftUI

struct Transaction: Identifiable {
    let id = UUID()
    let name: String
    let subtitle: String
    let amount: Double
    let isIncome: Bool
    let icon: String
    let iconColor: Color
}

struct HomeView: View {
    let userName = "Arosha Ravishan"
    @State private var searchText = ""
    @State private var selectedFilter = 0
    let filters = ["Today", "Yesterday", "Last week", "Month", "Year"]
    let transactions: [Transaction] = [
        Transaction(name: "Upwork", subtitle: "Today", amount: 850, isIncome: true, icon: "u.circle.fill", iconColor: .green),
        Transaction(name: "Transfer", subtitle: "Yesterday", amount: 85, isIncome: false, icon: "person.crop.circle.fill", iconColor: .blue),
        Transaction(name: "Paypal", subtitle: "Jan 30, 2022", amount: 1406, isIncome: true, icon: "p.circle.fill", iconColor: .blue),
        Transaction(name: "Youtube", subtitle: "Jan 16, 2022", amount: 11.99, isIncome: false, icon: "play.rectangle.fill", iconColor: .red)
    ]
    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemGroupedBackground).ignoresSafeArea()
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 40, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(height: 320)
                        .edgesIgnoringSafeArea(.top)
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Welcome \(userName)!")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: 44, height: 44)
                                .clipShape(Circle())
                        }
                        .padding(.top, 60)
                        HStack(spacing: 12) {
                            TextField("Search by name, type...", text: $searchText)
                                .padding(12)
                                .background(Color.white)
                                .cornerRadius(14)
                                .font(.subheadline)
                            Button(action: {}) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white.opacity(0.15))
                                        .frame(width: 44, height: 44)
                                    Image(systemName: "bell.fill")
                                        .foregroundColor(Color.orange)
                                }
                            }
                        }
                        .padding(.trailing, 8)
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Total Balance ")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.9))
                            Text("$ 2,548.00")
                                .font(.system(size: 34, weight: .bold))
                                .foregroundColor(.white)
                            HStack {
                                HStack(spacing: 4) {
                                    Image(systemName: "arrow.down.circle")
                                        .foregroundColor(.white.opacity(0.7))
                                    Text("Income")
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.7))
                                }
                                Text("$ 1,840.00")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                Spacer()
                                HStack(spacing: 4) {
                                    Image(systemName: "arrow.up.circle")
                                        .foregroundColor(.white.opacity(0.7))
                                    Text("Expenses")
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.7))
                                }
                                Text("$ 284.00")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(20)
                        .background(Color.blue)
                        .cornerRadius(24)
                        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 4)
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 12)
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("Recent Transactions History")
                            .font(.headline)
                        Spacer()
                        Button(action: {}) {
                            Text("See all")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(filters.indices, id: \.self) { i in
                                Button(action: { selectedFilter = i }) {
                                    Text(filters[i])
                                        .font(.subheadline)
                                        .foregroundColor(selectedFilter == i ? .white : Color.blue)
                                        .padding(.horizontal, 18)
                                        .padding(.vertical, 8)
                                        .background(selectedFilter == i ? Color.blue : Color.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(Color.blue, lineWidth: selectedFilter == i ? 0 : 1)
                                        )
                                        .cornerRadius(16)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                    }
                    VStack(spacing: 0) {
                        ForEach(transactions) { tx in
                            HStack(spacing: 16) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(.systemGray6))
                                        .frame(width: 48, height: 48)
                                    if tx.name == "Upwork" {
                                        Text("Up")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.green)
                                    } else if tx.name == "Paypal" {
                                        Image(systemName: "p.circle.fill")
                                            .resizable()
                                            .frame(width: 32, height: 32)
                                            .foregroundColor(.blue)
                                    } else if tx.name == "Youtube" {
                                        Image(systemName: "play.rectangle.fill")
                                            .resizable()
                                            .frame(width: 32, height: 32)
                                            .foregroundColor(.red)
                                    } else if tx.name == "Transfer" {
                                        Image(systemName: "person.crop.circle.fill")
                                            .resizable()
                                            .frame(width: 32, height: 32)
                                            .foregroundColor(.blue)
                                    }
                                }
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(tx.name)
                                        .font(.headline)
                                    Text(tx.subtitle)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text(String(format: "%@ $ %.2f", tx.isIncome ? "+" : "-", tx.amount))
                                    .font(.headline)
                                    .foregroundColor(tx.isIncome ? .green : .red)
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(24)
                .padding(.top, -24)
                Spacer()
            }
        }
    }
} 