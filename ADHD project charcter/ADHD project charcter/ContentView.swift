import SwiftUI

struct ContentView: View {
    
    @State var appUser: AppUser? = nil
    
    var body: some View {
        VStack {
            // You can check if the appUser is logged in and show relevant views accordingly
            if appUser == nil {
                // Show LoginView if the user is not authenticated
                LoginView(appUser: $appUser)
            } else {
                // Show other content when logged in
            }
        }
        .onAppear {
            // Optionally, check for current session and update appUser
            Task {
                // Simulate checking user session (e.g., getCurrentSession)
                self.appUser = try? await AuthManager.shared.getCurrentSession()
            }
        }
    }
}
