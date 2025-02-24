//
//  File.swift
//  Remember
//
//  Created by 송지혁 on 2/22/25.
//

import SwiftUI

enum GameState {
    case start
    case end
    case title
}

class GameManager: ObservableObject {
    @Published var gameState: GameState = .title
    @Published var stageTitleVisible = true
    @Published var currentStage: GameStage = .youth
    @Published var currentStageIndex = 0
    
    let stageData: [StageData] = [
        StageData(title: "Never Bloomed", stage: .youth, items: [
            GameItem(names: ["Suit Jacket"],
                     position: CGPoint(x: 30, y: 100),
                     descriptions: ["A brand-new suit jacket.\nIt looks like it was never worn."],
                     sizes: [CGSize(width: 200, height: 200)],
                     sounds: ["suit_jacket_sound"]),
            
            GameItem(names: ["Books"],
                     position: CGPoint(x: -50, y: 400),
                     descriptions: ["A stack of job prep books.\nEvery single page has been filled out."],
                     sizes: [CGSize(width: 300, height: 300)],
                     sounds: ["book_put_sound"]),
            
            GameItem(names: ["Resumes"],
                     position: CGPoint(x: 130, y: 420),
                     descriptions: ["A pile of resumes.\nAt least a hundred of them."],
                     sizes: [CGSize(width: 200, height: 200)],
                     sounds: ["resume_sound"]),
            
            GameItem(names: ["Passport"],
                     position: CGPoint(x: 180, y: 400),
                     descriptions: ["A passport with no departure stamps."],
                     sizes: [CGSize(width: 70, height: 70)],
                     sounds: ["lottery_sound"]),
            
            GameItem(names: ["Soju Bottle"],
                     position: CGPoint(x: 450, y: 420),
                     descriptions: ["Empty soju bottles.\nA few remain untouched."],
                     sizes: [CGSize(width: 200, height: 200)],
                     sounds: ["glass_bottle_clink"]),
        ], background: "youth_background"),
        
        StageData(title: "Severed Connections", stage: .middle, items: [
            GameItem(names: ["Graduation Photo"],
                     position: CGPoint(x: 20, y: -100),
                     descriptions: ["A university graduation photo.\nEveryone looks happy."],
                     sizes: [CGSize(width: 50, height: 50)],
                     sounds: ["resume_sound"]),
            
            GameItem(names: ["Medal"],
                     position: CGPoint(x: -50, y: 40),
                     descriptions: ["A gold medal.\nThey must have been a top student."],
                     sizes: [CGSize(width: 60, height: 60)],
                     sounds: ["medal_clink"]),
            
            GameItem(names: ["Drugs"],
                     position: CGPoint(x: -380, y: -170),
                     descriptions: ["Pills. A lot of them."],
                     sizes: [CGSize(width: 100, height: 100)],
                     sounds: ["pill_bottle_sound"]),
            
            
            GameItem(names: ["Diary"],
                     position: CGPoint(x: 570, y: -170),
                     descriptions: ["\"I’m in so much pain...\nBut I must fight through it.\""],
                     sizes: [CGSize(width: 100, height: 100)],
                     sounds: ["lottery_sound"]),
            
            GameItem(names: ["Phone"],
                     position: CGPoint(x: 370, y: 80),
                     descriptions: [" A phone with sent messages...To spam texts.\nWhy would they reply?"],
                     sizes: [CGSize(width: 100, height: 100)],
                     sounds: ["book_put_sound"]),
            
        ], background: "middle_background"),
        
        StageData(title: "Left Behind", stage: .aged, items: [
            GameItem(names: ["Medical Report"],
                     position: CGPoint(x: 440, y: 270),
                     descriptions: ["A medical report.\nSo many conditions listed."],
                     sizes: [CGSize(width: 100, height: 100)],
                     sounds: ["plate_put_down"]),
            
            GameItem(names: ["Suit Shoes"],
                     position: CGPoint(x: -160, y: 320),
                     descriptions: ["A pair of new dress shoes.\nPerfectly clean. Never worn."],
                     sizes: [CGSize(width: 100, height: 100)],
                     sounds: ["suit_shoes_sound"]),
            
            GameItem(names: ["Lottery"],
                     position: CGPoint(x: 150, y: 270),
                     descriptions: ["A lottery ticket.\nThe numbers read 971203."],
                     sizes: [CGSize(width: 50, height: 50)],
                     sounds: ["lottery_sound"]),
            
            GameItem(names: ["Young Man Photo"],
                     position: CGPoint(x: 180, y: -190),
                     descriptions: [" A photo of a young man.\nStanding on a beach."],
                     sizes: [CGSize(width: 60, height: 60)],
                     sounds: ["resume_sound"]),
            
            GameItem(names: ["Mystery Envelop", "Wedding Photo"],
                     position: CGPoint(x: -200, y: -250),
                     descriptions: ["A sealed envelope.\nOn the back, it says: \"Must keep this.\"",
                                    "An old wedding photo of an Asian couple."],
                     sizes: [CGSize(width: 150, height: 150),
                             CGSize(width: 100, height: 100)],
                    
                     sounds: ["envelop_open_sound", "resume_sound"]),
            

        ], background: "aged_background"),
    ]
    
    var currentStageData: StageData { stageData[currentStageIndex] }
    
    func startGame() {
        gameState = .start
    }
    
    func endGame() {
        gameState = .end
    }
    
    func moveToNextStage() {
        let nextIndex = currentStageIndex + 1
        if nextIndex < stageData.count {
            currentStageIndex = nextIndex
            showStageTitle()
        }
    }
    
    func moveToTitle() {
        gameState = .title
    }
    
    func showStageTitle() {
        stageTitleVisible = true
    }
    
    func hideStageTitle() {
        stageTitleVisible = false
    }
    
    func reset() {
        stageTitleVisible = true
        currentStage = .youth
        currentStageIndex = 0
    }
}
