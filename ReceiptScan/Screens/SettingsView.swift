

import SwiftUI

struct SettingsView: View {
    
    @State private var isAlertPresented = false
    @State private var username = ""
    @State private var isEditingUsername = false
    @State private var isDarkModeEnabled: Bool = false
    @State private var isNotificationsEnabled: Bool = true
    
    var body: some View {
        ZStack {
            Color(red: 0.953, green: 0.957, blue: 0.973)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            isEditingUsername = true
                        } label: {
                            Image(systemName: "pencil")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.primary)
                                .padding(.horizontal, 20)
                        }
                    }
                    .alert("Измените имя пользователя", isPresented: $isEditingUsername) {
                        TextField("", text: $username)
                        Button("Отмена", role: .destructive) {
                            print("Отмена")
                        }
                        Button("Сохранить", role: .cancel) {
                            print("Сохранено")
                        }
                    }
                    
                    Image("cheburashka")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(style: StrokeStyle(lineWidth: 0.5)))
                    Text(username)
                        .font(.title)
                        .foregroundStyle(.primary).font(.largeTitle)
                        .padding(5)
                    HStack {
                        Button {
                            print("изменить фотокарточку")
                        } label: {
                            Image(systemName: "photo.badge.plus")
                                .resizable()
                                .frame(width: 35, height: 25)
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                        }
                        
                        Text("Изменить фото")
                        Spacer()
                    }
                    .frame(height: 40)
                    .background(RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white))
                    .padding(20)
                    ZStack {
                        Color(hex: "0D0B20")
                            .frame(height: 140)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        VStack {
                            HStack {
                                Text("Основые настройки")
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.top)
                            ZStack {
                                
                                Color.white
                                    .frame(height: 110)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                VStack {
                                    HStack {
                                        Image(systemName: "moon")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(.black)
                                            .padding(.horizontal)
                                        Text("Темная тема")
                                            .foregroundColor(.black)
                                        Spacer()
                                        Toggle(isOn: $isDarkModeEnabled) {
                                            
                                        }
                                        .tint(.indigo)
                                        .padding(.horizontal, 10)
                                    }
                                    
                                    HStack {
                                        Image(systemName: "bell")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(.black)
                                            .padding(.horizontal)
                                        Text("Уведомления")
                                            .foregroundColor(.black)
                                        Spacer()
                                        Toggle(isOn: $isNotificationsEnabled) {
                                            
                                        }
                                        .tint(.indigo)
                                        .padding(.horizontal, 10)
                                    }
                                }
                            }
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    ZStack {
                        Color(hex: "0D0B20")
                            .frame(height: 110)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        VStack {
                            HStack {
                                Text("Сброс данных")
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.top)
                            ZStack {
                                
                                Color.white
                                    .frame(height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                Button {
                                    isAlertPresented = true
                                } label: {
                                    Text("Удалить данные")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .frame(width: 300)
                                        .padding(12)
                                        .background(Color.indigo)
                                        .clipShape(RoundedRectangle(cornerRadius: 250))
                                    
                                    
                                }
                                .alert("Все чеки будут удалены. Восстановить их будет невозможно. Продолжить?", isPresented: $isAlertPresented, actions: {
                                    Button("Да", role: .destructive) {
                                        print("удалено")
                                    }
                                    Button("Нет", role: .cancel) {
                                        print("не удалено")
                                    }
                                })
                                
                                
                            }
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    ZStack {
                        Color(hex: "0D0B20")
                            .frame(height: 125)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        VStack {
                            HStack {
                                Text("Информация")
                                    .foregroundColor(.white)
                                    .padding(1)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.top)
                            ZStack {
                                
                                Color.white
                                    .frame(height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                VStack {
                                    HStack {
                                        Text("Версия")
                                            .foregroundColor(.black)
                                            .font(.body)
                                        Spacer()
                                        Text("1.0.0")
                                            .foregroundColor(.black)
                                            .font(.body)
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 7)
                                    
                                    HStack {
                                        Text("Последнее обновление")
                                            .foregroundColor(.black)
                                            .font(.body)
                                        Spacer()
                                        Text("Нояб 2025")
                                            .foregroundColor(.black)
                                            .font(.body)
                                    }
                                    .padding(.horizontal, 20)
                                }
                            }
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                    
                }
                
            }
        }.ignoresSafeArea(.keyboard)
    }
}

#Preview {
    SettingsView()
}
