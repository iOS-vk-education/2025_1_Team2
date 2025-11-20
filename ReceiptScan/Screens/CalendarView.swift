import SwiftUI

struct CalendaryView: View {

    @State private var selectedDate: Date? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "F3F4F8")
                    .ignoresSafeArea(.all)
                VStack(spacing: 30) {
                    HStack {
                        Text("Календарь")
                            .foregroundStyle(.primary).font(.largeTitle)
                            .padding(.horizontal, 10)
                        Spacer()
                        Image("cheburashka")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .clipShape(.circle)
                            .padding(.horizontal)
                    }
                    DatePicker("", selection: Binding(
                        get: { selectedDate ?? Date() },
                        set: { newValue in selectedDate = newValue }
                    ),
                               displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .padding(-10)
                    
                    if selectedDate != nil {
                        VStack() {
                            HStack(){
                                Text("Ваши расходы: ")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 15)
                                Spacer()
                            }
                            HStack(spacing: 5) {
                                Circle()
                                    .fill(.green)
                                    .frame(width: 15, height: 15)
                                
                                Text("Еда: 1000 ₽")
                                    .font(.body)
                                    .fontWeight(.regular)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 30)
                            HStack(spacing: 5) {
                                Circle()
                                    .fill(.red)
                                    .frame(width: 15, height: 15)
                                
                                Text("Путешествия: 100347 ₽")
                                    .font(.body)
                                    .fontWeight(.regular)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 30)
                            HStack{
                                NavigationLink {
                                    DataInfoView()
                                } label: {
                                    HStack(spacing: 30) {
                                        Text("Посмотреть чеки")
                                        Image(systemName: "arrowshape.turn.up.forward.circle.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                    .frame(width: 200)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 20)
                                    .background(.indigo)
                                    .cornerRadius(200)
                                }
                                .padding(.vertical, 10)
                            }

                            
                            
                        }
                    }
                    
                    Spacer()
                }
            }
        }
    }
}




#Preview {
    CalendaryView()
}
