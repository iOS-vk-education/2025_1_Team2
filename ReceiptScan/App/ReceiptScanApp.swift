import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
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
    
    
    var body: some View {
        content()
        .onAppear {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    isLoggedIn = true
                } else {
                    isLoggedIn = false
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
