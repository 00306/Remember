//
//  File.swift
//  Remember
//
//  Created by 송지혁 on 2/23/25.
//

import SwiftUI

struct LetterBoxCaption: ViewModifier {
    let size: CGFloat
    let color: Color
    let tracking: CGFloat
    
    func body(content: Content) -> some View {
        content
            .tracking(tracking)
            .foregroundStyle(color)
            .font(.custom("HelveticaNeue-Thin", fixedSize: size))
            .shadow(color: .black, radius: 10, x: 0, y: 1)
    }
}

extension View {
    func letterboxCaption(color: Color, size: CGFloat, tracking: CGFloat = 0) -> some View {
        self.modifier(LetterBoxCaption(size: size, color: color, tracking: tracking))
    }
}

