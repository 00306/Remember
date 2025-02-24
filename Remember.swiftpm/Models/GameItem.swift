//
//  Item.swift
//  Remember
//
//  Created by 송지혁 on 2/21/25.
//

import SwiftUI

struct GameItem: Identifiable, Hashable {
    var id = UUID()
    let names: [String]
    let position: CGPoint
    let descriptions: [String]
    let sizes: [CGSize]
    var sounds: [String] = []
}
