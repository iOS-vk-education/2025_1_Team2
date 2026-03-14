import SwiftUI
import Charts

struct AnalyticsView: View {

    @EnvironmentObject var expensesViewModel: ExpensesViewModel
    @State private var selectedIndex = 0
    
    private var filteredExpenses: [Expense] {
        let now = Date()
        let calendar = Calendar.current
        
        return expensesViewModel.expenses.filter { expense in
            switch selectedIndex {
            case 0:
                return calendar.isDate(expense.date, inSameDayAs: now)
            case 1:
                if let weekAgo = calendar.date(byAdding: .day, value: -7, to: now) {
                    return expense.date >= weekAgo && expense.date <= now
                }
                return false
            case 2:
                if let monthAgo = calendar.date(byAdding: .month, value: -1, to: now) {
                    return expense.date >= monthAgo && expense.date <= now
                }
                return false
            case 3:
                if let yearAgo = calendar.date(byAdding: .year, value: -1, to: now) {
                    return expense.date >= yearAgo && expense.date <= now
                }
                return false
            default:
                return true
            }
        }
    }
    
    private var analyticsData: [(name: String, sales: Int, total: Double)] {
        let grouped = Dictionary(grouping: filteredExpenses, by: { $0.category })
        
        return grouped.map { (category, expenses) in
            let total = expenses.reduce(0) { $0 + $1.amount }
            return (name: category, sales: Int(total.rounded()), total: total)
        }
        .sorted { $0.total > $1.total }
    }
    
    private var totalAmount: Double {
        analyticsData.reduce(0) { $0 + $1.total }
    }
    
    private var periodTitle: String {
        switch selectedIndex {
        case 0: return "День"
        case 1: return "Неделя"
        case 2: return "Месяц"
        case 3: return "Год"
        default: return ""
        }
    }

    var body: some View {
        ZStack {
            Color(hex: "#F3F4F8")
                .ignoresSafeArea()
            ScrollView{
                VStack(spacing: 20) {
                    HStack{
                        Text("Аналитика")
                            .foregroundStyle(.primary).font(.largeTitle.bold())
                            .padding(.horizontal, 25)
                        Spacer()
                    }
                    HStack(spacing: 40) {
                        Button("День") {
                            selectedIndex = 0
                        }
                        .foregroundColor(selectedIndex == 0 ? .indigo : .gray)
                        .font(.headline)
                        
                        Button("Неделя") {
                            selectedIndex = 1
                        }
                        .foregroundColor(selectedIndex == 1 ? .indigo : .gray)
                        .font(.headline)
                        
                        Button("Месяц") {
                            selectedIndex = 2
                        }
                        .foregroundColor(selectedIndex == 2 ? .indigo : .gray)
                        .font(.headline)
                        
                        Button("Год") {
                            selectedIndex = 3
                        }
                        .foregroundColor(selectedIndex == 3 ? .indigo : .gray)
                        .font(.headline)
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 35)
                        .fill(.white)
                    )
                    
                    if expensesViewModel.expenses.isEmpty {
                        VStack(spacing: 20) {
                            Text("Расходов пока нет")
                                .font(.title2.bold())
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                            
                            Text("Добавьте первый расход, чтобы увидеть аналитику.")
                                .font(.body)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                            
                            NavigationLink {
                                ManualInputView()
                            } label: {
                                Text("Добавить расход")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.indigo)
                                    .clipShape(RoundedRectangle(cornerRadius: 40))
                                    .padding(.horizontal, 40)
                            }
                        }
                        .padding(.top, 40)
                    } else {
                        VStack (spacing: -30){
                            ZStack{
                                PieChartView(data: analyticsData.map { (name: $0.name, sales: $0.sales) })
                                    .offset(y: -30)
                                
                                ZStack {
                                    VStack(spacing: 6){
                                        Text(periodTitle)
                                            .font(.title2)
                                            .foregroundColor(.gray.opacity(0.8))
                                        Text("Сумма расходов")
                                            .font(.title2)
                                            .foregroundColor(.gray.opacity(0.8))
                                        Text(String(format: "%.2f ₽", totalAmount))
                                            .font(.title)
                                    }
                                    .offset(y: -30)
                                }
                                .frame(width: 200, height: 200)
                                
                            }
                            VStack{
                                HStack{
                                    Text("Категории расходов")
                                        .font(.title2)
                                    Spacer()
                                }
                                .padding(.horizontal, 5)
                                
                                ForEach(analyticsData, id: \.name) { item in
                                    HStack{
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(Color(hex: "008BFF"))
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "folder.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(.white)
                                        }
                                        .padding(.leading, 10)
                                        VStack(spacing:0){
                                            Text(item.name)
                                                .font(.body)
                                                .foregroundStyle(.black)
                                                .padding(.leading, 5)
                                            let percent = totalAmount > 0 ? (item.total / totalAmount * 100) : 0
                                            Text(String(format: "%.1f%% от общего", percent))
                                                .font(.body)
                                                .foregroundStyle(.black.opacity(0.6))
                                                .padding(.leading, 5)
                                        }
                                        Spacer()
                                        Text(String(format: "%.2f ₽", item.total))
                                            .font(.body)
                                            .padding(.trailing, 10)
                                            .foregroundStyle(Color(hex: "008BFF"))
                                    }
                                    .frame(width: 370, height: 65)
                                    .background(.white)
                                    .cornerRadius(13)
                                }
                            }
                        }
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding()
                
            }
        }
    }
}

#Preview {
    AnalyticsView()
}
