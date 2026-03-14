//
//  DataInfoView.swift
//  ReceiptScan
//
//  Created by Алина Кутузова on 20.11.2025.
//

import SwiftUI

struct DataInfoView: View {
    @EnvironmentObject var expensesViewModel: ExpensesViewModel
    
    let expense: Expense
    
    @State private var isAlertPresented = false
    @State private var isShow = true
    var body: some View {
        ZStack{
            Color(hex: "F3F4F8")
                .ignoresSafeArea(.all)
            ScrollView{
                VStack(spacing: 30) {
                    Text("Детали транзакции")
                        .foregroundStyle(.primary).font(.title.bold())
                        .padding(.horizontal, 25)
                    if isShow{
                        ZStack{
                            RoundedRectangle(cornerRadius: 32)
                                .frame(width: 360, height: 450)
                                .foregroundStyle(.white)
                            VStack{
                                ZStack{
                                    Circle()
                                        .frame(width: 80, height: 80)
                                        .foregroundStyle(Color(hex: "008BFF"))
                                    Image(systemName: "fork.knife")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(.white)
                                }
                                Text(expense.storeName.isEmpty ? "Магазин" : expense.storeName)
                                    .font(.title2)
                                    .foregroundStyle(.primary)
                                Text(formattedDate(expense.date))
                                    .font(.title3)
                                    .foregroundStyle(.primary)
                                    .foregroundStyle(.black.opacity(0.6))
                                Divider()
                                    .padding(.horizontal, 40)
                                Divider()
                                    .padding(.horizontal, 40)
                                HStack{
                                    Text("ИТОГО")
                                        .font(.title)
                                        .foregroundStyle(.black.opacity(0.6))
                                    Spacer()
                                    Text(String(format: "%.2f ₽", expense.amount))
                                        .font(.title)
                                }
                                .padding(.horizontal, 40)
                                Button{
                                    isAlertPresented = true
                                }label: {
                                    Image(systemName: "trash")
                                        .resizable()
                                        .frame(width: 28, height: 30)
                                        .foregroundStyle(.red)
                                        .padding(10)
                                }
                                .alert("Эта транзакция будет удалена. Восстановить его будет невозможно. Продолжить?", isPresented: $isAlertPresented, actions: {
                                    Button("Да", role: .destructive) {
                                        expensesViewModel.deleteExpense(expense) { _ in
                                            isShow = false
                                        }
                                    }
                                    Button("Нет", role: .cancel) {
                                    }
                                })
                            }
                            
                        }
                    }
                    
                }
            }
        }
    }
}

extension DataInfoView {
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

#Preview {
    DataInfoView(expense: Expense(id: "1", userId: "user", amount: 1250, category: "Продукты", storeName: "Магазин", date: Date(), createdAt: Date()))
        .environmentObject(ExpensesViewModel())
}
