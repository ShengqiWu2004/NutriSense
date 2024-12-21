import SwiftUI

public let activeColor = Color.accentColor //Color(red: 105/255, green: 169/255, blue: 27/255)
public let inactiveColor = Color.gray
struct ContentView: View {
    @State private var selectedTab: Tab = .foods // Keeps track of the selected tab
    
    enum Tab {
        case foods, reports, settings
    }
    
    var body: some View {
        VStack {
            Spacer() // Pushes content to the top
            
            // Show content based on selected tab
            Group {
                if selectedTab == .foods {
                    FoodsView()
                } else if selectedTab == .reports {
                    ReportsView()
                } else if selectedTab == .settings {
                    SettingsView()
                }
            }
            
            Spacer()
            
            // Custom Bottom AppBar
            HStack {
                Spacer()
                
                // Foods Button
                Button(action: {
                    selectedTab = .foods
                }) {
                    Image(systemName: "leaf")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(selectedTab == .foods ? activeColor : inactiveColor)
                }
                
                Spacer()
                
                // Reports Button
                Button(action: {
                    selectedTab = .reports
                }) {
                    Image(systemName: "doc.text.magnifyingglass")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(selectedTab == .reports ? activeColor : inactiveColor)
                }
                
                Spacer()
                
                // Settings Button
                Button(action: {
                    selectedTab = .settings
                }) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(selectedTab == .settings ? activeColor : inactiveColor)
                }
                
                Spacer()
            }
            .frame(height: 60) // Height of the AppBar
            .background(Color.white)
            .edgesIgnoringSafeArea(.bottom) // Extends background color under safe area
        }
    }
    
    // Colors for active and inactive icons

}







#Preview {
    ContentView()
        
}
