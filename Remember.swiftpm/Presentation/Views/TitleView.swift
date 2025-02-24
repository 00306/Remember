//
//  TitleView.swift
//  Remember
//
//  Created by 송지혁 on 2/22/25.
//

import SwiftUI

struct TitleView: View {
    @State private var isTapped = false
    
    @EnvironmentObject var gameManager: GameManager
    
    var body: some View {
        ZStack {
            backgroundVideo
            goal
            caption
            
            blackBars
        }
        .onTapGesture {
            isTapped = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                gameManager.startGame()
            }
        }
        .animation(.easeInOut(duration: 2), value: isTapped)
    }
    
    private var backgroundVideo: some View {
        VideoView(name: "titleVideo", fileExtension: "mp4")
            .ignoresSafeArea()
            .overlay {
                Rectangle()
                    .fill(.ultraThinMaterial.opacity(0.8))
                    .padding(.vertical, 255)
            }
    }
    
    private var caption: some View {
        VStack(spacing: 3) {
            Text("Tap anywhere to remember")
                .letterboxCaption(color: .white, size: 40, tracking: 0)
                .opacity(isTapped ? 0 : 1)
                .animation(.linear(duration: 1), value: isTapped)
            
        }
        .frame(maxHeight: UIScreen.main.bounds.height, alignment: .bottom)
        .padding(.bottom, 230)
    }
    
    private var goal: some View {
        Text("remember")
            .letterboxCaption(color: .white, size: 40, tracking: 0)
            .opacity(isTapped ? 1: 0)
            .animation(.linear(duration: 3).delay(3), value: isTapped)
    }
    
    private var blackBars: some View {
        VStack(spacing: 0) {
            Color.black
                .frame(maxHeight: isTapped ? .infinity : 0)
            if !isTapped {
                Spacer()
            }
            Color.black
                .frame(maxHeight: isTapped ? .infinity : 0)
        }
        .animation(.easeOut(duration: 7), value: isTapped)
    }
}
