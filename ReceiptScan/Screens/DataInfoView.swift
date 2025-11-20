//
//  DataInfoView.swift
//  ReceiptScan
//
//  Created by Алина Кутузова on 20.11.2025.
//

import SwiftUI

struct DataInfoView: View {

    var body: some View {
        ScrollView{
            VStack {
                HStack {
                    Text("Все чеки за выбранную дату:")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(20)
                    Spacer()
                }
                Image("check")
                    .resizable()
                    .frame(width: 300, height: 500)
                    .cornerRadius(10)
                    .padding()
                Image("check")
                    .resizable()
                    .frame(width: 300, height: 500)
                    .cornerRadius(10)
                    .padding()
                Spacer()
            }
        }
            
    }
}

#Preview {
    DataInfoView()
}
