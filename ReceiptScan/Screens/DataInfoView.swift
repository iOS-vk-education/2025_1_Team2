//
//  DataInfoView.swift
//  ReceiptScan
//
//  Created by Алина Кутузова on 20.11.2025.
//

import SwiftUI

struct DataInfoView: View {
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
                                Text("Пятерочка")
                                    .font(.title2)
                                    .foregroundStyle(.primary)
                                Text("24 октября 2025")
                                    .font(.title3)
                                    .foregroundStyle(.primary)
                                    .foregroundStyle(.black.opacity(0.6))
                                Divider()
                                    .padding(.horizontal, 40)
                                HStack{
                                    Text("Кофе в эернах 1 кг")
                                        .font(.body)
                                    Spacer()
                                    Text("1 024,86 ₽")
                                }
                                .padding(.horizontal, 40)
                                .padding(.vertical, 10)
                                
                                HStack{
                                    Text("Картофель Эконом")
                                        .font(.body)
                                    Spacer()
                                    Text("120,44 ₽")
                                }
                                .padding(.horizontal, 40)
                                .padding(.vertical, 10)
                                
                                HStack{
                                    Text("Капуста китайская")
                                        .font(.body)
                                    Spacer()
                                    Text("104,57 ₽")
                                }
                                .padding(.horizontal, 40)
                                .padding(.vertical, 10)
                                
                                Divider()
                                    .padding(.horizontal, 40)
                                HStack{
                                    Text("ИТОГО")
                                        .font(.title)
                                        .foregroundStyle(.black.opacity(0.6))
                                    Spacer()
                                    Text("1250 ₽")
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
                                        isShow = false
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

#Preview {
    DataInfoView()
}
