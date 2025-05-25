import SwiftUI
import Firebase

@main
struct TaskManagerApp: App {
    init() {
        FirebaseApp.configure()
        NotificationManager.shared.requestAuthorization()
    }
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
} 