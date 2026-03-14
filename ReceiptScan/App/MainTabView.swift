import SwiftUI
import FirebaseAuth

struct MainTabView: View {
    @State var showAuth = false

    var body: some View {
        TabView {
            ManualInputView()
                .tag(0)
                .tabItem {
                    Image(systemName: "plus")
                }
            
            NavigationStack {
                AnalyticsView()
            }
                .tag(1)
                .tabItem {
                    Image(systemName: "chart.bar.xaxis.ascending")
                }
            
            ScannerView()
                .tag(2)
                .tabItem {
                    Image(systemName: "text.viewfinder")
                }
            
            CalendaryView()
                .tag(3)
                .tabItem {
                    Image(systemName: "calendar")
                }
            
            SettingsView()
                .tag(4)
                .tabItem {
                    Image(systemName: "gear")
                }
        }
        .accentColor(.indigo)
        .onAppear {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    showAuth = false
                } else {
                    showAuth = true
                }
            }
        }
        .sheet(isPresented: $showAuth) {
            StoryboardViewController()
                .interactiveDismissDisabled()
        }
    }
}

#Preview {
    MainTabView()
}
