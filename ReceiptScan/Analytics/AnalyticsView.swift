import SwiftUI
import Charts

struct AnalyticsView: View {

    @State private var selectedIndex = 0

    let data = [
        (name: "Еда", sales: 9631),
        (name: "Одежда", sales: 6959),
        (name: "Путешествия", sales: 4891),
        (name: "Красота", sales: 2506),
        (name: "Образование", sales: 1777),
        (name: "Транспорт", sales: 625),
        (name: "Другое", sales: 62)
    ]

    var body: some View {
        ZStack {
            Color(hex: "#F3F4F8")
                .ignoresSafeArea()

            VStack(spacing: 40) {
                HStack {
                    Text("Аналитика")
                        .foregroundStyle(.primary).font(.largeTitle)
                        .padding(.horizontal, 20)
                    Spacer()
                    Image("cheburashka")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .foregroundColor(.primary)
                        .padding(.horizontal)
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
                VStack (spacing: -30){
                    ZStack{
                        PieChartView(data: data)
                        
                            .offset(y: -30)
                        ZStack {
                            Circle()
                                .fill(Color(hex: "#F3F4F8"))
                                .frame(width: 250, height: 250)
                                .offset( y: -28)
                            VStack(spacing: 6){
                                Text("Неделя")
                                    .font(.title2)
                                    .foregroundColor(.gray.opacity(0.8))
                                Text("Сумма расходов")
                                    .font(.title2)
                                    .foregroundColor(.gray.opacity(0.8))
                                Text("64,489.43 ₽")
                                    .font(.title)
                            }
                            .offset(y: -30)
                        }
                        .frame(width: 200, height: 200)
                        
                    }
                    VStack(spacing: 8){
                        HStack(spacing: 20) {
                            HStack {
                                Circle()
                                    .fill(.orange)
                                    .frame(width: 10, height: 10)
                                Text("Транспорт")
                                    .font(.body)
                            }
                            HStack{
                                Circle()
                                    .fill(.purple)
                                    .frame(width: 10, height: 10)
                                Text("Одежда")
                                    .font(.body)
                            }
                            HStack{
                                Circle()
                                    .fill(.green)
                                    .frame(width: 10, height: 10)
                                Text("Путешествия")
                                    .font(.body)
                            }
                            
                        }
                        HStack(spacing:20) {
                            HStack{
                                Circle()
                                    .fill(.blue)
                                    .frame(width: 10, height: 10)
                                Text("Еда")
                                    .font(.body)
                            }
                            HStack{
                                Circle()
                                    .fill(.cyan)
                                    .frame(width: 10, height: 10)
                                Text("Образование")
                                    .font(.body)
                            }
                            HStack{
                                Circle()
                                    .fill(.red)
                                    .frame(width: 10, height: 10)
                                Text("Другое")
                                    .font(.body)
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

#Preview {
    AnalyticsView()
}
