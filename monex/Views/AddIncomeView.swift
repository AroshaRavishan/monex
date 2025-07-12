import SwiftUI

struct AddIncomeView: View {
    @State private var amount: String = ""
    @State private var selectedCategory = "Netflix"
    @State private var showCategoryPicker = false
    @State private var descriptionText = "$ 48.00"
    @State private var showInvoicePicker = false
    let categories = ["Netflix", "Spotify", "Amazon"]
    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemGroupedBackground).ignoresSafeArea()
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 40, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(height: 260)
                        .edgesIgnoringSafeArea(.top)
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Income")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 60)
                        Text("How much?")
                            .font(.title3)
                            .foregroundColor(.white.opacity(0.8))
                        Text("$0")
                            .font(.system(size: 38, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 28)
                }
                .padding(.bottom, 12)
                VStack(spacing: 24) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Transactions")
                            .font(.title3)
                            .fontWeight(.semibold)
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Category")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Button(action: { showCategoryPicker.toggle() }) {
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.white)
                                            .frame(width: 36, height: 36)
                                        Image(systemName: "n.circle.fill")
                                            .resizable()
                                            .frame(width: 28, height: 28)
                                            .foregroundColor(.red)
                                    }
                                    Text(selectedCategory)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.gray)
                                }
                                .padding(12)
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                            }
                            .actionSheet(isPresented: $showCategoryPicker) {
                                ActionSheet(title: Text("Select Category"), buttons: categories.map { cat in
                                    .default(Text(cat)) { selectedCategory = cat }
                                } + [.cancel()])
                            }
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Description")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            HStack {
                                TextField("", text: $descriptionText)
                                    .foregroundColor(.red)
                                    .font(.title3)
                                Spacer()
                                Button("Clear") { descriptionText = "" }
                                    .foregroundColor(.red)
                                    .font(.subheadline)
                            }
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.red, lineWidth: 2)
                            )
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            Text("INVOICE")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Button(action: { showInvoicePicker.toggle() }) {
                                HStack {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.gray)
                                    Text("Add Invoice")
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 48)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [6]))
                                        .foregroundColor(Color(.systemGray4))
                                )
                            }
                        }
                    }
                    Button(action: {}) {
                        Text("Continue")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(Color.blue)
                            .cornerRadius(14)
                    }
                }
                .padding(28)
                .background(Color.white)
                .cornerRadius(28)
                .shadow(color: Color.black.opacity(0.06), radius: 16, x: 0, y: 8)
                .padding(.horizontal, 8)
                .padding(.top, -32)
                Spacer()
            }
        }
    }
} 
