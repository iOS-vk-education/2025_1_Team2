import SwiftUI

struct CalendaryView: View {

    @State private var selectedDate: Date? = nil
    
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
                        
                        if selectedDate != nil {
                            VStack() {
                                HStack(){
                                    Spacer()
                                    Text("-4 250 ₽")
                                        .font(.body)
                                        .padding(.horizontal, 15)
                                }
                                HStack{
                                    Spacer()
                                    Text("24 октября, Пятница")
                                        .font(.body)
                                        .padding(.horizontal, -15)
                                }
                                
                                .padding(.horizontal, 30)
                                VStack (spacing:10){
                                    HStack{
                                        NavigationLink {
                                            DataInfoView()
                                        } label: {
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
                                                    Text("Пятерочка")
                                                        .font(.body)
                                                        .foregroundStyle(.black)
                                                        .padding(.leading, 5)
                                                    Text("Продукты")
                                                        .font(.body)
                                                        .foregroundStyle(.black.opacity(0.6))
                                                }
                                                Spacer()
                                                Text("-1 250 ₽")
                                                    .font(.body)
                                                    .padding(.trailing, 10)
                                                    .foregroundStyle(.black)
                                            }
                                            .frame(width: 370, height: 65)
                                            .background(.white)
                                            .cornerRadius(13)
                                        }
                                    }
                                    HStack{
                                        NavigationLink {
                                            DataInfoView()
                                        } label: {
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
                                                    Text("Яндекс такси")
                                                        .font(.body)
                                                        .foregroundStyle(.black)
                                                        .padding(.leading, 5)
                                                    Text("Транспорт")
                                                        .font(.body)
                                                        .foregroundStyle(.black.opacity(0.6))
                                                        .padding(.leading, -18)
                                                }
                                                Spacer()
                                                Text("450 ₽")
                                                    .font(.body)
                                                    .padding(.trailing, 10)
                                                    .foregroundStyle(.black)
                                            }
                                            .frame(width: 370, height: 65)
                                            .background(.white)
                                            .cornerRadius(13)
                                        }
                                    }
                                    HStack{
                                        NavigationLink {
                                            DataInfoView()
                                        } label: {
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
                                                    Text("Школково")
                                                        .font(.body)
                                                        .foregroundStyle(.black)
                                                        .padding(.leading, -20)
                                                    Text("Образование")
                                                        .font(.body)
                                                        .foregroundStyle(.black.opacity(0.6))
                                                        .padding(.leading, 5)
                                                }
                                                Spacer()
                                                Text("2 550 ₽")
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
                        
                        Spacer()
                    }
                }
            }
        }
    }
}




#Preview {
    CalendaryView()
}
