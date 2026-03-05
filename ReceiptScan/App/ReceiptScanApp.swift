import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
    // Отключаем оффлайн-кэш Firestore, чтобы избежать проблем с локальной БД (LevelDB lock)
    let db = Firestore.firestore()
    var settings = db.settings
    settings.isPersistenceEnabled = false
    db.settings = settings
      
    return true
  }
}

@main
struct ReceiptScanApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    @State private var isLoggedIn: Bool = false
    @StateObject private var expensesViewModel = ExpensesViewModel()
    
    
    var body: some View {
        content()
            .environmentObject(expensesViewModel)
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        isLoggedIn = true
                        expensesViewModel.startListening()
                    } else {
                        isLoggedIn = false
                        expensesViewModel.stopListeningAndClear()
                    }
                }
            }
    }
    @ViewBuilder
    func content() -> some View {
        if isLoggedIn {
            MainTabView()
        } else {
            StoryboardViewController()
        }
    }
}
