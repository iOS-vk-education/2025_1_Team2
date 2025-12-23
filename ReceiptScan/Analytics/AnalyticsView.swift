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
                    VStack (spacing: -30){
                        ZStack{
                            PieChartView(data: data)
                            
                                .offset(y: -30)
                            ZStack {
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
                        VStack{
                            HStack{
                                Text("Категории расходов")
                                    .font(.title2)
                                Spacer()
                            }
                            .padding(.horizontal, 5)
                            
                            HStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(Color(hex: "008BFF"))
                                        .frame(width: 40, height: 40)
                                    Image(systemName: "fork.knife")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundStyle(.white)
                                }
                                .padding(.leading, 10)
                                VStack(spacing:0){
                                    Text("Продукты")
                                        .font(.body)
                                        .foregroundStyle(.black)
                                        .padding(.leading, -50)
                                    Text("33,3% от общего")
                                        .font(.body)
                                        .foregroundStyle(.black.opacity(0.6))
                                        .padding(.leading, 5)
                                }
                                Spacer()
                                Text("22 000 ₽")
                                    .font(.body)
                                    .padding(.trailing, 10)
                                    .foregroundStyle(Color(hex: "008BFF"))
                            }
                            .frame(width: 370, height: 65)
                            .background(.white)
                            .cornerRadius(13)
                            
                            HStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(Color(hex: "FF8500"))
                                        .frame(width: 40, height: 40)
                                    Image(systemName: "bus.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundStyle(.white)
                                }
                                .padding(.leading, 10)
                                VStack(spacing:0){
                                    Text("Транспорт")
                                        .font(.body)
                                        .foregroundStyle(.black)
                                        .padding(.leading, -50)
                                    Text("20,9% от общего")
                                        .font(.body)
                                        .foregroundStyle(.black.opacity(0.6))
                                        .padding(.leading, 5)
                                }
                                Spacer()
                                Text("17 547 ₽")
                                    .font(.body)
                                    .padding(.trailing, 10)
                                    .foregroundStyle(Color(hex: "FF8500"))
                            }
                            .frame(width: 370, height: 65)
                            .background(.white)
                            .cornerRadius(13)
                            
                            HStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(Color(hex: "00C4ED"))
                                        .frame(width: 40, height: 40)
                                    Image(systemName: "graduationcap")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundStyle(.white)
                                }
                                .padding(.leading, 10)
                                VStack(spacing:0){
                                    Text("Образование")
                                        .font(.body)
                                        .foregroundStyle(.black)
                                        .padding(.leading, -20)
                                    Text("19,7% от общего")
                                        .font(.body)
                                        .foregroundStyle(.black.opacity(0.6))
                                        .padding(.leading, 5)
                                }
                                Spacer()
                                Text("16 207 ₽")
                                    .font(.body)
                                    .padding(.trailing, 10)
                                    .foregroundStyle(Color(hex: "00C4ED"))
                            }
                            .frame(width: 370, height: 65)
                            .background(.white)
                            .cornerRadius(13)
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
