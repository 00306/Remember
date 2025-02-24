//
//  Game.swift
//  Remember
//
//  Created by 송지혁 on 2/21/25.
//

import SwiftUI

struct Game: View {
    @EnvironmentObject var gameManager: GameManager
    @EnvironmentObject var audioManager: AudioManager
    
    var body: some View {
        VStack {
            if gameManager.stageTitleVisible {
                stageTitleView
                    .onAppear { hideStageTitle(after: 5) }
            } else {
                StageView(stage: gameManager.currentStageData) {
                    if gameManager.currentStageIndex == gameManager.stageData.count - 1 {
                        gameManager.endGame()
                    } else { gameManager.moveToNextStage() }
                    
                }
            }
        }
        .animation(.linear, value: gameManager.currentStage)
        .animation(.linear, value: gameManager.stageTitleVisible)
        .onAppear { audioManager.playBackgroundMusic(named: "game_background_music") }
    }
    
    private var stageTitleView: some View {
        Color.black
            .overlay {
                Text(gameManager.currentStageData.title)
                    .letterboxCaption(color: .white, size: 30)
            }
    }
    
    private func showStageTitle(after second: Double = 0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + second) {
            gameManager.showStageTitle()
        }
    }
    
    private func hideStageTitle(after second: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + second) {
            gameManager.hideStageTitle()
        }
    }
}
