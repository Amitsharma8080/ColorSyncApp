import SwiftUI
import Firebase

@main
struct AssignmentApp: App {
    init() {
        FirebaseApp.configure()  // Firebase initialize
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

