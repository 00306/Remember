//
//  ItemView.swift
//  Remember
//
//  Created by 송지혁 on 2/21/25.
//

import SwiftUI

struct ItemView: View {
    let items: GameItem
    var getOnly = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var audioManager: AudioManager
    @State private var currentItemIndex = 0
    var itemDepth: Int { items.names.count }
    var clean: (() -> Void)?
    
    var body: some View {
        ZStack {
            background
            
            VStack(spacing: 0) {
                itemImage
                    .onAppear {
                        if currentItemIndex >= items.sounds.count { return }
                        audioManager.playEffectSound(named: items.sounds[currentItemIndex])
                    }
                
                itemInformation
            }
            
            actionButton()
        }
        
    }
    
    private var background: some View {
        Color.clear
            .ignoresSafeArea()
            .contentShape(Rectangle())
            .onTapGesture { dismiss() }
    }
    
    private var itemImage: some View {
        Image(items.names[currentItemIndex])
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 500, height: 500)
            .shadow(radius: 8)
    }
    
    private var itemInformation: some View {
        VStack(spacing: 0) {
            Text(items.names[currentItemIndex])
                .letterboxCaption(color: .white, size: 30)
                .padding(.bottom, 8)
            
            Text(items.descriptions[currentItemIndex])
                .letterboxCaption(color: .white, size: 15)
                .multilineTextAlignment(.center)
        }
    }
    
    private func nextItem() {
        if currentItemIndex + 1 < itemDepth {
            withAnimation(.linear) {
                currentItemIndex += 1
            }
        }
    }
    
    private func actionButton() -> some View {
        VStack {
            Spacer()
            Text(currentItemIndex == itemDepth - 1 ? getOnly ? "" : "Clean" : "Open")
                .letterboxCaption(color: .white, size: 20)
                .padding()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if currentItemIndex == itemDepth - 1 {
                clean?()
                dismiss()
            }
            else { nextItem() }
        }
    }
}
