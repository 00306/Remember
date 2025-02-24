import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        let gameManager = GameManager()
        let audioManager = AudioManager()
        
        WindowGroup {
            ContentView()
                .environmentObject(gameManager)
                .environmentObject(audioManager)
        }
    }
}
