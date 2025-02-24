//
//  Stage.swift
//  Remember
//
//  Created by 송지혁 on 2/21/25.
//

struct StageData: Hashable {
    let title: String
    let stage: GameStage
    var items: [GameItem]
    var background: String
    
    var itemCount: Int { items.count }
}
