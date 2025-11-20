//
//  PieChart.swift
//  ReceiptScan
//
//  Created by Алина Кутузова on 20.11.2025.
//

import SwiftUI
import Charts

struct PieChartView: View {
    

    let data: [(name: String, sales: Int)]

    var body: some View {
        Chart(data, id: \.name) { name, sales in
            SectorMark(
                angle: .value("Sales", sales),
                innerRadius: .ratio(0.0),
                outerRadius: .ratio(1.0),
                angularInset: 1
            )
            .cornerRadius(4)
            .foregroundStyle(by: .value("Категория", name))
            
        }
        .frame(height: 320)
        .padding(30)
        .chartLegend(.hidden)
    }
}
