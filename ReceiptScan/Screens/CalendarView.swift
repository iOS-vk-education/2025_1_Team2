import SwiftUI

struct CalendaryView: View {

    @EnvironmentObject var expensesViewModel: ExpensesViewModel
    @State private var selectedDate: Date? = Date()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "F3F4F8")
                    .ignoresSafeArea(.all)
                ScrollView{
                    VStack(spacing: 0) {
                        HStack{
                            Text("Календарь")
                                .foregroundStyle(.primary).font(.largeTitle.bold())
                                .padding(.horizontal, 25)
                            Spacer()
                        }
                        
                        if expensesViewModel.expenses.isEmpty {
                            VStack(spacing: 20) {
                                Text("Расходов пока нет")
                                    .font(.title2.bold())
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                
                                Text("Добавьте первый расход, чтобы увидеть операции в календаре.")
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
                            
                            Spacer()
                        } else {
                        ZStack{
                            DatePicker("", selection: Binding(
                                get: { selectedDate ?? Date() },
                                set: { newValue in selectedDate = newValue }
                            ),
                                       displayedComponents: [.date]
                            )
                            
                            .datePickerStyle(.graphical)
                            .padding(15)
                            .background(.white)
                            .cornerRadius(32)
                            .padding(15)
                            .shadow(radius: 0.5)
                            
                            
                        }
                        
                        if let selectedDate {
                            let expensesForDay = expensesViewModel.expenses.filter {
                                Calendar.current.isDate($0.date, inSameDayAs: selectedDate)
                            }
                            
                            if !expensesForDay.isEmpty {
                                let total = expensesForDay.reduce(0) { $0 + $1.amount }
                                
                                VStack {
                                    HStack(){
                                        Spacer()
                                        Text(String(format: "-%.2f ₽", total))
                                            .font(.body)
                                            .padding(.horizontal, 15)
                                    }
                                    HStack{
                                        Spacer()
                                        Text(formattedDate(selectedDate))
                                            .font(.body)
                                            .padding(.horizontal, -15)
                                    }
                                    
                                    .padding(.horizontal, 30)
                                    VStack (spacing:10){
                                        ForEach(expensesForDay) { expense in
                                            NavigationLink {
                                                DataInfoView(expense: expense)
                                            } label: {
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
                                                        Text(expense.storeName.isEmpty ? "Магазин" : expense.storeName)
                                                            .font(.body)
                                                            .foregroundStyle(.black)
                                                            .padding(.leading, 5)
                                                        Text(expense.category)
                                                            .font(.body)
                                                            .foregroundStyle(.black.opacity(0.6))
                                                    }
                                                    Spacer()
                                                    Text(String(format: "-%.2f ₽", expense.amount))
                                                        .font(.body)
                                                        .padding(.trailing, 10)
                                                        .foregroundStyle(.black)
                                                }
                                                .frame(width: 370, height: 65)
                                                .background(.white)
                                                .cornerRadius(13)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    }
                }
            }
        }
    }
}

extension CalendaryView {
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

#Preview {
    CalendaryView()
}
