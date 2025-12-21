

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    
    @State private var isAlertPresented = false
    @State private var username = ""
    @State private var isEditingUsername = false
    @State private var isLogIn = false
    
    var body: some View {
        ZStack {
            Color(red: 0.953, green: 0.957, blue: 0.973)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Text("Настройки")
                        .foregroundStyle(.primary).font(.largeTitle.bold())
                    Spacer()
                    VStack {
                        HStack {
                            Text("Аккаунт")
                                .font(.title2)
                                .foregroundStyle(.primary).font(.largeTitle)
                                .padding(.horizontal, 20)
                            Spacer()
                            Button {
                                isEditingUsername = true
                            } label: {
                                Image(systemName: "pencil")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.primary)
                                    .padding(.horizontal, 20)
                            }
                        }
                        HStack {
                            Image("cheburashka")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(style: StrokeStyle(lineWidth: 0.5)))
                                .padding(.horizontal, 15)
                            VStack {
                                Text(username)
                                    .font(.title)
                                    .foregroundStyle(.primary).font(.largeTitle)
                                    .padding(5)
                                Text("pochta123yandex.ru")
                                    .foregroundColor(.black)
                            }

                            Spacer()
                        }

                    }
                    .frame(height: 175)
                    .background(RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white))
                    .alert("Измените имя пользователя", isPresented: $isEditingUsername) {
                        Image("cheburashka")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(style: StrokeStyle(lineWidth: 0.5)))
                            .padding(.horizontal, 15)
                        TextField("", text: $username)
                        Button("Отмена", role: .destructive) {
                            print("Отмена")
                        }
                        Button("Сохранить", role: .cancel) {
                            print("Сохранено")
                        }
                    }

                    

                    HStack {
                        Image(systemName: "translate")
                            .resizable()
                            .frame(width: 35, height: 25)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                        Button {
                            print("изменить фотокарточку")
                        } label: {
                            Text("Изменить язык")
                                .foregroundStyle(Color.primary)
                        }
                        
                        Spacer()
                    }
                    .frame(height: 40)
                    .background(RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white))
                    .padding(.vertical, 10)
                 
                    
                    VStack {
                        HStack {
                            Text("Сброс данных")
                                .foregroundColor(.red)
                                .padding(10)
                            Spacer()
                            Button {
                                isAlertPresented = true
                            } label: {
                                Image(systemName: "trash")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.red)
                                    .padding(.horizontal, 20)
                            }
                            
                        }
                        
                        Text("Все чеки будут удалены. Восстановить их будет невозможно.")
                    }
                    .frame(height: 115)
                    .background(RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white))
                    .padding(.vertical, 10)
                    .alert("Вы уверенны?", isPresented: $isAlertPresented, actions: {
                        Button("Да", role: .destructive) {
                            print("удалено")
                        }
                        Button("Нет", role: .cancel) {
                            print("не удалено")
                        }
                    })
                    
                    Spacer()
                    
                    Button {
                        isLogIn = true
                    } label: {
                        Text("Выйти из аккауната")
                            .foregroundStyle(Color.red)
                    }
                    Text("Версия 1.0.0")
                        .foregroundColor(.secondary)
                            
                }
                .padding(.horizontal, 20)
                .alert("Вы уверенны?", isPresented: $isLogIn, actions: {
                    Button("Да", role: .destructive) {
                        do {
                            try Auth.auth().signOut()
                            print("Успешный выход из Firebase")
                        } catch {
                            print("Ошибка выхода: \(error.localizedDescription)")
                        }
                    }
                    Button("Нет", role: .cancel) {
                        print("Вы остались в аккаунте")
                    }
                })
                    }
                    
        }
    }
}

#Preview {
    SettingsView()
}
