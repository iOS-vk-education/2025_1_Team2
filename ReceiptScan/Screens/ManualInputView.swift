
import SwiftUI

struct ManualInputView: View {
    
    @State var storename: String = ""
    @State var productcategory: String = "Категория"
    @State var price: String = ""
    @State private var isCategoryPickerExpanded = false
    @State private var showAddCategoryAlert = false
    @State private var newCategoryName = ""
    @State private var selectedDate: Date? = nil
    
   
    @State private var categories: [(name: String, icon: String, color: Color)] = [
        ("Продукты", "cart.fill", .primary),
        ("Транспорт", "car.fill", .primary),
        ("Развлечения", "film.fill", .primary),
        ("Одежда", "tshirt.fill", .primary)]
        
    
    var body: some View {
 
        ZStack {
            Color(red: 0.953, green: 0.957, blue: 0.973)
                .ignoresSafeArea()

            ScrollView {
                VStack {

                    Text("Добавить расход")
                        .foregroundStyle(.primary).font(.largeTitle)
                    

                    TextField("0 ₽", text: $price)
                        .font(.system(size: 40, weight: .bold))
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                        .padding()
                    
                    DatePicker("", selection: Binding(
                        get: { selectedDate ?? Date() },
                        set: { newValue in selectedDate = newValue }
                    ),
                               displayedComponents: [.date]
                    )
                    .datePickerStyle(.compact)
                    .padding(.trailing, 270)
                    .padding(.vertical, 10)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Категория")
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                        
                        Button {
                            withAnimation {
                                isCategoryPickerExpanded.toggle()
                            }
                        } label: {
                            HStack {
                                if let selectedCat = categories.first(where: { $0.name == productcategory }) {
                                    Image(systemName: selectedCat.icon)
                                        .foregroundColor(selectedCat.color)
                                        .frame(width: 22)
                                } else {
                                    Image(systemName: "folder")
                                        .foregroundColor(.gray)
                                        .frame(width: 22)
                                }
                                
                                Text(productcategory)
                                    .foregroundColor(productcategory == "Категория" ? .gray : .primary)
                                    .font(.system(size: 18, weight: .medium))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.gray)
                                    .rotationEffect(.degrees(isCategoryPickerExpanded ? 180 : 0))
                            }
                            .padding(16)
                            .background(Color.white)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                        .padding(.horizontal)

                        if isCategoryPickerExpanded {
                            VStack(spacing: 0) {
                                Button {
                                    showAddCategoryAlert = true
                                } label: {
                                    HStack {
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.blue)
                                            .frame(width: 22)
                                        
                                        Text("Добавить категорию")
                                            .foregroundColor(.blue)
                                        
                                        Spacer()
                                    }
                                    .padding(14)
                                }
                                .background(Color.white)
                                
                                Divider()
                                    .padding(.leading, 40)
                                
                                ForEach(categories, id: \.name) { category in
                                    Button {
                                        productcategory = category.name
                                        isCategoryPickerExpanded = false
                                    } label: {
                                        HStack {
                                            Image(systemName: category.icon)
                                                .foregroundColor(category.color)
                                                .frame(width: 22)
                                            
                                            Text(category.name)
                                                .foregroundColor(.primary)
                                            
                                            Spacer()
                                            
                                            if productcategory == category.name {
                                                Image(systemName: "checkmark")
                                                    .foregroundColor(.blue)
                                            }
                                        }
                                        .padding(14)
                                    }
                                    .background(Color.white)
                                    
                                    if category.name != categories.last?.name {
                                        Divider()
                                            .padding(.leading, 40)
                                    }
                                }
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                    .shadow(color: .gray.opacity(0.1), radius: 5, x: 0, y: 2)
                            )
                            .padding(.horizontal)
                        }
                    }
                    TextField("Название магазина", text: $storename)
                        .textFieldStyle(.plain)
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .stroke(Color.gray, lineWidth: 0.5))
                        .font(.system(size: 18, weight: .medium))
                        .padding(15)
                    
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
        .alert("Новая категория", isPresented: $showAddCategoryAlert) {
            TextField("Название категории", text: $newCategoryName)
            
            Button("Отмена", role: .destructive) {
                newCategoryName = ""
            }
            
            Button("Добавить", role: .cancel) {
                addNewCategory()
            }
        }
    }
    private func addNewCategory() {
        let trimmedName = newCategoryName.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedName.isEmpty,
              !categories.contains(where: { $0.name.lowercased() == trimmedName.lowercased() }) else {
            
            if let existingCategory = categories.first(where: { $0.name.lowercased() == trimmedName.lowercased() }) {
                productcategory = existingCategory.name
                isCategoryPickerExpanded = false
            }
            
            newCategoryName = ""
            return
        }
        
        let newCategory = (name: trimmedName, icon: "ellipsis.circle.fill", color: Color.primary)
        categories.append(newCategory)
        
        categories.sort { $0.name < $1.name }
        
        productcategory = trimmedName
        isCategoryPickerExpanded = false
        
        newCategoryName = ""
    }
        
}


#Preview {
    ManualInputView()
}
