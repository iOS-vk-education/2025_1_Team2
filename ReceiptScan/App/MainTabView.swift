
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ManualInputView()
                .tag(0)
                .tabItem {
                    Image(systemName: "plus")
                }
            
            AnalyticsView()
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
    }
}

#Preview {
    MainTabView()
}
