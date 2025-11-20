
import SwiftUI

struct ManualInputView: View {
    
    @State var storename: String = ""
    @State var productname: String = ""
    @State var productcategory: String = ""
    @State var quantity: String = ""
    @State var price: String = ""
    
    var body: some View {
 
        ZStack {
            Color(red: 0.953, green: 0.957, blue: 0.973)
                .ignoresSafeArea()

            ScrollView {
                VStack {
                    HStack {
                        
                        Spacer()
                        
                        Image("cheburashka")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                        
                    }
                    .padding(10)
                    Text("Ручной ввод")
                        .foregroundStyle(.primary).font(.largeTitle)
                    CustomTextField(label: "Название магазина", text: $storename)
                    CustomTextField(label: "Категория товара", text: $productcategory)
                    CustomTextField(label: "Название товара", text: $productname)
                    CustomTextField(label: "Количество товаров", text: $quantity)
                    CustomTextField(label: "Цена товара", text: $price)
                    Button {
                        print("Сохранено")
                    } label: {
                        Text("Сохранить")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.indigo)
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                            .padding()
                        
                    }
                    Spacer()
                    
                    
                }
            }
            .ignoresSafeArea(.keyboard)

        }
        
    }
        
}

struct CustomTextField: View {
    let label: String
    @Binding var text: String
    
    var body: some View {
        TextField(label, text: $text)
            .textFieldStyle(.plain)
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .stroke(Color.gray, lineWidth: 0.5))
            .font(.system(size: 18, weight: .medium))
            .padding(10)
    }
}

#Preview {
    ManualInputView()
}
