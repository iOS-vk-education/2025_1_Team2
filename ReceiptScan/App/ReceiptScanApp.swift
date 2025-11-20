
import SwiftUI

@main
struct ReceiptScanApp: App {
    
    var loggedIn: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if loggedIn {
                MainTabView()
            } else {
                StoryboardViewController()
            }
        }
    }
}
