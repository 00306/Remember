import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameManager: GameManager
    
    var body: some View {
        switch gameManager.gameState {
            case .start: Game()
            case .end: EndView()
            case .title: TitleView()
        }
    }
}

