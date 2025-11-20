
import SwiftUI

@main
struct ReceiptScanApp: App {
    
    var isLoggedIn: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainTabView()
            } else {
                StoryboardViewController()
            }
        }
    }
}
